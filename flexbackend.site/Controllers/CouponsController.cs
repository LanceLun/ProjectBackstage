using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Discount.dll.Models.Dtos;
using Discount.dll.Models.Infra.DapperRepositories;
using Discount.dll.Models.Infra.EFRepositories;
using Discount.dll.Models.Interfaces;
using Discount.dll.Models.Services;
using Discount.dll.Models.ViewModels;
using EFModels.EFModels;
using Flex.Products.dll.Interface;

namespace flexbackend.site.Controllers
{
    public class CouponsController : Controller
    {
        private AppDbContext db = new AppDbContext();
        private ICouponRepository _couponRepo;
        private CouponService _couponService;
        private IProjectTagRepository _ProjectTagRepo;
        private ProjectTagService _projectTagService;
        public CouponsController()
        {
            _couponRepo = new CouponDapperRepository();
            _couponService = new CouponService(_couponRepo);
            _ProjectTagRepo = new ProjectTagDapperRepository();
            _projectTagService = new ProjectTagService(_ProjectTagRepo);
        }

        // GET: Coupons
        public ActionResult Index()
        {
            return View();
        }
        [HttpPost]
        public ActionResult GetDatas(bool searchExpired = false, string searchDiscountName = null)
        {
            IEnumerable<CouponIndexVM> vm = _couponService.GetCoupons(searchExpired, searchDiscountName).Select(x=>x.ToViewModel());

            return Json(vm);
        }
        [HttpPost]
        public ActionResult GetDataById(int couponId)
        {
            var coupon = _couponService.GetCouponById(couponId).ToViewModel();

            return Json(coupon);
        }

        // GET: Coupons/Create
        public ActionResult Create()
        {
            var projectTagVMs = _projectTagService.Search().Select(x=>x.ToViewModel());
            ViewBag.CouponCategoryId = new SelectList(db.CouponCategories.Where(c => c.CouponCategoryId != 5), "CouponCategoryId", "CouponCategoryName");
            ViewBag.RequiredProjectTagID = new SelectList(projectTagVMs, "ProjectTagId", "ProjectTagName");
            List<SelectListItem> discountType = new List<SelectListItem>
            {
                new SelectListItem { Value = "0" , Text = "金額" },
                new SelectListItem { Value = "1" , Text = "百分比" },
                new SelectListItem { Value = "2" , Text = "免運費" },
            };

            List<SelectListItem> conditionType = new List<SelectListItem>
            {
                new SelectListItem { Value = "0" , Text = "依照購買價格" },
                new SelectListItem { Value = "1" , Text = "依照商品件數" },
            };
            ViewBag.ConditionType = new SelectList(conditionType, "Value", "Text"); ;
            ViewBag.DiscountType = new SelectList(discountType, "Value", "Text", 0);
            return View();
        }

        // POST: Coupons/Create
        // 若要避免過量張貼攻擊，請啟用您要繫結的特定屬性。
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(CouponCreateVM coupon)
        {
            if (ModelState.IsValid)
            {
                // 模型驗證通過，執行相應的操作
                var result = _couponService.Create(coupon.ToDto());
                return Json(result.result);
            }

            var projectTagVMs = _projectTagService.Search().Select(x => x.ToViewModel());
            // 模型驗證失敗，繼續顯示 Create 視圖並傳遞驗證錯誤訊息
            ViewBag.ValidationErrors = ModelState.Values.SelectMany(v => v.Errors).Select(e => e.ErrorMessage).ToList();
            ViewBag.CouponCategoryId = new SelectList(db.CouponCategories, "CouponCategoryId", "CouponCategoryName", coupon.CouponCategoryId);
            ViewBag.RequiredProjectTagID = new SelectList(projectTagVMs, "ProjectTagId", "ProjectTagName", coupon.RequiredProjectTagID);

            // 重新設置 ViewBag.DiscountType
            List<SelectListItem> discountType = new List<SelectListItem>
            {
                new SelectListItem { Value = "0" , Text = "金額" },
                new SelectListItem { Value = "1" , Text = "百分比" },
                new SelectListItem { Value = "2" , Text = "免運費" },
            };

                    // 重新設置 ViewBag.RequirementType
            List<SelectListItem> conditionType = new List<SelectListItem>
            {
                new SelectListItem { Value = "0" , Text = "依照購買價格" },
                new SelectListItem { Value = "1" , Text = "依照商品件數" },
            };
            ViewBag.DiscountType = new SelectList(discountType, "Value", "Text");
            ViewBag.ConditionType = new SelectList(conditionType, "Value", "Text");
            ViewBag.DiscountType = new SelectList(discountType, "Value", "Text", coupon.DiscountType);
            ViewBag.RequirementType = new SelectList(conditionType, "Value", "Text", coupon.RequirementType);

            // 取得驗證錯誤訊息
            IEnumerable<ModelError> errors = ModelState.Values.SelectMany(v => v.Errors);
            // 將錯誤訊息傳遞給 View
            ViewBag.ValidationErrors = errors;

            return Json(errors);
        }

