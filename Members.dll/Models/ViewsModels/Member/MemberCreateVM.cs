using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Members.dll.Models.ViewsModels.Member
{
	public class MemberCreateVM
	{
		//public int MemberId { get; set; } //只顯示

		[Display(Name = "姓名")]
		[Required]
		[StringLength(10)]
		public string Name { get; set; }

		[Display(Name = "年紀")]
		public byte? Age { get; set; } //只顯示

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
		[Required]
		[StringLength(10)]
		public string Mobile { get; set; }

		[Display(Name = "信箱")]
		[Required]
		[StringLength(300)]
		public string Email { get; set; }

		[Display(Name = "生日")]
		[Column(TypeName = "date")]
		public DateTime? Birthday { get; set; }

		[Display(Name = "會員等級")]
		public int fk_LevelId { get; set; }

		[Display(Name = "是否為黑名單")]
		public int? fk_BlackListId { get; set; }
	}
}
