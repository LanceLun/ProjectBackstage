using EFModels.EFModels;
using Orders.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Security.Principal;
using System.Web;
using System.Web.Mvc;

namespace flexbackend.site.Controllers
{
	public class OrdersController : Controller
	{
        // GET: Orders
        public ActionResult OrdersIndex(string searchString, string statusFilter)
		{
			IEnumerable<OrdersIndexVM> orders = GetOrders(searchString,statusFilter);
			
			return View(orders);

		}

		[HttpPost]
		private IEnumerable<OrdersIndexVM> GetOrders(string searchString, string statusFilter)
		{
			var db = new AppDbContext();
			var orders = db.orders
				.AsNoTracking();

			if (!string.IsNullOrEmpty(searchString) && int.TryParse(searchString, out int memberId))
			{
				orders = (System.Data.Entity.Infrastructure.DbQuery<order>)orders.Where(o => o.fk_member_Id == memberId);
			}
			if (!string.IsNullOrEmpty(statusFilter) && int.TryParse(statusFilter, out int statusId))
			{
				orders = (System.Data.Entity.Infrastructure.DbQuery<order>)orders.Where(o => o.order_status_Id == statusId);
			}
			var orderStatuses = db.order_statuses.AsNoTracking().ToDictionary(os => os.Id, os => os.order_status);
			TempData["orderStatuses"] = orderStatuses ?? new Dictionary<int, string>();
            ViewData["orderStatuses"] = orderStatuses ?? new Dictionary<int, string>();
            var paymethods = db.pay_methods.AsNoTracking().ToDictionary(pd => pd.Id, pd => pd.pay_method);
			TempData["PayMethods"] = paymethods ?? new Dictionary<int, string>();
			var LogisticsCompanies = db.logistics_companies.AsNoTracking().ToDictionary(lc => lc.Id, lc => lc.name);
			TempData["LogisticsCompanies"] = LogisticsCompanies ?? new Dictionary<int, string>();
			var paystatuses = db.pay_statuses.AsNoTracking().ToDictionary(ps => ps.Id, ps => ps.pay_status);
			TempData["paystatuses"] = paystatuses ?? new Dictionary<int, string>();

			return orders.ToList()
                .Select(p =>
                {
                    var orderItems = GetOrderItemsIndex(p.Id);
                    int totalDiscountSubtotal = (int)orderItems.Sum(oi => oi.discount_subtotal);
                    int totalquantity = (int)orderItems.Sum(oi => oi.quantity);

                    return new OrdersIndexVM
                    {
                        Id = p.Id,
                        ordertime = p.ordertime,
                        fk_member_Id = p.fk_member_Id,
                        total_quantity = totalquantity,
                        logistics_company_Id = p.logistics_company_Id,
                        logistics_companys = LogisticsCompanies.ContainsKey(p.logistics_company_Id) ? LogisticsCompanies[p.logistics_company_Id] : string.Empty,
                        order_status_Id = p.order_status_Id,
                        order_status = orderStatuses.ContainsKey(p.order_status_Id) ? orderStatuses[p.order_status_Id] : string.Empty,
                        pay_method_Id = p.pay_method_Id,
                        pay_method = paymethods.ContainsKey(p.pay_method_Id) ? paymethods[p.pay_method_Id] : string.Empty,
                        pay_status_Id = p.pay_status_Id,
                        pay_status = paystatuses.ContainsKey(p.pay_status_Id) ? paystatuses[p.pay_status_Id] : string.Empty,
                        coupon_name = p.coupon_name,
                        coupon_discount = p.coupon_discount,
                        freight = p.freight,
                        cellphone = p.cellphone,
                        receipt = p.receipt,
                        receiver = p.receiver,
                        recipient_address = p.recipient_address,
                        order_description = p.order_description,
                        close = (bool)p.close,
                        total_price = totalDiscountSubtotal,
                        orderItems = (List<OrderItemsVM>)GetOrderItemsIndex(p.Id)
                    };
                    
                });
         
        }

