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
    public class ShoesCategoriesController : Controller
    {
        private AppDbContext db = new AppDbContext();

        // GET: ShoesCategories
        public ActionResult Index(ShoesCategoryCriteria criteria)
        {
			criteria = criteria ?? new ShoesCategoryCriteria();

			ViewBag.Criteria = criteria;

			IEnumerable<ShoesCategory> query = db.ShoesCategories;

            #region where
            if (string.IsNullOrEmpty(criteria.ShoesCategoryName) == false)
            {
                query = query.Where(p => p.ShoesCategoryName.Contains(criteria.ShoesCategoryName));
            }
			#endregion
			var shoescategories = query.ToList().Select(p => p.ToVM());

            return View(shoescategories);
		}

        // GET: ShoesCategories/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ShoesCategory shoesCategory = db.ShoesCategories.FirstOrDefault(x => x.ShoesCategoryId == id);
            if (shoesCategory == null) return HttpNotFound();

            ShoesCategoryVM vm = new ShoesCategoryVM()
            {
                ShoesCategoryId = shoesCategory.ShoesCategoryId,
                ShoesCategoryName = shoesCategory.ShoesCategoryName,
            };
            
            return View(vm);
        }

        // GET: ShoesCategories/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ShoesCategories/Create
        // 若要免於大量指派 (overposting) 攻擊，請啟用您要繫結的特定屬性，
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(ShoesCategoryVM vm)
        {
            if (ModelState.IsValid)
            {
				ShoesCategory shoescategories = vm.ToEntity();

				db.ShoesCategories.Add(shoescategories);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(vm);
        }

        // GET: ShoesCategories/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ShoesCategory shoesCategory = db.ShoesCategories.FirstOrDefault(x => x.ShoesCategoryId == id);
            if (shoesCategory == null) return HttpNotFound();

			ShoesCategoryVM vm = new ShoesCategoryVM()
			{
				ShoesCategoryId = shoesCategory.ShoesCategoryId,
				ShoesCategoryName = shoesCategory.ShoesCategoryName,
			};

			return View(vm);
        }

        // POST: ShoesCategories/Edit/5
        // 若要免於大量指派 (overposting) 攻擊，請啟用您要繫結的特定屬性，
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "ShoesCategoryId,ShoesCategoryName")] ShoesCategory shoesCategory)
        {
            if (ModelState.IsValid)
            {
                db.Entry(shoesCategory).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(shoesCategory);
        }

        // GET: ShoesCategories/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ShoesCategory shoesCategory = db.ShoesCategories.FirstOrDefault(x => x.ShoesCategoryId == id);
            if (shoesCategory == null) return HttpNotFound();

			ShoesCategoryVM vm = new ShoesCategoryVM()
			{
				ShoesCategoryId = shoesCategory.ShoesCategoryId,
				ShoesCategoryName = shoesCategory.ShoesCategoryName,
			};

			bool isCategoryInUse = IsCategoryInUse(id.Value);
			ViewBag.IsCategoryInUse = isCategoryInUse;

			return View(vm);
        }

        // POST: ShoesCategories/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ShoesCategory shoesCategory = db.ShoesCategories.Find(id);
            db.ShoesCategories.Remove(shoesCategory);
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

		private bool IsCategoryInUse(int categoryId)
		{
			// Check if the category is being used in any related entities
			bool isCategoryInUse = db.CustomizedShoesPoes.Any(x => x.fk_ShoesCategoryId == categoryId);
			return isCategoryInUse;
		}
	}
}
