using EFModels.EFModels;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace flexbackend.site.Filters
{
	public class AuthorizeFilter : AuthorizeAttribute
	{
		private AppDbContext db = new AppDbContext();

		/// <summary>
		/// 角色定義
		/// </summary>
		public enum UserRole
		{
			[Description("一般權限")]
			GeneralPermission = 1,

			[Description("中级權限")]
			IntermediatePermission = 2,

			[Description("高级權限")]
			AdvancedPermission = 3
		}


		public UserRole CheckUserRole { get; set; }//檢查角色的權限

		/// <summary>
		/// 建構子
		/// </summary>
		/// <param name="checkRole"></param>
		public AuthorizeFilter(UserRole checkRole)
		{
			CheckUserRole = checkRole;
		}

		/// <summary>
		/// 權限檢查
		/// </summary>
		/// <param name="httpContext"></param>
		/// <returns></returns>
		/// <exception cref="ArgumentNullException"></exception>
		protected override bool AuthorizeCore(HttpContextBase httpContext)
		{
			if (httpContext == null)
			{
				throw new ArgumentNullException("httpContext");
			}
			bool CheckResult = false; //不符合權限

			//取得用戶角色
			UserRole userRole = UserRole.GeneralPermission;//預設角色

			// 檢查用戶是否已經登入並有相應的角色設定
			if (httpContext.Session["UserRole"] != null)
			{
				// 從 Session 取得角色
				userRole = (UserRole)Convert.ToInt32(httpContext.Session["UserRole"].ToString());
			}
			else
			{
				httpContext.Session["UserRole"] = userRole.ToString(); // 存储角色到 Session
			}

			//如果使用者是高級權限角色直接通過
			if (userRole == UserRole.AdvancedPermission)
			{
				return true;
			}

			//檢查一般會員權限
			if (CheckUserRole == UserRole.GeneralPermission)
			{
				if (userRole == UserRole.GeneralPermission)
				{
					return true;
				}
			}
			return CheckResult;
		}

		/// <summary>
		/// 權限檢查失敗
		/// </summary>
		/// <param name="filterContext"></param>
		protected override void HandleUnauthorizedRequest(AuthorizationContext filterContext)
		{
			//權限檢查失敗，轉跳至指定頁面
			filterContext.Result = new RedirectResult("~/Staffs/NoPermission");
		}
	}
}