        // GET: Coupons/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            CouponEditVM coupon = _couponService.GetCouponById(id.Value).ToViewModel();
            if (coupon == null)
            {
                return HttpNotFound();
            }

            var projectTagVMs = _projectTagService.Search().Select(x => x.ToViewModel());
            ViewBag.CouponCategoryId = new SelectList(db.CouponCategories.Where(c => c.CouponCategoryId != 5), "CouponCategoryId", "CouponCategoryName", coupon.CouponCategoryId);
            ViewBag.RequiredProjectTagID = new SelectList(projectTagVMs, "ProjectTagId", "ProjectTagName", coupon.RequiredProjectTagID);
            List<SelectListItem> discountType = new List<SelectListItem>
            {
                new SelectListItem { Value = "0" , Text = "金額" },
                new SelectListItem { Value = "1" , Text = "百分比" },
                new SelectListItem { Value = "2" , Text = "免運費" },
            };

            List<SelectListItem> conditionType = new List<SelectListItem>
            {
                new SelectListItem { Value = "0" , Text = "依照購買價格" },
                new SelectListItem { Value = "1" , Text = "依照商品件數" },
            };
            ViewBag.DiscountType = new SelectList(discountType, "Value", "Text", coupon.DiscountType);
            ViewBag.RequirementType = new SelectList(conditionType, "Value", "Text", coupon.RequirementType);
            return View(coupon);
        }

        // POST: Coupons/Edit/5
        // 若要避免過量張貼攻擊，請啟用您要繫結的特定屬性。
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit(CouponEditVM coupon)
        {
            if (ModelState.IsValid)
            {
                return Json(_couponService.Update(coupon.ToDto()));
            }
            var projectTagVMs = _projectTagService.Search().Select(x => x.ToViewModel());
            ViewBag.CouponCategoryId = new SelectList(db.CouponCategories, "CouponCategoryId", "CouponCategoryName", coupon.CouponCategoryId);
            ViewBag.RequiredProjectTagID = new SelectList(projectTagVMs, "ProjectTagId", "ProjectTagName", coupon.RequiredProjectTagID);
            List<SelectListItem> discountType = new List<SelectListItem>
            {
                new SelectListItem { Value = "0" , Text = "金額" },
                new SelectListItem { Value = "1" , Text = "百分比" },
                new SelectListItem { Value = "2" , Text = "免運費" },
            };

            List<SelectListItem> conditionType = new List<SelectListItem>
            {
                new SelectListItem { Value = "0" , Text = "依照購買價格" },
                new SelectListItem { Value = "1" , Text = "依照商品件數" },
            };
            ViewBag.DiscountType = new SelectList(discountType, "Value", "Text", coupon.DiscountType);
            ViewBag.RequirementType = new SelectList(conditionType, "Value", "Text", coupon.RequirementType);
            // 取得驗證錯誤訊息
            IEnumerable<ModelError> errors = ModelState.Values.SelectMany(v => v.Errors);
            // 將錯誤訊息傳遞給 View
            ViewBag.ValidationErrors = errors;

            return Json(errors);
        }

        // POST: Coupons/Delete/5
        [HttpDelete]
        public ActionResult Delete(int id)
        {
            _couponService.Delete(id);
            return Content("Resource deleted successfully.");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