		public ActionResult Create()
		{
			TempData.Keep("LogisticsCompanies");
			TempData.Keep("PayMethods");

			return View(new OrdersIndexVM());
		}
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Create(OrdersIndexVM vm)
		{
			if (ModelState.IsValid == false) return View(vm);
			
			if (vm.IsDefault)
			{
				var db = new AppDbContext();
				var memberData = db.Members.FirstOrDefault(m => m.MemberId == vm.fk_member_Id);
				if (memberData != null)
				{
					// 將會員資料填充到相關屬性中
					vm.cellphone = memberData.Mobile;
					vm.receiver = memberData.Name;
					vm.recipient_address = memberData.CommonAddress;
				}
			}

			(bool IsSuccess, string ErrorMessage) result = CreateOrders(vm);

			if (result.IsSuccess)
			{
				TempData.Keep("LogisticsCompanies");
				TempData.Keep("PayMethods");
				return RedirectToAction("OrdersIndex");
			}
			else
			{
				ModelState.AddModelError(string.Empty, result.ErrorMessage);
				TempData.Keep("LogisticsCompanies");
				TempData.Keep("PayMethods");
				return View(vm);
			}

		}
		private (bool IsSuccess, string ErrorMessage) CreateOrders(OrdersIndexVM vm)
		{
			var db = new AppDbContext();
			bool memberExists = db.Members.Any(m => m.MemberId == vm.fk_member_Id);
			if (!memberExists)
			{
				return (false, "無此會員編號");
			}
			var order = new order
			{
				Id = vm.Id,
				ordertime = DateTime.Now,
				fk_member_Id = vm.fk_member_Id,
				total_price = 0,
				total_quantity = 0,
				logistics_company_Id = vm.logistics_company_Id,
				order_status_Id = 1,
				pay_method_Id = vm.pay_method_Id,
				pay_status_Id = 1,
				coupon_name = vm.coupon_name,
				coupon_discount = vm.coupon_discount,
				freight = vm.logistics_company_Id == 1 ? 0 : 60,
				cellphone = vm.cellphone,
				receipt = vm.receipt,
				receiver = vm.receiver,
				recipient_address = vm.recipient_address,
				order_description = vm.order_description,
				close = false
			};
			db.orders.Add(order);
			db.SaveChanges();

			return (true, "");
		}
		public ActionResult Edit(int id)
		{
			var order = GetOrderById(id);

			if (order == null)
			{
				return HttpNotFound(); // 可以根據你的需求返回一個適當的錯誤頁面或訊息
			}
           
            var vm = new OrdersIndexVM
			{
				Id = order.Id,
				ordertime = order.ordertime,
				fk_member_Id = order.fk_member_Id,
				total_quantity = order.total_quantity,
				logistics_company_Id = order.logistics_company_Id,
				order_status_Id = order.order_status_Id,
				pay_method_Id = order.pay_method_Id,
				pay_status_Id = order.pay_status_Id,
				coupon_name = order.coupon_name,
				coupon_discount = order.coupon_discount,
				freight = order.freight,
				cellphone = order.cellphone,
				receipt = order.receipt,
				receiver = order.receiver,
				recipient_address = order.recipient_address,
				order_description = order.order_description,
				close = (bool)order.close,
				total_price = order.total_price,
			};

			return View(vm);
		}
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Edit(OrdersIndexVM vm)
		{
			if (ModelState.IsValid == false)
			{
				return View(vm);
			}

			var result = UpdateOrder(vm);

			if (result.IsSuccess)
			{
				TempData.Keep("orderStatuses");
				TempData.Keep("paystatuses");
				TempData.Keep("LogisticsCompanies");
				TempData.Keep("PayMethods");
				return RedirectToAction("OrdersIndex");
			}
			else
			{
				ModelState.AddModelError(string.Empty, result.ErrorMessage);
				return View(vm);
			}
		}
		private (bool IsSuccess, string ErrorMessage) UpdateOrder(OrdersIndexVM vm)
		{
			var db = new AppDbContext();

			var order = db.orders.FirstOrDefault(o => o.Id == vm.Id);
            var orderItems = GetOrderItemsIndex(order.Id);
            int totalDiscountSubtotal = (int)orderItems.Sum(oi => oi.discount_subtotal);
            int totalquantity = (int)orderItems.Sum(oi => oi.quantity);
            if (order == null)
			{
				return (false, "找不到該訂單"); // 可以根據你的需求返回一個適當的錯誤訊息
			}

			// 更新訂單的相關屬性
			//order.ordertime = vm.ordertime;
			order.fk_member_Id = vm.fk_member_Id;
			order.total_quantity = totalquantity;
			order.logistics_company_Id = vm.logistics_company_Id;
			order.order_status_Id = vm.order_status_Id;
			order.pay_method_Id = vm.pay_method_Id;
			order.pay_status_Id = vm.pay_status_Id;
			order.coupon_name = vm.coupon_name;
			order.coupon_discount = vm.coupon_discount;
			order.freight = vm.freight;
			order.cellphone = vm.cellphone;
			order.receipt = vm.receipt;
			order.receiver = vm.receiver;
			order.recipient_address = vm.recipient_address;
			order.order_description = vm.order_description;
			order.close = vm.close;
			order.total_price = totalDiscountSubtotal;

			db.SaveChanges();

			return (true, "");
		}
		private order GetOrderById(int id)
		{
			var db = new AppDbContext();
			return db.orders.FirstOrDefault(o => o.Id == id);
		}

