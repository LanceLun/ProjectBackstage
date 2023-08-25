using EFModels.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Data.Entity;
using Flex_Activity.dll.Models.Exts;
using Flex_Activity.dll.Models.ViewModels;
using System.Net;

namespace flexbackend.site.Controllers
{
	public class ActivityController : Controller
	{

		private AppDbContext db = new AppDbContext();

		// GET: Activity
		public ActionResult Index(ActivitySearchCriteria criteria)
		{
			ViewBag.Criteria = criteria;
			PrepareCategoryDataSource(criteria.CategoryId);

			//查詢紀錄，由於第一次進到這個網頁的時候，criteria是沒有值的
			var query = db.Activities.Include(a => a.ActivityCategory);

			#region Where
			if (string.IsNullOrEmpty(criteria.ActivityName) == false)
			{
				query = query.Where(a => a.ActivityName.Contains(criteria.ActivityName));
			}
			if (criteria.CategoryId != null && criteria.CategoryId.Value > 0)
			{
				query = query.Where(a => a.fk_ActivityCategoryId == criteria.CategoryId.Value);
			}
			#endregion

			var activities = query.ToList()
								  .Select(a => a.ToIndexVM());
			return View(activities);
		}

		public ActionResult Create()
		{
			//ViewBag.fk_ActivityCategoryId = new SelectList(db.ActivityCategories, "ActivityCategoryId", "ActivityCategoryName");
			PrepareCategoryDataSource(null);

			//ViewBag.fk_SpeakerId = new SelectList(db.Speakers, "SpeakerId", "SpeakerName");
			PrepareSpeakerDataSource(null);
			return View();
		}

		[HttpPost]
		public ActionResult Create(ActivityCreateVM vm, HttpPostedFileBase file1)
		{

			//取得活動類別需要下拉清單的內容

			PrepareCategoryDataSource(vm.fk_ActivityCategoryId);


			////取得活動講者需要下拉清單的內容
			PrepareSpeakerDataSource(vm.fk_SpeakerId);



			if (ModelState.IsValid) //如果通過欄位驗證
			{
				DateTime now = DateTime.Now;
				DateTime lastWeek = vm.ActivityDate.AddDays(-7); //活動日期前7天

				//今天 <= 報名開始時間 < 報名結束時間 < 活動日期 - 7天

				if (file1 == null || file1.ContentLength == 0)
				{
					ModelState.AddModelError("ActivityImage", "活動照片必填");
					return View(vm);
				}

				if (vm.ActivityBookEndTime >= lastWeek)
				{
					//報名結束日期要晚於活動日期一個禮拜前
					ModelState.AddModelError(string.Empty, "報名結束日期需早於活動日期一個禮拜以上");
					return View(vm);
				}
				if (vm.ActivityDate < now || vm.ActivityBookStartTime < now || vm.ActivityBookEndTime < now)
				{
					//活動時間及報名時間不能早於今天
					ModelState.AddModelError(string.Empty, "請再次確認活動時間及報名時間");
					return View(vm);
				}
				if (vm.ActivityBookStartTime >= vm.ActivityBookEndTime)
				{
					//報名時間的起訖有誤
					ModelState.AddModelError("ActivityBookEndTime", "報名時間有誤");
					return View(vm);
				}


				if (vm.ActivityOriginalPrice <= vm.ActivitySalePrice)
				{
					ModelState.AddModelError("ActivityOriginalPrice", "請再次確認活動價格");
					return View(vm);
				}

				else
				{
					//將file存檔，並取得最後存檔的檔案名稱
					//path = 路徑
					string path = Server.MapPath("~/Public/Img");

					//檔案要存放的資料夾位置
					string fileName = SaveUploadedFile(path, file1);

					//將【路徑+檔名】存入vm裡
					vm.ActivityImage = fileName;


					//將 view model轉型為Activity
					Activity activity = vm.ToEntity();

					//新增一筆紀錄
					db.Activities.Add(activity);
					db.SaveChanges();

					//網頁轉到Activity /Index/
					return RedirectToAction("Index");
				}

			}

			//如果驗證失敗，就留在本網頁
			return View(vm);
		}

