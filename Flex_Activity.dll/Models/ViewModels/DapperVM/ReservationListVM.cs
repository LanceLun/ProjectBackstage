using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex_Activity.dll.Models.ViewModels.DapperVM
{
	public class ReservationListVM
	{
		[Display(Name="會員編號")]
		public int MemberId { get; set; }

		[Display(Name="會員姓名")]
		public string Name { get; set; }

		[Display(Name="手機號碼")]
		public string Mobile { get; set; }

		[Display(Name="預約時間")]
		public DateTime ReservationStartTime { get; set; }

		[Display(Name="預約分店")]
		public string BranchName { get; set; }

		[Display(Name="狀態")]
		public string ReservationStatusDescription { get; set; }

		
		public int ReservationId { get; set; }

		//public int fk_ReservationSpeakerId { get; set; }

		public int SpeakerId { get; set; }
	}
}
