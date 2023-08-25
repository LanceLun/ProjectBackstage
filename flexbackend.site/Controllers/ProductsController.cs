using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Net;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.ModelBinding;
using System.Web.Mvc;
using System.Web.Services.Description;
using Antlr.Runtime.Tree;
using DocumentFormat.OpenXml.Wordprocessing;
using EFModels.EFModels;
using Flex.Products.dll.Exts;
using Flex.Products.dll.Infra.DapperRepository;
using Flex.Products.dll.Infra.EFRepository;
using Flex.Products.dll.Interface;
using Flex.Products.dll.Models.Dtos;
using Flex.Products.dll.Models.Infra.EFRepository;
using Flex.Products.dll.Models.Infra.Exts;
using Flex.Products.dll.Models.ViewModel;
using Flex.Products.dll.Service;


namespace flexbackend.site.Controllers
{

	public class ProductsController : Controller
    {
        private AppDbContext db = new AppDbContext();
        private IProductRepository _repo=new ProductEFRepository();

		// GET: Products
		public ActionResult Index(IndexSearchCriteria criteria)
        {
            criteria = criteria ?? new IndexSearchCriteria();
            PrepareProductSubCategoryDataSource(criteria.ProductSubCategoryId);

			ViewBag.Criteria = criteria;
            ViewBag.StatusOption = new SelectList(criteria.StatusOption);

			var _repoDP=new ProductDPRepository();
            var service = new ProductService(_repo);
            //var service = new ProductService(_repoDP);
            var products = service.IndexProduct(criteria).Select(p => p.ToIndexVM());
            if (Request.IsAjaxRequest())
            {
                return Json(products);
            }
            return View(products);
		}


		[HttpPost]
		public ActionResult SaveChangeStatus(List<ProductIdAndStatusVM> vm)
		{
			
            if (vm != null)
            {
				var dtos = new List<ProductDto>();
				foreach (var product in vm)
				{
					dtos.Add(product.ToSaveChangeStatusDto());
				}
				var service = new ProductService(_repo);
				var products = service.SaveChangeStatus(dtos);
				if (products.IsSuccess)
				{
					var updatedProducts = service.IndexProduct(new IndexSearchCriteria()).Select(p => p.ToIndexVM());
					//return PartialView("_ProductTable", updatedProducts);
					return Json(new { success = true });
				}
			}
			return Json(new { success = false });
		}

        // GET: Products/Create
        public ActionResult Create()
        {
			PrepareProductSubCategoryDataSource(null);
            PrepareColorDataSource(null);
            PrepareSizeDataSource(null);
			var vm = new ProductCreateVM();
			return View(vm);
        }

        // POST: Products/Create  
        // 若要避免過量張貼攻擊，請啟用您要繫結的特定屬性。
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(ProductCreateVM vm, List<string> createImgName, List<HttpPostedFileBase> createfile)
		{
			PrepareProductSubCategoryDataSource(vm.fk_ProductSubCategoryId);
			PrepareColorDataSource(null);
			PrepareSizeDataSource(null);
			if (ModelState.IsValid == false) return View(vm);

			#region 照片上傳
            if (createfile == null || createfile.Count == 0)
            {
                ModelState.AddModelError("ImgPaths", "請選擇檔案");
                return View(vm);
            }

            // 設定照片路徑不存在就新增一個
            string path = Server.MapPath("~/Public/Img");
            if (!Directory.Exists(path)) Directory.CreateDirectory(path);

            // 將CreateFile存檔，並取得最後存檔的名稱，副檔名可能不合規格，所以在做一次偵錯
            var imgs = SaveFileName(path, createImgName, createfile,null);
            if (imgs.Count == 0 || imgs==null)
            {
                ModelState.AddModelError("ImgPaths", "請選擇檔案");
                return View(vm);
            }

			// 將雜湊後的檔名newFileName加到VM的ImgPaths
			foreach (var fileName in imgs)
            {
                vm.ImgPaths.Add(fileName.ImgPath);
            }
			#endregion

            var service = new ProductService(_repo);
            var result = service.CreateProduct(vm.ToCreateDto());
            if (result.IsSuccess)
            {
				return RedirectToAction("Index");
			}
            else
            {
                if (result.ErroeMessage.Contains("規格"))
                {
					ModelState.AddModelError("ProductGroups", result.ErroeMessage);
				}
                else
                {
					ModelState.AddModelError("ProductId", result.ErroeMessage);
				}
                return View(vm);
			}
		}

		// GET: Products/Edit
		public ActionResult Edit(string ProductId)
        {
            if (ProductId == null) return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            var service = new ProductService(_repo);
            var product = service.GetById(ProductId).ToEditVM();

			if (product == null) return HttpNotFound();

			PrepareProductSubCategoryDataSource(null);
            PrepareColorDataSource(null);
            PrepareSizeDataSource(null);

            return View(product);
        }

