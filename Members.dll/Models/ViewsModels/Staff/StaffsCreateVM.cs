using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Members.dll.Models.ViewsModels
{
	public class StaffsCreateVM
	{
		[Display(Name = "編號")]
		public int StaffId { get; set; }

		[Display(Name = "部門")]
		[Required]
		public int fk_DepartmentId { get; set; }

		public string Department { get; set; }

		[Display(Name = "職稱")]
		[Required]
		public int fk_TitleId { get; set; }

		public string JobTitle { get; set; }

		[Display(Name = "姓名")]
		[Required]
		[StringLength(30)]
		public string Name { get; set; }

		[Display(Name = "年齡")]
		public byte Age { get; set; }

		[Display(Name = "生日")]
		[Required]
		[DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]

		public DateTime? Birthday { get; set; }

		public bool? Gender { get; set; }

		[Display(Name = "性別")]
		[Required]
		public string GenderStr
		{
			get { return Gender.HasValue ? (this.Gender.Value ? "男" : "女") : ""; }
		}

		[Display(Name = "信箱")]
		[Required]
		[StringLength(300)]
		[EmailAddress]
		public string Email { get; set; }

		[Display(Name = "權限")]
		[Required]
		public int fk_PermissionsId { get; set; }
		public string StaffPermission { get; set; }

	}
}
