using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Members.dll.Models.ViewsModels.Staff
{
	public class ForgetPasswordVM
	{
		[Display(Name = "帳號")]
		[Required]
		public string Account { get; set; }

		[Display(Name = "信箱")]
		[Required]
		public string Email { get; set; }
	}
}
