using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using Customized_Shoes.dll.Models.Exts;
using Customized_Shoes.dll.Models.ViewModels;
using EFModels.EFModels;

namespace flexbackend.site.Controllers
{
    public class ShoesColorCategoriesController : Controller
    {
        private AppDbContext db = new AppDbContext();

        // GET: ShoesColorCategories
        public ActionResult Index(ShoesColorCategoryCriteria criteria)
        {
			criteria = criteria ?? new ShoesColorCategoryCriteria();

			ViewBag.Criteria = criteria;

			IEnumerable<ShoesColorCategory> query = db.ShoesColorCategories;

			#region where
			if (string.IsNullOrEmpty(criteria.ColorName) == false)
			{
				query = query.Where(p => p.ColorName.Contains(criteria.ColorName));
			}
			if (string.IsNullOrEmpty(criteria.ColorCode) == false)
			{
				query = query.Where(p => p.ColorCode.Contains(criteria.ColorCode));
			}
			#endregion

			var shoescolorcategories = query.ToList().Select(p => p.ToColorVM());

			return View(shoescolorcategories);
        }

        // GET: ShoesColorCategories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ShoesColorCategory shoesColorCategory = db.ShoesColorCategories.FirstOrDefault(x => x.ShoesColorId == id);

			if (shoesColorCategory == null) return HttpNotFound();

			ShoesColorCategoryVM vm = new ShoesColorCategoryVM()
			{
				ShoesColorId = shoesColorCategory.ShoesColorId,
                ColorName = shoesColorCategory.ColorName,
                ColorCode = shoesColorCategory.ColorCode,
			};

			return View(vm);
        }

        // GET: ShoesColorCategories/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ShoesColorCategories/Create
        // 若要免於大量指派 (overposting) 攻擊，請啟用您要繫結的特定屬性，
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(ShoesColorCategoryVM vm)
        {
            if (ModelState.IsValid)
            {
                ShoesColorCategory shoescolorcategory = vm.ToColorEntity();

                db.ShoesColorCategories.Add(shoescolorcategory);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(vm);
        }

        // GET: ShoesColorCategories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ShoesColorCategory shoesColorCategory = db.ShoesColorCategories.FirstOrDefault(x => x.ShoesColorId == id);

			if (shoesColorCategory == null) return HttpNotFound();

			ShoesColorCategoryVM vm = new ShoesColorCategoryVM()
			{
				ShoesColorId = shoesColorCategory.ShoesColorId,
				ColorName = shoesColorCategory.ColorName,
				ColorCode = shoesColorCategory.ColorCode,
			};

			return View(vm);
        }

        // POST: ShoesColorCategories/Edit/5
        // 若要免於大量指派 (overposting) 攻擊，請啟用您要繫結的特定屬性，
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ShoesColorId,ColorName,ColorCode")] ShoesColorCategory shoesColorCategory)
        {
            if (ModelState.IsValid)
            {
                db.Entry(shoesColorCategory).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(shoesColorCategory);
        }

        // GET: ShoesColorCategories/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ShoesColorCategory shoesColorCategory = db.ShoesColorCategories.FirstOrDefault(x => x.ShoesColorId == id);
			if (shoesColorCategory == null) return HttpNotFound();

			ShoesColorCategoryVM vm = new ShoesColorCategoryVM()
			{
				ShoesColorId = shoesColorCategory.ShoesColorId,
				ColorName = shoesColorCategory.ColorName,
				ColorCode = shoesColorCategory.ColorCode,
			};

			bool isCategoryInUse = IsCategoryInUse(id.Value);
			ViewBag.IsCategoryInUse = isCategoryInUse;

			return View(vm);
        }

        // POST: ShoesColorCategories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ShoesColorCategory shoesColorCategory = db.ShoesColorCategories.Find(id);
            db.ShoesColorCategories.Remove(shoesColorCategory);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

		private bool IsCategoryInUse(int colorcategoryId)
		{
			// Check if the category is being used in any related entities
			bool isCategoryInUse = db.CustomizedShoesPoes.Any(x => x.fk_ShoesColorId == colorcategoryId);
			return isCategoryInUse;
		}
	}
}
