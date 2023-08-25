using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Members.dll.Models.Dtos
{
	public class ForgetPasswordDto
	{
		public string Account { get; set; }

		public string NewPassword { get; set; }

		public string ConfirmPassword { get; set; }
	}
}
