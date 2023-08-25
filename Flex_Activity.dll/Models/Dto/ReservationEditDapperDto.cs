using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Flex_Activity.dll.Models.Dto
{
	public class ReservationEditDapperDto
	{
		[Display(Name = "預約時間(起)")]
		public DateTime ReservationStartTime { get; set; }

		//[Display(Name = "預約時間(迄)")]
		//public DateTime ReservationEndTime { get; set; }

		public int fk_ReservationSpeakerId { get; set; }

		public int MemberId { get; set; }
	}
}
