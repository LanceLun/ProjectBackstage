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
    public class ShoesChoosController : Controller
    {
        private AppDbContext db = new AppDbContext();

        // GET: ShoesChoos
        public ActionResult Index(ShoesChoosesCriteria criteria)
        {
			criteria = criteria ?? new ShoesChoosesCriteria();

			ViewBag.Criteria = criteria;

			IEnumerable<ShoesChoos> query = db.ShoesChooses;

			#region where
			if (string.IsNullOrEmpty(criteria.OptinName) == false)
			{
				query = query.Where(p => p.OptinName.Contains(criteria.OptinName));
			}
			#endregion

			var option = query.ToList().Select(p => p.ToChooseVM());

			return View(option);
        }

        // GET: ShoesChoos/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ShoesChoos shoesChoos = db.ShoesChooses.FirstOrDefault(x => x.OptionId == id);
			if (shoesChoos == null) return HttpNotFound();

			ShoesChoosesVM vm = new ShoesChoosesVM()
			{
				OptionId = shoesChoos.OptionId,
                OptinName = shoesChoos.OptinName,
			};

			return View(vm);
        }

        // GET: ShoesChoos/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: ShoesChoos/Create
        // 若要免於大量指派 (overposting) 攻擊，請啟用您要繫結的特定屬性，
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(ShoesChoosesVM vm)
        {
            if (ModelState.IsValid)
            {
				ShoesChoos option = vm.ToChooseEntity();

				db.ShoesChooses.Add(option);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(vm);
        }

        // GET: ShoesChoos/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ShoesChoos shoesChoos = db.ShoesChooses.FirstOrDefault(x => x.OptionId == id);
			if (shoesChoos == null) return HttpNotFound();

			ShoesChoosesVM vm = new ShoesChoosesVM()
			{
				OptionId = shoesChoos.OptionId,
				OptinName = shoesChoos.OptinName,
			};

			return View(vm);
        }

        // POST: ShoesChoos/Edit/5
        // 若要免於大量指派 (overposting) 攻擊，請啟用您要繫結的特定屬性，
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OptionId,OptinName")] ShoesChoos shoesChoos)
        {
            if (ModelState.IsValid)
            {
                db.Entry(shoesChoos).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(shoesChoos);
        }

        // GET: ShoesChoos/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            ShoesChoos shoesChoos = db.ShoesChooses.FirstOrDefault(x => x.OptionId == id);
			if (shoesChoos == null) return HttpNotFound();

			ShoesChoosesVM vm = new ShoesChoosesVM()
			{
				OptionId = shoesChoos.OptionId,
				OptinName = shoesChoos.OptinName,
			};

			return View(vm);
        }

        // POST: ShoesChoos/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            ShoesChoos shoesChoos = db.ShoesChooses.Find(id);
            db.ShoesChooses.Remove(shoesChoos);
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
    }
}
