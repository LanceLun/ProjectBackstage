using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Members.dll.Models.ViewsModels
{
	public class MemberEditVM
	{
		[Display(Name = "會員編號")]
		public int MemberId { get; set; } 

		[Display(Name="姓名")] 
		[StringLength(10)]
		public string Name { get; set; }

		[Display(Name = "性別")]
		public bool? Gender { get; set; }

		public string GenderStr
		{
			get
			{
				return Gender.HasValue ? (this.Gender.Value ? "男" : "女") : "";
			}
		}

		[Display(Name = "手機")]
		[StringLength(10)]
		public string Mobile { get; set; }

		[Display(Name = "信箱")]
		[StringLength(300)]
		public string Email { get; set; }

		[Display(Name="生日")]
		[Column(TypeName = "date")]
		public DateTime? Birthday { get; set; }

		[Display(Name = "會員等級")]
		public int fk_LevelId { get; set; }

		[Display(Name = "是否為黑名單")] 
		public int? fk_BlackListId { get; set; }
		public string fk_BlackListIdStr
		{
			get
			{
				return fk_BlackListId.HasValue && fk_BlackListId.Value > 0 ? "是" : "否";
			}
		}

		//public int BlackListId { get; set; }

		//public string Behavior { get; set; }

	}
}
