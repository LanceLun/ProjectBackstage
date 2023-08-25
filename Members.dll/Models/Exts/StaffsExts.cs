using EFModels.EFModels;
using Members.dll.Models.Dtos;
using Members.dll.Models.Dtos.Staff;
using Members.dll.Models.ViewsModels;
using Members.dll.Models.ViewsModels.Staff;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;

namespace Members.dll.Models.Exts
{
	public static class StaffsExts
	{
		public static ForgetPasswordDto ToForgetPasswordDto(this ForgetPasswordVM vm)
		{
			return new ForgetPasswordDto
			{
				Account = vm.Account,
				NewPassword = vm.Email,
				//ConfirmPassword = vm.ConfirmPassword
			};
		}

		public static EditPasswordDto ToEditPasswordDto(this EditPasswordVM vm)
		{
			return new EditPasswordDto
			{
				Account = vm.Account,
				OldPassword = vm.OldPassword,
				NewPassword = vm.NewPassword,
				ConfirmPassword = vm.ConfirmPassword
			};
		}

		public static StaffsCreateDto ToStaffsCreateDto(this StaffsCreateVM vm)
		{
			return new StaffsCreateDto()
			{
				Department = vm.Department,
				JobTitle = vm.JobTitle,
				Name = vm.Name,
				Age = vm.Age,
				Birthday = vm.Birthday,
				Gender = vm.Gender,
				Email = vm.Email,
				StaffPermission = vm.StaffPermission,
				fk_TitleId = vm.fk_TitleId,
				fk_PermissionsId=vm.fk_PermissionsId,
				fk_DepartmentId=vm.fk_DepartmentId
			};
		}

		public static StaffsIndexVM ToStaffsIndexVM(this StaffsIndexDto dto)
		{
			return new StaffsIndexVM()
			{
				StaffId = dto.StaffId,
				Name = dto.Name,
				Age = dto.Age,
				Gender = dto.Gender,
				Email = dto.Email,
				DueDate = dto.DueDate,
				fk_DepartmentId = dto.fk_DepartmentId,
				fk_TitleId = dto.fk_TitleId,
				fk_PermissionsId = dto.fk_PermissionsId,
				Department = dto.Department,
				TitleIdName = dto.TitleIdName,
				levelName = dto.levelName,
			};
		}

		public static StaffsIndexDto ToStaffsIndexDto(this Staff entity)
		{
			return new StaffsIndexDto()
			{
				StaffId = entity.StaffId,
				Name = entity.Name,
				Age = entity.Age,
				Gender = entity.Gender,
				Email = entity.Email,
				DueDate = entity.DueDate,
				fk_DepartmentId = entity.fk_DepartmentId,
				fk_TitleId = entity.fk_TitleId,
				fk_PermissionsId = entity.fk_PermissionsId,
				Department = entity.Department.DepartmentName,
				TitleIdName = entity.JobTitle.TitleName,
				levelName = entity.StaffPermission.LevelName
			};
		}

		public static StaffDetailVM ToStaffDetailVM(this StaffDetailDto dto)
		{
			return new StaffDetailVM()
			{
				StaffId = dto.StaffId,
				Department = dto.Department,
				TitleName = dto.TitleName,
				Gender = dto.Gender,
				Name = dto.Name,
				Age = dto.Age,
				Email = dto.Email,
				StaffPermission = dto.LevelName,
				DueDate = dto.DueDate,
				Mobile = dto.Mobile,
				Birthday = dto.Birthday
			};
		}

		public static EditStaffDto ToStaffEditDto(this EditStaffVM vm)
		{
			return new EditStaffDto()
			{
				StaffId = vm.StaffId,
				Name = vm.Name,
				Age = vm.Age,
				Gender = vm.Gender,
				Mobile = vm.Mobile,
				Email = vm.Email,
				Birthday = vm.Birthday,
				DueDate = vm.DueDate,
				fk_DepartmentId = vm.fk_DepartmentId,
				fk_TitleId = vm.fk_TitleId,
				fk_PermissionsId = vm.fk_PermissionsId
			};
		}

		public static EditStaffVM ToStaffEditVM(this EditStaffDto dto)
		{
			return new EditStaffVM()
			{
				StaffId = dto.StaffId,
				Name = dto.Name,
				Age = dto.Age,
				Gender = dto.Gender,
				Mobile = dto.Mobile,
				Email = dto.Email,
				Birthday = dto.Birthday,
				DueDate = dto.DueDate,
				fk_DepartmentId = dto.fk_DepartmentId,
				fk_TitleId = dto.fk_TitleId,
				fk_PermissionsId = dto.fk_PermissionsId
			};
		}
	}
}
