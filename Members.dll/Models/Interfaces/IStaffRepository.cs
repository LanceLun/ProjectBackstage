using EFModels.EFModels;
using Members.dll.Models.Dtos;
using Members.dll.Models.Dtos.Staff;
using Members.dll.Models.ViewsModels;
using Members.dll.Models.ViewsModels.Staff;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Members.dll.Models.Interfaces
{
	public interface IStaffRepository
	{
		void SaveNewPassword(string newpassword,string account);//收到變更後的密碼

		void CreateStaff(StaffsCreateDto dto);//新增員工資料

		IEnumerable<StaffsIndexDto> GetStaffs();//取得員工資料

		void DeleteStaff(int staffId);

		StaffDetailDto StaffDetail(int staffId);

		EditStaffDto GetByStaffId(int staffId);

		void EditStaff(EditStaffDto dto);

		void UpdatePassword(string newpassword, string account);
	}
}
