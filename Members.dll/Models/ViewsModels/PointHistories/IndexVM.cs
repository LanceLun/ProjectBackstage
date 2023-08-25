using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Members.dll.Models.ViewsModels.PointHistories
{
	public class IndexVM
	{
		//會員編號 更動原因訂單編號 異動情形 異動時間 累計積分
		[Display(Name="會員編號")]
		public int? fk_MemberId { get; set; }

		public int? fk_OrderId { get; set; }
		//[Display(Name = "更動原因")]
		//抓訂單編號

		//[Display(Name = "異動情形")]
		//public bool GetOrDeduct { get; set; }

		[Display(Name = "異動數量")]
		public int UsageAmount { get; set; }

		[Display(Name = "異動時間")]
		public DateTime EffectiveDate { get; set; }


		public int PointHistoryId { get; set; }
		[Display(Name = "累計積分")]
		public int PointSubtotal { get; set; }


	}
}
