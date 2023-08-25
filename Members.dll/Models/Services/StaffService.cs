using EFModels.EFModels;
using Members.dll.Models.Dtos;
using Members.dll.Models.Dtos.Staff;
using Members.dll.Models.Exts;
using Members.dll.Models.Interfaces;
using Members.dll.Models.lnfra;
using Members.dll.Models.ViewsModels;
using Members.dll.Models.ViewsModels.Staff;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Reflection;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;
using System.Web.Helpers;
using System.Xml.Linq;

namespace Members.dll.Models.Services
{
	//商業邏輯判斷
	public class StaffService
	{
		private IStaffRepository _repo;
		public StaffService(IStaffRepository repo)
		{
			_repo = repo;
		}
		public Result UpdatePassword(EditPasswordDto dto)
		{
			var db = new AppDbContext();
			var staffAccount = db.Staffs.ToList().Select(s => s.Account);
			var staffPassword = db.Staffs.ToList().Select(s => s.Password);
			string newpassword = dto.NewPassword;
			string oldpassword = dto.OldPassword;

			//判斷帳號是否存在、舊密碼是否相同
			if (!staffAccount.Contains(dto.Account))
			{
				return Result.Fail("帳號或密碼錯誤");
			}
			else if (!staffPassword.Contains(oldpassword))
			{
				return Result.Fail("帳號或密碼錯誤");
			}
			else
			{
				_repo.SaveNewPassword(newpassword, dto.Account);
				return Result.Success();
			}
		}

		//忘記密碼
		public Result ResetPassword(ForgetPasswordDto dto)
		{
			var db = new AppDbContext();
			var staffAccount = db.Staffs.ToList().Select(s => s.Account);

			//判斷帳號是否存在
			if (!staffAccount.Contains(dto.Account))
			{
				return Result.Fail("帳號或密碼錯誤");
			}
			else
			{
				string newpassword = dto.NewPassword;
				_repo.SaveNewPassword(newpassword, dto.Account);
				return Result.Success();
			}
		}

		//Login 沒有寫到三層式
		public Result Login()
		{
			//判斷帳號、密碼是否存在
			//if(vm.Account==Staff.)


			return Result.Success();
		}
		//Create		
		public Result CreateStaff(StaffsCreateDto dto)
		{
			//判斷收到的資料是否正確
			string account = dto.Account;
			string password = dto.Password;
			if (account == null && password == null)
			{
				account = dto.Name;
				password = "abc";
			}

			//計算年齡，目前年分-出生年份.
			bool age = dto.Age.HasValue;
			int newStaffAge;

			if (age == false)
			{
				newStaffAge = DateTime.Today.Year - dto.Birthday.Value.Year;
			}
			else
			{
				newStaffAge = DateTime.Today.Year - dto.Birthday.Value.Year;
			}
			dto.Age = (byte)newStaffAge;

			dto = new StaffsCreateDto
			{
				Name = dto.Name,
				Birthday = dto.Birthday.Value,
				Gender = dto.Gender,
				Age = (byte)newStaffAge,
				Email = dto.Email,
				Account = account,
				Password = password,
				fk_PermissionsId = dto.fk_PermissionsId,
				fk_TitleId = dto.fk_TitleId,
				fk_DepartmentId = dto.fk_DepartmentId,
			};
			//存到db
			_repo.CreateStaff(dto);

			return Result.Success();
		}

		//Read
		public List<StaffsIndexVM> GetStaffs()
		{
			var staffs = _repo.GetStaffs();
			List<StaffsIndexVM> staffsIndexVM = staffs.Select(s => s.ToStaffsIndexVM()).ToList();
			return staffsIndexVM;
		}

		public Result DeleteStaff(int staffId)
		{
			var db = new AppDbContext();
			var result = db.Staffs.Where(s => s.StaffId == staffId).FirstOrDefault();
			_repo.DeleteStaff(staffId);
			return Result.Fail("找不到此員工");
		}

		public StaffDetailDto GetStaffDetail(int staffId)
		{
			var result = _repo.StaffDetail(staffId);
			if (result == null)
			{
				return new StaffDetailDto();
			}
			StaffDetailDto staffDetailDto = _repo.StaffDetail(staffId);
			return staffDetailDto;
		}

		public EditStaffDto GetByStaffId(int staffId)
		{
			//如果取得會員生日
			//將格式轉換
			//塞給dto
			return _repo.GetByStaffId(staffId);
		}

		public Result ResetStaff(EditStaffDto dto)
		{
			
			if (dto.fk_DepartmentId == 0)
			{
				return Result.Fail("尚未選取同仁所屬部門");
			}

			if (dto == null)
			{
				return Result.Fail("找不到員工");
			}

			_repo.EditStaff(dto);
			return Result.Success();
		}


	}
}