        public ActionResult OrderItemsIndex(int id)
        {
            IEnumerable<OrderItemsVM> orderItems = GetOrderItemsIndex(id);
			//TempData["OrderId"] = id; // 將 id 儲存在 TempData 中
			//return View(orderItems);
			var order = GetOrderById(id);

			if (order != null)
			{
				TempData["close"] = order.close;
				ViewData["Cellphone"] = order.cellphone;
				ViewData["Receipt"] = order.receipt;
				ViewData["Receiver"] = order.receiver;
				ViewData["RecipientAddress"] = order.recipient_address;
			}

			TempData["OrderId"] = id; // 將 id 儲存在 TempData 中
			
			return View(orderItems);
		}
		private IEnumerable<OrderItemsVM> GetOrderItemsIndex(int orderId)
		{
			var db = new AppDbContext();
			var fk_typeId = db.Types.AsNoTracking().ToDictionary(ty => ty.TypeId, ty => ty.TypeName);
			TempData["fk_typeId"] = fk_typeId ?? new Dictionary<int, string>();
			var typeIds = db.orderItems
				.AsNoTracking()
				.Where(o => o.order_Id == orderId)
				.Select(o => o.fk_typeId)
				.Distinct()
				.ToList();

			var types = db.Types
				.AsNoTracking()
				.Where(tp => typeIds.Contains(tp.TypeId))
				.ToList()
				.ToDictionary(tp => tp.TypeId, tp => tp.TypeName);

			var orderItems = db.orderItems
				.AsNoTracking()
				.Where(o => o.order_Id == orderId)
				.ToList()
				.Select(o => new OrderItemsVM
				{
					Id = o.Id,
					order_Id = o.order_Id,
					product_name = o.product_name,
					fk_typeId = o.fk_typeId,
					type = types.ContainsKey(o.fk_typeId) ? types[o.fk_typeId] : string.Empty,
					per_price = o.per_price,
					quantity = o.quantity,
					discount_name = o.discount_name,
					subtotal = o.subtotal,
					discount_subtotal = o.discount_subtotal,
					Items_description = o.Items_description
				})
				.ToList();

			return orderItems;
		}

		public ActionResult CreateOrderItems()
        {
			TempData.Keep("OrderId");

			return View();
        }
        [HttpPost]
		[ValidateAntiForgeryToken]
        public ActionResult CreateOrderItems(OrderItemsVM vm)
        {
			int orderId =(int)TempData["OrderId"];

			if (ModelState.IsValid == false) return View(vm);

            (bool IsSuccess, string ErrorMessage, int OrderItemId) result = CreatenewOrderItems(vm, orderId);

            if (result.IsSuccess)
            {
                var db = new AppDbContext();
                var orderItems = GetOrderItemsIndex(orderId);
                int totalDiscountSubtotal = (int)orderItems.Sum(oi => oi.discount_subtotal);
                int totalquantity = (int)orderItems.Sum(oi => oi.quantity);
                var order = db.orders.AsNoTracking().FirstOrDefault(o => o.Id == orderId); ;
                order.total_price = totalDiscountSubtotal;
                order.total_quantity = totalquantity;
                db.Entry(order).State = EntityState.Modified;
                db.SaveChanges();

                TempData.Keep("fk_typeId");
                    int orderItemId = result.OrderItemId;
                    return RedirectToAction("OrderItemsIndex", new { id = orderItemId });
                
            }
            else
            {
                ModelState.AddModelError(string.Empty, result.ErrorMessage);
                return View(vm);
            }
        }
        private (bool IsSuccess, string ErrorMessage, int OrderItemId) CreatenewOrderItems(OrderItemsVM vm, int orderId)
		{
			var db = new AppDbContext();

			var orderitems = new orderItem
			{
				Id = vm.Id,
				order_Id = orderId,
				product_name = vm.product_name,
				fk_typeId = vm.fk_typeId,
				per_price = vm.per_price,
				quantity = vm.quantity,
				discount_name = vm.discount_name,
				subtotal = vm.per_price*vm.quantity,
				discount_subtotal = vm.per_price * vm.quantity,
				Items_description = vm.Items_description
			};

			db.orderItems.Add(orderitems);
			db.SaveChanges();
         ;
            return (true, "", orderitems.order_Id);

        }

