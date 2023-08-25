using Members.dll.Models.ViewsModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Security.Principal;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Members.dll.Models.Dtos
{
	//Dto用來傳遞資料
	public class RegisterDto
	{
		public string Account { get; set; }

		public string Password { get; set; }

		public string EncryptedPassword { get; set; } //雜湊後的密碼
		
		public string Name { get; set; }

		public bool? Gender { get; set; }

		public string Mobile { get; set; }

		public string Email { get; set; }

		public DateTime? Birthday { get; set; }

		public bool IsConfirmed { get; set; }

		public string ConfirmCode { get; set; }
	}
}
