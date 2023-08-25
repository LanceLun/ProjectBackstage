using Members.dll.Models.Dtos;
using Members.dll.Models.ViewsModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Members.dll.Models.Exts
{
	//擴充方法，將RegisterVM 轉為 RegisterDto，寫入資料庫
	public static class RegisterExts
	{
		public static RegisterDto ToDto(this RegisterVM vm)
		{
			return new RegisterDto()
			{
				Account = vm.Account,
				Password = vm.Password,
				Name = vm.Name,
				Gender = vm.Gender,
				Mobile = vm.Mobile,
				Email = vm.Email,
				Birthday = vm.Birthday
			};
		}
	}
}
