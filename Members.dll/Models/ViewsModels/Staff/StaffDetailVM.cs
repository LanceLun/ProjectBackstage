using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Members.dll.Models.ViewsModels.Staff
{
	public class StaffDetailVM
	{
		[Display(Name ="員工編號")]
		public int StaffId { get; set; }

		[Display(Name = "部門")]
		public string Department { get; set; }

		[Display(Name = "職稱")]
		public string TitleName { get; set; }

		public bool? Gender { get; set; }

		[Display(Name = "性別")]
		public string GenderStr
		{
			get
			{
				return Gender.HasValue ? (this.Gender.Value ? "男" : "女") : "";
			}
		}

		[Display(Name = "姓名")]
		public string Name { get; set; }

		[Display(Name = "年齡")]
		public byte? Age { get; set; }

		[Display(Name = "手機")]
		[StringLength(30)]
		public string Mobile { get; set; }

		[Display(Name = "信箱")]
		public string Email { get; set; }

		[Display(Name = "生日")]
		[DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
		public DateTime? Birthday { get; set; }

		[Display(Name = "權限")]
		public string StaffPermission { get; set; }

		[Display(Name = "到職日")]
		[DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
		public DateTime? DueDate { get; set; }
	}
}
