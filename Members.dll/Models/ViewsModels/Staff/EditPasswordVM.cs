using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Members.dll.Models.ViewsModels.Staff
{
	public class EditPasswordVM
	{
		[Display(Name = "帳號")]
		[Required]
		public string Account { get; set; }

		[Display(Name = "舊密碼")]
		[Required]
		[DataType(DataType.Password)]
		[StringLength(10)]
		public string OldPassword { get; set; }

		[Display(Name = "新設密碼")]
		[Required]
		[DataType(DataType.Password)]
		[StringLength(10)]
		public string NewPassword { get; set; }

		[Display(Name = "確認密碼")]
		[Required]
		[DataType(DataType.Password)]
		[Compare("NewPassword", ErrorMessage = "必須與新設密碼相同")]		
		[StringLength(10)]
		public string ConfirmPassword { get; set; }
	}
}
