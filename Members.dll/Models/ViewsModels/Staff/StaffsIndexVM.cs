using EFModels.EFModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Members.dll.Models.ViewsModels
{
	public class StaffsIndexVM
	{
		[Display(Name = "編號")]
		public int StaffId { get; set; }

		[Display(Name = "部門")]
		public int fk_DepartmentId { get; set; }

		[Display(Name = "職稱")]
		public int fk_TitleId { get; set; }

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
		[StringLength(30)]
		public string Name { get; set; }

		[Display(Name = "年齡")]
		public byte? Age { get; set; }

		[Display(Name = "信箱")]
		[StringLength(300)]
		public string Email { get; set; }

		[Display(Name = "權限")]
		public string levelName { get; set; }

		[Display(Name = "部門")]
		public string Department { get; set; }

		[Display(Name = "職稱")]
		public string TitleIdName { get; set; }

		public int fk_PermissionsId { get; set; }

		[Display(Name = "入職時間")]
		[DisplayFormat(DataFormatString = "{0:yyyy/MM/dd}")]
		public DateTime? DueDate { get; set; }
	}
}
