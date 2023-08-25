using Members.dll.Models.Interfaces;
using Members.dll.Models.lnfra.DapperRepositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Members.dll.Models.Services;
using Members.dll.Models.ViewsModels;
using Members.dll.Models.Exts;
using Members.dll.Models.Dtos;
using Members.dll.Models.lnfra;
using System.Web.ModelBinding;
using System.Web.UI.WebControls;
using EFModels.EFModels;
using System.Web.Security;
using Members.dll.Models.ViewsModels.Staff;
using flexbackend.site.Filters;
using static flexbackend.site.Filters.AuthorizeFilter;
using System.Net;
using System.Data.Entity;
using System.Collections;

namespace flexbackend.site.Controllers
{
	public class StaffsController : Controller
	{
		// 控制器，路由和請求處理get、post ; 畫面呈現

		//Create 也要使用這支method但還沒用
		private StaffService GetStaffRepository()
		{
			IStaffRepository repo = new StaffDapperRepository();
			return new StaffService(repo);
		}
		private AppDbContext db = new AppDbContext();

		/// <summary>
		/// 中級的員工權限才可以編輯員工資料
		/// </summary>
		/// <param name="staffId"></param>
		/// <returns></returns>
		[AuthorizeFilter(UserRole.IntermediatePermission)]
		public ActionResult EditStaff(int staffId)
		{
			if (staffId == 0) return new HttpStatusCodeResult(HttpStatusCode.BadRequest);

			StaffService service = GetStaffRepository();
			var staff = service.GetByStaffId(staffId).ToStaffEditVM();
			
			PrepareCategoryDataSource(0);

			return View(staff);
		}

		[HttpPost]
		[ValidateAntiForgeryToken]
		[AuthorizeFilter(UserRole.IntermediatePermission)]
		public ActionResult EditStaff(EditStaffVM vm)
		{
			PrepareCategoryDataSource(vm.fk_DepartmentId);
			if (ModelState.IsValid == false) return View(vm);
			Result result = ResetStaff(vm);
			if (result.IsSuccess == false)
			{
				ModelState.AddModelError(string.Empty, result.ErrorMessage);
				return View(vm);
			}

			return RedirectToAction("StaffList");
		}

		/// <summary>
		/// 下拉式選單副程式
		/// </summary>
		/// <param name="id"></param>
		private void PrepareCategoryDataSource(int? id)
		{
			var departmentList = db.Departments.ToList();
			departmentList.Insert(0, new Department { DepartmentId = 0, DepartmentName = "請選擇" });

			ViewBag.PermissionsId = new SelectList(db.StaffPermissions, "PermissionsId", "levelName", id);
			ViewBag.DepartmentId = new SelectList(departmentList, "DepartmentId", "DepartmentName", id);
			ViewBag.TitleId = new SelectList(db.JobTitles, "TitleId", "TitleName", id);

			List<SelectListItem> gender = new List<SelectListItem>
			{
			new SelectListItem { Value = "true" , Text = "男" },
			new SelectListItem { Value = "false" , Text = "女" },
			};
			ViewBag.Gender = gender;
		}

		private Result ResetStaff(EditStaffVM vm)
		{
			StaffService service = GetStaffRepository();
			service.ResetStaff(vm.ToStaffEditDto());
			return Result.Success();
		}

		//檢視某筆員工
		public ActionResult GetStaffDetail(int staffId)
		{
			if (staffId == 0)
			{
				return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			}
			StaffService service = GetStaffRepository();
			return View(service.GetStaffDetail(staffId).ToStaffDetailVM());
		}

		
		[AuthorizeFilter(UserRole.AdvancedPermission)]
		public ActionResult DeleteStaff(int staffId)
		{
			//如果staffId為空，返回404錯誤碼
			if (staffId == 0)
			{
				return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
			}

			StaffService service = GetStaffRepository();
			service.DeleteStaff(staffId);
			return RedirectToAction("StaffList");
		}

        [AllowAnonymous]
        public ActionResult EditPassword()
		{
			return View();
		}

		[HttpPost]
		[ValidateAntiForgeryToken]
        [AllowAnonymous]
        public ActionResult EditPassword(EditPasswordVM vm)
		{
			if (ModelState.IsValid == false) return View(vm);
			Result result = UpdatePassword(vm);

			if (result.IsSuccess == false)
			{
				ModelState.AddModelError(string.Empty, result.ErrorMessage);
				return View(vm);
			}
			return RedirectToAction("Login");
		}

		
		public ActionResult ForgetPassword()
		{
			return View();
		}

