using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Members.dll.Models.ViewsModels
{
	//會員註冊頁面，驗證欄位格式
	public class RegisterVM
	{
		[Required]
		[StringLength(30)]
		[Display(Name = "帳號")]
		public string Account { get; set; }

		[Required]
		[StringLength(70)]
		[Display(Name = "密碼")]
		[DataType(DataType.Password)]
		public string Password { get; set; }

		[Display(Name = "確認密碼")]
		[Compare("Password",ErrorMessage="必須與'密碼'欄位值相同")]
		public string ConfirmPassword { get; set; }

		[Required]
		[StringLength(30)]
		[Display(Name="姓名")]
		public string Name { get; set; }

		[Display(Name = "性別")]
		public bool? Gender { get; set; }

		[Required]
		[StringLength(10)]
		[Display(Name = "手機")]
		public string Mobile { get; set; }

		[Required]
		[StringLength(300)]
		[Display(Name = "信箱")]
		public string Email { get; set; }

		[Display(Name = "生日")]
		public DateTime? Birthday { get; set; }
	}
}