		public ActionResult EditItems(int id)
		{
            TempData.Keep("OrderId");
            var order = GetOrderItemsById(id);

			if (order == null)
			{
				return HttpNotFound(); // 可以根據你的需求返回一個適當的錯誤頁面或訊息
			}

			var vm = new OrderItemsVM
			{
				Id = order.Id,
				order_Id= order.order_Id,
				product_name = order.product_name,
				fk_typeId = order.fk_typeId,
				per_price = order.per_price,
				quantity = order.quantity,
				discount_name = order.discount_name,
				subtotal = order.subtotal,
				discount_subtotal= order.discount_subtotal,
				Items_description = order.Items_description
				
			};

			return View(vm);
		}
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult EditItems(OrderItemsVM vm)
		{
            int orderId = (int)TempData["OrderId"];
            if (ModelState.IsValid == false)
			{
				return View(vm);
			}

			(bool IsSuccess, string ErrorMessage, int OrderItemId) result = UpdateOrderItems(vm);

			if (result.IsSuccess)
			{
                var db = new AppDbContext();
                var orderItems = GetOrderItemsIndex(orderId);
                int totalDiscountSubtotal = (int)orderItems.Sum(oi => oi.discount_subtotal);
                int totalquantity = (int)orderItems.Sum(oi => oi.quantity);
                var order = db.orders.AsNoTracking().FirstOrDefault(o => o.Id == orderId); ;
                order.total_price = totalDiscountSubtotal;
                order.total_quantity = totalquantity;
                db.Entry(order).State = EntityState.Modified;
                db.SaveChanges();

                TempData.Keep("fk_typeId");
				
				int orderItemId = result.OrderItemId;
				return RedirectToAction("OrderItemsIndex", new { id = orderItemId });
			}
			else
			{
				ModelState.AddModelError(string.Empty, result.ErrorMessage);
				return View(vm);
			}
		}
		private (bool IsSuccess, string ErrorMessage, int OrderItemId) UpdateOrderItems(OrderItemsVM vm)
		{
			var db = new AppDbContext();

			var order = db.orderItems.FirstOrDefault(o => o.Id == vm.Id);

            //if (order == null)
            //{
            //	return (false, "找不到該訂單"); // 可以根據你的需求返回一個適當的錯誤訊息
            //}

            // 更新訂單的相關屬性
           
            order.Id = vm.Id;
			order.order_Id = vm.order_Id;
				 order.product_name = vm.product_name;
				 order.fk_typeId = vm.fk_typeId;
				 order.per_price = vm.per_price;
				 order.quantity =vm.quantity;
				 order.discount_name =vm.discount_name;
			 order.subtotal = vm.per_price * vm.quantity;
			order.discount_subtotal = vm.per_price * vm.quantity;
				 order.Items_description =vm.Items_description;

			

			db.SaveChanges();

			return (true, "", order.order_Id);
		}
		private orderItem GetOrderItemsById(int id)
		{
			var db = new AppDbContext();
			return db.orderItems.FirstOrDefault(o => o.Id == id);
		}