		[HttpPost]
		[ValidateAntiForgeryToken]
        [AllowAnonymous]
        public ActionResult ForgetPassword(ForgetPasswordVM vm)
		{
			if (ModelState.IsValid == false) return View(vm);

			// 生成email裡的連結
			var urlTemplate = Request.Url.Scheme + "://" +  // 生成 http:.// 或 https://
							 Request.Url.Authority + "/" + // 生成網域名稱或 ip
							 "Staffs/ResetPassword?staffId={0}&confirmCode={1}"; // 生成網頁 url

			Result result = ProcessResetPassword(vm.Account, vm.Email, urlTemplate);

			if (!result.IsSuccess)
			{
				ModelState.AddModelError(string.Empty, result.ErrorMessage);
				return View(vm);
			}			
			return RedirectToAction("ConfirmResetPassword");
		}
        [AllowAnonymous]
        public ActionResult ResetPassword()
		{
			return View();
		}

		[HttpPost]
        [AllowAnonymous]
        public ActionResult ResetPassword(ResetPasswordVM vm, int staffId, string confirmCode)
		{
			if (ModelState.IsValid == false) return View(vm);
			Result result = ProcessChangePassword(staffId, confirmCode, vm.Password);

			if (!result.IsSuccess)
			{
				ModelState.AddModelError(string.Empty, result.ErrorMessage);
				return View(vm);
			}

			return RedirectToAction("Login");
		}
        [AllowAnonymous]
        private Result ProcessChangePassword(int memberId, string confirmCode, string newPassword)
		{
			var db = new AppDbContext();

			// 驗證 memberId, confirmCode是否正確
			var staffInDb = db.Staffs.FirstOrDefault(s => s.StaffId == memberId && s.ConfirmCode == confirmCode);
			if (staffInDb == null) return Result.Fail("找不到對應的會員記錄");

			// 更新密碼,並將 confirmCode清空
			var salt = HashUtility.GetSalt();
			//var encryptedPassword = HashUtility.ToSHA256(newPassword, salt);

			staffInDb.Password = newPassword;
			staffInDb.ConfirmCode = null;

			db.SaveChanges();

			return Result.Success();
		}

        [AllowAnonymous]
        private Result ProcessResetPassword(string account, string email, string urlTemplate)
		{
			var db = new AppDbContext();
			// 檢查account,email正確性
			var staffInDb = db.Staffs.FirstOrDefault(s => s.Account == account);

			if (staffInDb == null) return Result.Fail("帳號或 Email 錯誤"); // 故意不告知確切錯誤原因

			if (string.Compare(email, staffInDb.Email, StringComparison.CurrentCultureIgnoreCase) != 0) return Result.Fail("帳號或 Email 錯誤");

			// 檢查 IsConfirmed必需是true, 因為只有已啟用的帳號才能重設密碼
			if (staffInDb.Account!= account) return Result.Fail("您還沒有啟用本帳號, 請先完成才能重設密碼");

			// 更新記錄, 填入 confirmCode
			var confirmCode = Guid.NewGuid().ToString("N");
			staffInDb.ConfirmCode = confirmCode;
			db.SaveChanges();

			// 發email
			var url = string.Format(urlTemplate, staffInDb.StaffId, confirmCode);
			new EmailHelper().SendForgetPasswordEmail(url, staffInDb.Name, email);

			return Result.Success();
		}

		private Result ResetPassword(ForgetPasswordVM vm)
		{
			StaffService service = GetStaffRepository();
			return service.ResetPassword(vm.ToForgetPasswordDto());
		}

		private Result UpdatePassword(EditPasswordVM vm)
		{
			StaffService service = GetStaffRepository();
			return service.UpdatePassword(vm.ToEditPasswordDto());
		}

		/// <summary>
		/// 沒有權限
		/// </summary>
		/// <returns></returns>
		public ActionResult NoPermission()
		{
			return View();
		}

		public ActionResult Logout()
		{
			Session.Abandon();
			FormsAuthentication.SignOut();
			return Redirect("/Staffs/Login");
		}

        /// <summary>
        /// 登入Get
        /// </summary>
        /// <returns></returns>
        [AllowAnonymous]
        public ActionResult Login()
		{
			return View();
		}

		/// <summary>
		/// 登入POST
		/// </summary>
		/// <param name="vm"></param>
		/// <returns></returns>
		[HttpPost]
		[ValidateAntiForgeryToken]
		[AllowAnonymous]
		public ActionResult Login(LoginVM vm)
		{
			if (ModelState.IsValid == false) return View(vm);

			//對帳號密碼進行驗證
			Result result = ValidLogin(vm);

			//驗證失敗
			if (result.IsSuccess == false)
			{
				ModelState.AddModelError(string.Empty, result.ErrorMessage);
				return View(vm);
			}

			//是否記住登入成功的會員
			const bool remeberMe = false;

			//驗證成功，處理後續登入作業，並將密碼編碼之後加到 Cookie裡面
			(string returnUrl, HttpCookie cookie) processResult = ProcessLogin(vm.Account, remeberMe);
			Response.Cookies.Add(processResult.cookie);

			return Redirect(processResult.returnUrl);
		}

