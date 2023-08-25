using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex_Activity.dll.Models.ViewModels.DapperVM
{
	public class ReservationEditDapperVM
	{
		[Display(Name ="預約時間(起)")]
		[DataType(DataType.DateTime)]
		[DisplayFormat(DataFormatString = "{0:yyyy-MM-dd HH:mm}", ApplyFormatInEditMode = true)]
		public DateTime ReservationStartTime { get; set; }

		//[Display(Name ="預約時間(迄)")]
		//[DataType(DataType.DateTime)]
		//[DisplayFormat(DataFormatString = "{0:yyyy-MM-dd HH:mm}", ApplyFormatInEditMode = true)]
		//public DateTime ReservationEndTime { get; set;}

		public int fk_ReservationSpeakerId { get; set; }

		public int MemberId { get; set; }
	}
}
