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
    public class Customized_materialsController : Controller
    {
        private AppDbContext db = new AppDbContext();

        // GET: Customized_materials
        public ActionResult Index(CustomizedMaterialsCriteria criteria)
        {
			criteria = criteria ?? new CustomizedMaterialsCriteria();

			ViewBag.Criteria = criteria;

			IEnumerable<Customized_materials> query = db.Customized_materials;
			
            #region where
			if (string.IsNullOrEmpty(criteria.Material_Name) == false)
			{
				query = query.Where(p => p.material_Name.Contains(criteria.Material_Name));
			}
			#endregion

			var materials = query.ToList().Select(p => p.ToMaVM());

			return View(materials);
        }

        // GET: Customized_materials/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customized_materials customized_materials = db.Customized_materials.FirstOrDefault(x => x.Shoesmaterial_Id == id);
			if (customized_materials == null) return HttpNotFound();

			Customized_materialsVM vm = new Customized_materialsVM()
			{
				Shoesmaterial_Id = customized_materials.Shoesmaterial_Id,
                Material_Name = customized_materials.material_Name,
			};

			return View(vm);
        }

        // GET: Customized_materials/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Customized_materials/Create
        // 若要免於大量指派 (overposting) 攻擊，請啟用您要繫結的特定屬性，
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create(Customized_materialsVM vm)
        {
            if (ModelState.IsValid)
            {
                Customized_materials customized = vm.ToMaEntity();

                db.Customized_materials.Add(customized);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(vm);
        }

        // GET: Customized_materials/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customized_materials customized_materials = db.Customized_materials.FirstOrDefault(x => x.Shoesmaterial_Id == id);
			if (customized_materials == null) return HttpNotFound();

			Customized_materialsVM vm = new Customized_materialsVM()
			{
				Shoesmaterial_Id = customized_materials.Shoesmaterial_Id,
				Material_Name = customized_materials.material_Name,
			};

			return View(vm);
        }

        // POST: Customized_materials/Edit/5
        // 若要免於大量指派 (overposting) 攻擊，請啟用您要繫結的特定屬性，
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Shoesmaterial_Id,material_Name")] Customized_materials customized_materials)
        {
            if (ModelState.IsValid)
            {
                db.Entry(customized_materials).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(customized_materials);
        }

        // GET: Customized_materials/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Customized_materials customized_materials = db.Customized_materials.FirstOrDefault(x => x.Shoesmaterial_Id == id);
			if (customized_materials == null) return HttpNotFound();
			
            Customized_materialsVM vm = new Customized_materialsVM()
			{
				Shoesmaterial_Id = customized_materials.Shoesmaterial_Id,
				Material_Name = customized_materials.material_Name,
			};

			return View(vm);
        }

        // POST: Customized_materials/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Customized_materials customized_materials = db.Customized_materials.Find(id);
            db.Customized_materials.Remove(customized_materials);
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