        /// <summary>
        /// 重設密碼通知頁面
        /// </summary>
        /// <returns></returns>
        [AllowAnonymous]
        public ActionResult ConfirmResetPassword()
		{
			return View();
		}

		private (string returnUrl, HttpCookie cookie) ProcessLogin(string account, bool rememberMe)
		{
			var roles = string.Empty; //如用到角色權限就填入

			//建立一張認證票
			var ticket =
				new FormsAuthenticationTicket(
					1,                          //版本別,沒有特別用處
					account,
					DateTime.Now,               //發行日
					DateTime.Now.AddDays(2),    //到期日
					rememberMe,                 //是否續存
					roles,                      //userdata
					"/"                         //cookie位置,通常都放在網站的根目錄
					);

			//將它加密,利用內建的表單認證類別呼叫編碼
			var value = FormsAuthentication.Encrypt(ticket);

			//存入cookie
			var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, value);

			//取得return url
			var url = FormsAuthentication.GetRedirectUrl(account, true); //第二個引數沒有用處

			return (url, cookie);
		}
        [AllowAnonymous]
        private Result ValidLogin(LoginVM vm)
		{
			var db = new AppDbContext();

			//根據帳號去找，並檢查帳號
			var staff = db.Staffs.FirstOrDefault(s => s.Account == vm.Account);
			if (staff == null) return Result.Fail("帳號或密碼有誤");

			//找到帳號，將密碼密碼進行雜湊
			//var salt = HashUtility.GetSalt();
			//var hashPrassword = HashUtility.ToHA256(vm.Password, salt);

			string password = vm.Password;
			Session["UserRole"] = staff.fk_PermissionsId;

			//檢查密碼
			return string.CompareOrdinal(staff.Password, password) == 0
				? Result.Success()
				: Result.Fail("帳號或密碼有誤");
		}

		/// <summary>
		/// 新增員工Get
		/// </summary>
		/// <returns></returns>
		public ActionResult CreateStaff()
		{
			PrepareCategoryDataSource(null);
			return View();
		}

		/// <summary>
		/// 新增員工POST
		/// </summary>
		/// <param name="vm"></param>
		/// <returns></returns>
		[HttpPost]
		[ValidateAntiForgeryToken] //防止跨網站偽造請求的攻擊
		[Authorize]
		public ActionResult CreateStaff(StaffsCreateVM vm)
		{
			Session["Account"] = "Account";
			Session["Password"] = "Password";
			//判斷資料是否通過驗證
			//不通過驗證，再次返回 StaffsCreateVM 
			if (ModelState.IsValid == false) return View(vm);

			PrepareCategoryDataSource(vm.fk_DepartmentId);
			Result result = Create(vm);
			if (result.IsSuccess)
			{
				return RedirectToAction("StaffList");
			}
			else
			{
				//通過驗證，將資料存到db
				ModelState.AddModelError(string.Empty, result.ErrorMessage);
			}	
			return View();
		}

		/// <summary>
		/// 新增員工Result
		/// </summary>
		/// <param name="vm"></param>
		/// <returns></returns>
		private Result Create(StaffsCreateVM vm)
		{
			StaffService service = GetStaffRepository();
			StaffsCreateDto dto = vm.ToStaffsCreateDto();
			
			return service.CreateStaff(dto);
		}

		/// <summary>
		/// 員工總覽
		/// </summary>
		/// <param name="criteria"></param>
		/// <returns></returns>
		[Authorize]
		public ActionResult StaffList(StaffCriteria criteria)
		{
			PrepareCategoryDataSource(criteria.DepartmentId);
			ViewBag.Criteria = criteria;
			//查詢,第一次進入網頁 criteria 是沒有值

			var query = db.Staffs.Include(d => d.Department);
			query.Select(d => d.Department.DepartmentName);

			if (string.IsNullOrEmpty(criteria.Name) == false)
			{
				query = query.Where(d => d.Name.Contains(criteria.Name));
			}
			if (criteria.DepartmentId != null && criteria.DepartmentId.Value > 0)
			{
				query = query.Where(d => d.fk_DepartmentId == criteria.DepartmentId.Value);
			}

			var result = query.ToList().Select(d => d.ToStaffsIndexDto().ToStaffsIndexVM());

			StaffService service = GetStaffRepository();
			return View(result);//return View (model)
		}
	}
}