using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using EFModels.EFModels;

namespace flexbackend.site.Controllers
{
    public class MembershipLevelsController : Controller
    {
        private AppDbContext db = new AppDbContext();

        // GET: MembershipLevels
        public ActionResult Index()
        {
            return View(db.MembershipLevels.ToList());
        }

        // GET: MembershipLevels/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MembershipLevel membershipLevel = db.MembershipLevels.Find(id);
            if (membershipLevel == null)
            {
                return HttpNotFound();
            }
            return View(membershipLevel);
        }

        // GET: MembershipLevels/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: MembershipLevels/Create
        // 若要免於大量指派 (overposting) 攻擊，請啟用您要繫結的特定屬性，
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "LevelId,LevelName,MinSpending,Discount,Description")] MembershipLevel membershipLevel)
        {
            if (ModelState.IsValid)
            {
                db.MembershipLevels.Add(membershipLevel);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(membershipLevel);
        }

        // GET: MembershipLevels/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MembershipLevel membershipLevel = db.MembershipLevels.Find(id);
            if (membershipLevel == null)
            {
                return HttpNotFound();
            }
            return View(membershipLevel);
        }

        // POST: MembershipLevels/Edit/5
        // 若要免於大量指派 (overposting) 攻擊，請啟用您要繫結的特定屬性，
        // 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "LevelId,LevelName,MinSpending,Discount,Description")] MembershipLevel membershipLevel)
        {
            if (ModelState.IsValid)
            {
                db.Entry(membershipLevel).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(membershipLevel);
        }

        // GET: MembershipLevels/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            MembershipLevel membershipLevel = db.MembershipLevels.Find(id);
            if (membershipLevel == null)
            {
                return HttpNotFound();
            }
            return View(membershipLevel);
        }

        // POST: MembershipLevels/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            MembershipLevel membershipLevel = db.MembershipLevels.Find(id);
            db.MembershipLevels.Remove(membershipLevel);
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