		private string SaveUploadedFile(string path, HttpPostedFileBase file1)
		{
			//如果沒有上傳檔案或檔案是空的, 就不處理, 傳回string.empty
			if (file1 == null || file1.ContentLength == 0) return string.Empty;



			//取得上傳檔案的副檔名 (副檔名 = ext)
			string ext = System.IO.Path.GetExtension(file1.FileName); //".jpg"而不是"jpg"

			//如果副檔名不在允許的範圍裡, 表示上傳不合理的檔案類型, 就不處理, 傳回string.empty
			string[] allowedExts = new string[] { ".jpg", ".jpeg", ".png", ".tif" };
			if (allowedExts.Contains(ext.ToLower()) == false) return string.Empty;

			//生成一個不會重複的副檔名
			string newFileName = Guid.NewGuid().ToString("N") + ext;  //生成er537245dfd5552.jpg
			string fullName = System.IO.Path.Combine(path, newFileName); //結合路徑和副檔名

			//將上傳檔案存放到指定位置，把file1存到fullName
			file1.SaveAs(fullName);

			//傳回存放的檔名
			return newFileName;

		}

		public ActionResult Edit(int? id)
		{
			if (id == null)
			{
				return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			}
			Activity activity = db.Activities.Find(id);

			if (activity == null)
			{
				return HttpNotFound();
			}

			ActivityEditVM vm = activity.ToEditVM();
			//取得活動類別需要下拉清單的內容
			//ViewBag.fk_ActivityCategoryId = new SelectList(db.ActivityCategories, "ActivityCategoryId", "ActivityCategoryName", vm.fk_ActivityCategoryId);
			PrepareCategoryDataSource(vm.fk_ActivityCategoryId);

			//取得活動講者需要下拉清單的內容
			//ViewBag.fk_SpeakerId = new SelectList(db.Speakers, "SpeakerId", "SpeakerName", vm.fk_SpeakerId);
			PrepareSpeakerDataSource(vm.fk_SpeakerId);

			return View(vm);
		}

		[HttpPost]
		public ActionResult Edit(string ActivityDate, ActivityEditVM vm)
		{
			
			if (ModelState.IsValid)
			{
				Activity activity = vm.ToEntity();
				db.Entry(activity).State = EntityState.Modified;
				db.SaveChanges();
				return RedirectToAction("Index");
			}
			//ViewBag.fk_ActivityCategoryId = new SelectList(db.ActivityCategories, "ActivityCategoryId", "ActivityCategoryName", vm.fk_ActivityCategoryId);
			PrepareCategoryDataSource(vm.fk_ActivityCategoryId);

			//ViewBag.fk_SpeakerId = new SelectList(db.Speakers, "SpeakerId", "SpeakerName", vm.fk_SpeakerId);
			PrepareSpeakerDataSource(vm.fk_SpeakerId);

			return View(vm);

		}

		//Get：Delete
		public ActionResult Delete(int? id)
		{
			if (id == null)
			{
				return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			}
			Activity activity = db.Activities.Find(id);
			if (activity == null)
			{
				return HttpNotFound();
			}
			ActivityDetailVM vm = activity.ToDetailVM();
			return View(vm);

		}

		[HttpPost]
		[ActionName("Delete")]
		[ValidateAntiForgeryToken]
		public ActionResult DeleteConfirmed(int id)
		{
			Activity activity = db.Activities.Find(id);
			db.Activities.Remove(activity);
			db.SaveChanges();
			return RedirectToAction("Index");
		}

		public ActionResult Details(int? id)
		{
			if (id == null)
			{
				return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			}
			Activity activity = db.Activities.Find(id);
			if (activity == null)
			{
				return HttpNotFound();
			}

			ActivityDetailVM vm = activity.ToDetailVM();
			return View(vm);
		}

		private void PrepareCategoryDataSource(int? categoryId)
		{
			var categories = db.ActivityCategories.ToList().Prepend(new ActivityCategory { ActivityCategoryId = 0, ActivityCategoryName = "活動分類" });
			ViewBag.fk_ActivityCategoryId = new SelectList(categories, "ActivityCategoryId", "ActivityCategoryName", categoryId);
		}

		private void PrepareSpeakerDataSource(int? speakerId)
		{
			var speakers = db.Speakers.ToList().Prepend(new Speaker { SpeakerId = 0, SpeakerName = "講師" });
			ViewBag.fk_SpeakerId = new SelectList(speakers, "SpeakerId", "SpeakerName", speakerId);
		}


	}
}
