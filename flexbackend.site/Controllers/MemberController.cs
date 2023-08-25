using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using EFModels.EFModels;
using Members.dll.Models.ViewsModels;
using Members.dll.Models.lnfra;
using Members.dll.Models.ViewsModels.Member;
using Members.dll.Models.Services;
using Members.dll.Models.Interfaces;
using Members.dll.Models.lnfra.DapperRepositories;
using Members.dll.Models.lnfra.EFRepositories;
using Members.dll.Models.Exts;
using static Discount.dll.Models.Services.ProjectTagService;
using Members.dll.Models.ViewsModels.Staff;

namespace flexbackend.site.Controllers
{
	public class MemberController : Controller
	{
		private AppDbContext db = new AppDbContext();

		// GET: Member
		public ActionResult Index(MemberCriteria criteria)
		{
			var members = db.Members.Include(m => m.BlackList).Include(m => m.MembershipLevel);
			var vms = members.ToList().Select(entity =>
			 new MembersIndexVM
			 {
				 MemberId = entity.MemberId,
				 Name = entity.Name,
				 Gender = entity.Gender,
				 Email = entity.Email,
				 LevelName = entity.MembershipLevel.LevelName,
				 PointSubtotal = entity.MemberPoints.Sum(p => p.PointSubtotal),
				 Registration = entity.Registration,
				 fk_BlackListId = entity.fk_BlackListId
			 });

			PrepareCategoryDataSource(criteria.LevelId);
			ViewBag.Criteria = criteria;
			//查詢,第一次進入網頁 criteria 是沒有值

			var query = db.Members.Include(m => m.MembershipLevel);
			query.Select(m => m.MembershipLevel.LevelName);

			if (string.IsNullOrEmpty(criteria.Name) == false)
			{
				query = query.Where(m => m.Name.Contains(criteria.Name));
			}
			if (criteria.LevelId != 0 && criteria.LevelId > 0)
			{
				query = query.Where(m => m.fk_LevelId == criteria.LevelId);
			}

			var result = query.ToList().Select(m => m.ToIndexDto().ToIndexVM());


			return View(result);
		}


		// GET: Member/Details/5
		public ActionResult Details(int? memberId)
		{
			if (memberId == null)
			{
				return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			}
			Member member = db.Members.Find(memberId);
			if (member == null)
			{
				return HttpNotFound();
			}

			MemberDetailVM vms = new MemberDetailVM
			{
				MemberId = member.MemberId,
				Name = member.Name,
				Age = member.Age,
				Gender = member.Gender,
				Mobile = member.Mobile,
				Email = member.Email,
				Birthday = member.Birthday,
				Registration = member.Registration,
				fk_LevelId = member.fk_LevelId,
				fk_BlackListId = member.fk_BlackListId
			};
			//var behavior = db.Members.Include(m => m.BlackList.Behavior).ToList();


			//ViewBag.Behavior= behavior;
			return View(vms);
		}


		// GET: Member/Create
		public ActionResult Create()
		{
			ViewBag.fk_BlackListId = new SelectList(db.BlackLists, "BlackListId", "Behavior");
			ViewBag.fk_LevelId = new SelectList(db.MembershipLevels, "LevelId", "LevelName");
			PrepareCategoryDataSource(null);

			return View();
		}

		private void PrepareCategoryDataSource(int? id)
		{
			var levelList = db.MembershipLevels.ToList();
			levelList.Insert(0, new MembershipLevel { LevelId = 0, LevelName = "請選擇" });
			ViewBag.LevelId = new SelectList(levelList, "LevelId", "LevelName", id);


			List<SelectListItem> gender = new List<SelectListItem>
			{
			new SelectListItem { Value = "true" , Text = "男" },
			new SelectListItem { Value = "false" , Text = "女" },
			};
			ViewBag.Gender = gender;
		}

		// POST: Member/Create
		// 若要免於大量指派 (overposting) 攻擊，請啟用您要繫結的特定屬性，
		// 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Create([Bind(Include = "MemberId,Name,Age,Gender,Mobile,Email,Birthday,CommonAddress,Account,EncryptedPassword,Registration,IsConfirmed,ConfirmCode,fk_LevelId,fk_BlackListId")] Member member)
		{
			if (ModelState.IsValid)
			{
				db.Members.Add(member);
				db.SaveChanges();
				return RedirectToAction("Index");
			}

			ViewBag.fk_BlackListId = new SelectList(db.BlackLists, "BlackListId", "Behavior", member.fk_BlackListId);
			ViewBag.fk_LevelId = new SelectList(db.MembershipLevels, "LevelId", "LevelName", member.fk_LevelId);
			return View(member);
		}


		// GET: Member/Edit/5

		[Authorize]
		public ActionResult Edit(int memberId)
		{
			if (memberId == 0) return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			MemberService service = GetMemberRepository();
			var member = service.GetMemberId(memberId).ToMembersEditVM();
			ViewBag.fk_BlackListId = new SelectList(db.BlackLists, "BlackListId", "Behavior", member.fk_BlackListId);
			ViewBag.fk_LevelId = new SelectList(db.MembershipLevels, "LevelId", "LevelName", member.fk_LevelId);
			List<SelectListItem> gender = new List<SelectListItem>
			{
			new SelectListItem { Value = "true" , Text = "男" },
			new SelectListItem { Value = "false" , Text = "女" },
			};
			ViewBag.Gender = gender;
			if (memberId == 0) return HttpNotFound();
			return View(member);
		}

		private MemberService GetMemberRepository()
		{
			IMemberRepository repo = new MemberEFRepository();
			return new MemberService(repo);
		}

		// POST: Member/Edit/5
		// 若要免於大量指派 (overposting) 攻擊，請啟用您要繫結的特定屬性，
		// 如需詳細資料，請參閱 https://go.microsoft.com/fwlink/?LinkId=317598。
		[HttpPost]
		[ValidateAntiForgeryToken]
		public ActionResult Edit(MemberEditVM vm)
		{
			ViewBag.fk_BlackListId = new SelectList(db.BlackLists, "BlackListId", "Behavior", vm.fk_BlackListId);
			ViewBag.fk_LevelId = new SelectList(db.MembershipLevels, "LevelId", "LevelName", vm.fk_LevelId);
			PrepareCategoryDataSource(vm.fk_BlackListId);
			if (!ModelState.IsValid) return View(vm);

			MemberService service = GetMemberRepository();
			var result = service.EditMember(vm.ToMembersEditDto());
			if (result.IsSuccess)
			{
				return RedirectToAction("Index");
			}
			else
			{
				return View(vm);
			}
		}

		//[HttpPost]
		//public ActionResult EditBlack()
		//{
		//	// 從資料表中取得資料
		//	var data = db.BlackLists.Select(m=>m.Behavior).ToList();

		//	// 傳遞資料給部分檢視
		//	return PartialView("_BlackListsPartial", data); 
		//}


		// GET: Member/Delete/5
		public ActionResult Delete(int? id)
		{
			if (id == null)
			{
				return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			}
			Member member = db.Members.Find(id);
			if (member == null)
			{
				return HttpNotFound();
			}
			return View(member);
		}

		// POST: Member/Delete/5
		[HttpPost, ActionName("Delete")]
		[ValidateAntiForgeryToken]
		public ActionResult DeleteConfirmed(int id)
		{
			Member member = db.Members.Find(id);
			db.Members.Remove(member);
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