		public ActionResult ChangeStatus(int orderId, bool isChecked)
		{
			var db = new AppDbContext();
			var order = db.orders.FirstOrDefault(o => o.Id == orderId);

			if (order != null)
			{
				order.close = isChecked;
				db.SaveChanges();
			}

			return Json(new { success = true });
		}
        public ActionResult UpdateOrderStatus(List<int> orderIds)
        {
            try
            {
                var db = new AppDbContext();
                var orders = db.orders.Where(o => orderIds.Contains(o.Id));

                foreach (var order in orders)
                {
                    order.order_status_Id = 2; // 修改為指定的狀態值 2
                }

                db.SaveChanges();

                return Json(new { success = true });
            }
            catch (Exception ex)
            {
                // 處理更新失敗的情況
                return Json(new { success = false, message = ex.Message });
            }
        }
        public ActionResult UpdateOrderStatus1(List<int> orderIds)
        {
            try
            {
                var db = new AppDbContext();
                var orders = db.orders.Where(o => orderIds.Contains(o.Id));

                foreach (var order in orders)
                {
                    order.order_status_Id = 3; // 修改為指定的狀態值 2
                }

                db.SaveChanges();

                return Json(new { success = true });
            }
            catch (Exception ex)
            {
                // 處理更新失敗的情況
                return Json(new { success = false, message = ex.Message });
            }
        }
        public ActionResult UpdateOrderStatus2(List<int> orderIds)
        {
            try
            {
                var db = new AppDbContext();
                var orders = db.orders.Where(o => orderIds.Contains(o.Id));

                foreach (var order in orders)
                {
                    order.order_status_Id = 4; // 修改為指定的狀態值 2
                }

                db.SaveChanges();

                return Json(new { success = true });
            }
            catch (Exception ex)
            {
                // 處理更新失敗的情況
                return Json(new { success = false, message = ex.Message });
            }
        }
        public ActionResult UpdateOrderStatus3(List<int> orderIds)
        {
            try
            {
                var db = new AppDbContext();
                var orders = db.orders.Where(o => orderIds.Contains(o.Id));

                foreach (var order in orders)
                {
                    order.order_status_Id = 5; // 修改為指定的狀態值 2
                }

                db.SaveChanges();

                return Json(new { success = true });
            }
            catch (Exception ex)
            {
                // 處理更新失敗的情況
                return Json(new { success = false, message = ex.Message });
            }
        }
        public ActionResult UpdateOrderStatus4(List<int> orderIds)
        {
            try
            {
                var db = new AppDbContext();
                var orders = db.orders.Where(o => orderIds.Contains(o.Id));

                foreach (var order in orders)
                {
                    order.order_status_Id = 6; // 修改為指定的狀態值 2
                }

                db.SaveChanges();

                return Json(new { success = true });
            }
            catch (Exception ex)
            {
                // 處理更新失敗的情況
                return Json(new { success = false, message = ex.Message });
            }
        }
        public ActionResult UpdateOrderStatus5(List<int> orderIds)
        {
            try
            {
                var db = new AppDbContext();
                var orders = db.orders.Where(o => orderIds.Contains(o.Id));

                foreach (var order in orders)
                {
                    order.order_status_Id = 7; // 修改為指定的狀態值 2
                }

                db.SaveChanges();

                return Json(new { success = true });
            }
            catch (Exception ex)
            {
                // 處理更新失敗的情況
                return Json(new { success = false, message = ex.Message });
            }
        }
        public ActionResult UpdateOrderStatus6(List<int> orderIds)
        {
            try
            {
                var db = new AppDbContext();
                var orders = db.orders.Where(o => orderIds.Contains(o.Id));

                foreach (var order in orders)
                {
                    order.order_status_Id = 8; // 修改為指定的狀態值 2
                }

                db.SaveChanges();

                return Json(new { success = true });
            }
            catch (Exception ex)
            {
                // 處理更新失敗的情況
                return Json(new { success = false, message = ex.Message });
            }
        }

		public ActionResult GetMemberData(int memberId)
		{
			var db = new AppDbContext();
			var memberData = db.Members.FirstOrDefault(m => m.MemberId == memberId);

			if (memberData != null)
			{
				var data = new
				{
					cellphone = memberData.Mobile,
					receiver = memberData.Name,
					recipient_address = memberData.CommonAddress
				};

				return Json(new { success = true, data }, JsonRequestBehavior.AllowGet);
			}

			return Json(new { success = false, message = "Member data not found." }, JsonRequestBehavior.AllowGet);
		}
	}
	
}
