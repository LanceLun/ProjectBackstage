using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Members.dll.Models.ViewsModels.MembershipLevels
{
	public class LevelIndexVM
	{
		public int LevelId { get; set; }
		//public int PrivilegeId { get; set; }

		[Display(Name = "等級名稱")]
		public string LevelName { get; set; }

		[Display(Name = "升級金額門檻(元)")]
		public string MinSpending { get; set; }

		[Display(Name = "折扣")]
		public int? Discount { get; set; }

		[Display(Name = "描述")]
		public string Description { get; set; }

		//[Display(Name = "享有福利")]
		//public string PrivilegeName { get; set; }




		//中介表格?
	}
}