		// POST: Products/Edit/5
		// 若要避免過量張貼攻擊，請啟用您要繫結的特定屬性。
		// 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Edit(ProductEditVM vm)
        {
            
			PrepareProductSubCategoryDataSource(vm.fk_ProductSubCategoryId);
			PrepareColorDataSource(null);
			PrepareSizeDataSource(null);
			if (!ModelState.IsValid) return View(vm);

			var service= new ProductService(_repo);
            var result = service.EditProduct(vm.VMToEditDto());
            if (result.IsSuccess)
            {
				return RedirectToAction("Index");
			}
            else
            {
                ModelState.AddModelError("ProductGroups", result.ErroeMessage);
				return View(vm);
			}
        }

        public ActionResult EditImg(string ProductId)
        {
            if(ProductId==null)return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

            var service = new ProductService(_repo);
            var product = service.GetImgById(ProductId);

            return View(product.ToEditImgVM(ProductId));
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult EditImg(ProductEditImgVM vm, List<string> createImgName, List<HttpPostedFileBase> createfile)
        {
            if (vm == null) return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            
			var service = new ProductService(_repo);

			var path = Server.MapPath("~/Public/Img");
            List<ProductImgDto> editImg = SaveFileName(path, createImgName, createfile, vm.ProductId);

			if (vm.ProductImgs.Count == 0 && createImgName == null)
            {
				ModelState.AddModelError(string.Empty, "至少要有一張照片");
                return View(vm);
			}

			if (editImg != null && editImg.Count > 0)
            {
                foreach (var img in editImg)
                {
                    vm.ProductImgs.Add(img);
                }
			}

            var product = service.SaveEditImg(vm.VMToEditImgDto());

            if (product.IsSuccess)
            {
                return RedirectToAction("Index");
            }
            return View(vm);
        }

        // POST: Products/Delete/5
        [HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Delete(string productId)
        {
            if(productId == null) return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            var service = new ProductService(_repo);

            Result result = service.DeleteProduct(productId);

            if (result.IsSuccess)
            {
                return Json(new { success = true });
            }
            else
            {
				return Json(new { success = false,message=result.ErroeMessage });
			}
        }

		public ActionResult ReportToExcel()
		{
            var productDPRepository = new ProductDPRepository();
			var service = new ProductService(productDPRepository);
			var products = service.ReportToExcel().Select(p => p.ToExcelVM()).ToList();

			// 建立 xlxs 轉換物件
			ExcelHelper helper = new ExcelHelper();
			// 取得轉為 xlsx 的物件
			var xlsx = helper.Export(products);

			string filepath = Path.Combine(Path.GetTempPath(), $"{DateTime.Now:yyyyMMddHHmmss}.xlsx");
			xlsx.SaveAs(filepath);

			return File(filepath, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", DateTime.Now.ToString("yyyyMMdd")+"Report.xlsx");
		}

		public ActionResult CreateForExcel(HttpPostedFileBase createfile)
        {

			if (createfile == null || createfile.ContentLength == 0)
			{
				ModelState.AddModelError(string.Empty, "請選擇檔案");
				return View();
			}

			var fileName=Path.GetFileName(createfile.FileName);
			var fileExtension=Path.GetExtension(fileName);
			
			if(fileExtension.ToLower()!=".xlsx" && fileExtension.ToLower() != ".xls")
			{
				ModelState.AddModelError(string.Empty, "請選擇.xlsx或.xls");
				return View();
			}

			// 將檔案儲存到伺服器上的臨時位置
			var filePath = Path.Combine(Server.MapPath("~/Public/CreateExcel"), fileName);
			createfile.SaveAs(filePath);

			var excelHelper = new ExcelHelper();
			var data = new List<ProductExcelImportVM>();
			try
			{
				data = excelHelper.Import<ProductExcelImportVM>(filePath);
			}
			catch(Exception ex)
			{
				data.Clear();
				ModelState.AddModelError(string.Empty, ex.Message);
				return View();
			}

			//將excel轉換的VM調整規格後再轉換成Dto
			var conversionData = data.GroupBy(item => item.ProductId)
				.Select(group => new ProductExcelImportVM
				{
					ProductId = group.Key,
					ProductName = group.First().ProductName,
					ProductDescription = group.First().ProductDescription,
					ProductMaterial = group.First().ProductMaterial,
					ProductOrigin = group.First().ProductOrigin,
					fk_ProductSubCategoryId =new ProductSubCategoryRepository().GetProductSubCategoryId(group.First().CategoryName),
					UnitPrice = group.First().UnitPrice,
					SalesPrice = group.First().SalesPrice,
					Status = group.First().StatusText.Contains("下架")?true : false,
					ProductGroups = group.Select(item => new ProductGroupsDto
					{
						ProductId = group.Key,
						SizeId = new SizeRepository().GetSizeId(item.SizeName),
						ColorId = new ColorRepository().GetColorId(item.ColorName),
						Qty = item.Qty,
					}).ToList(),
						  
				}).Select(p => p.ToExcelDto()).ToList();

			// 刪除臨時檔案
			System.IO.File.Delete(filePath);

			var service = new ProductService(_repo);
			var result = service.CreateProductForExcel(conversionData);

			if (result.IsFailed)
			{
				ModelState.AddModelError(string.Empty, result.ErroeMessage);
				return View();
			}
			return RedirectToAction("IndexForExcel", new { productId = string.Join(",", conversionData.Select(p => p.ProductId)) });

		}

		public ActionResult IndexForExcel(string productId)
		{
			List<string> productIds = productId.Split(',').ToList();
			var productDPRepository = new ProductDPRepository();
			var service = new ProductService(productDPRepository);
			var products = service.IndexForExcel(productIds).Select(p => p.ToIndexForExcelVM()).ToList();
			foreach(var product in products)
			{
				product.ProductIds = productId;
			}
			if (Request.IsAjaxRequest())
			{
				return Json(products);
			}
			return View(products);
		}

		public ActionResult CreateImg(string ProductId, string ProductIds)
		{
			if (ProductId == null) return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

			var service = new ProductService(_repo);
			var products = service.GetImgById(ProductId).ToEditImgVM(ProductId);
			products.ProductIds = ProductIds;
			return View(products);
		}

		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult CreateImg(ProductEditImgVM vm, List<string> createImgName, List<HttpPostedFileBase> createfile, string ProductIds)
		{
			if (vm == null) return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

			var service = new ProductService(_repo);

			var path = Server.MapPath("~/Public/Img");
			List<ProductImgDto> editImg = SaveFileName(path, createImgName, createfile, vm.ProductId);

			if (vm.ProductImgs.Count == 0 && createImgName == null)
			{
				ModelState.AddModelError(string.Empty, "至少要有一張照片");
				return View(vm);
			}

			if (editImg != null && editImg.Count > 0)
			{
				foreach (var img in editImg)
				{
					vm.ProductImgs.Add(img);
				}
			}

			var product = service.SaveEditImg(vm.VMToEditImgDto());

			if (product.IsSuccess)
			{
				return RedirectToAction("IndexForExcel", new { productId = ProductIds });
			}
			return View(vm);
		}

		protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private void PrepareProductSubCategoryDataSource(int? ProductSubCategoryId)
        {
            ViewBag.ProductSubCategoryId = new SelectList(
                new ProductSubCategoryDPRepository()
                .GetProductSubCategory()
                .Prepend(new ProductSubCategoryDto { ProductSubCategoryId=0, SalesCategoryName = "請選擇分類"}), "ProductSubCategoryId", "SubCategoryPath", ProductSubCategoryId);
		}

		private void PrepareColorDataSource(int? ColorId)
        {
            ViewBag.Color = new SelectList(
                new ColorRepository()
                .GetColorCategory()
                .Prepend(new ColorDto { ColorId = 0, ColorName = "顏色" }), "ColorId", "ColorName", ColorId);
        }

        private void PrepareSizeDataSource(int? SizeId)
        {
            ViewBag.Size = new SelectList(
                new SizeRepository()
                .GetSizeCategory()
                .Prepend(new SizeDto { SizeId = 0, SizeName = "尺寸" }), "SizeId", "SizeName", SizeId);
        }


		/// <summary>
		/// 相片編輯
		/// </summary>
		/// <param name="path">存放路徑</param>
		/// <param name="createImgName">預覽回傳照片名稱</param>
		/// <param name="createfile">file回傳檔案</param>
		/// <param name="productId">產品Id</param>
		/// <returns></returns>
		private List<ProductImgDto> SaveFileName(string path, List<string> createImgName, List<HttpPostedFileBase> createfile, string productId)
		{
			if (createImgName == null || createImgName.Count <= 0) return new List<ProductImgDto>();

			var allowExts = new string[] { ".jpg", ".jpeg", ".png", ".gif", ".tif" };
			var result = new List<ProductImgDto>();

			for (var i = 0; i < createfile.Count; i++)
			{
				var file = createfile[i];
				var fileName = file.FileName;
				if (file == null || file.ContentLength == 0 || file.ContentLength > 2 * 1024 * 1024) continue;
				if (createImgName.Any(imgName => imgName == fileName))
				{
					var ext = System.IO.Path.GetExtension(fileName);

					if (!allowExts.Contains(ext.ToLower())) continue;

					var newFileName = $"{Guid.NewGuid().ToString("N")}{ext}";

					file.SaveAs(System.IO.Path.Combine(path, newFileName));
					result.Add(new ProductImgDto
					{
						fk_ProductId = productId,
						ImgPath = newFileName,
					});
				}
				else
				{
					continue;
				}
			}

			return result;
		}
	}
}
