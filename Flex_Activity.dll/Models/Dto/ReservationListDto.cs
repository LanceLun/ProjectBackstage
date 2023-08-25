using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex_Activity.dll.Models.Dto
{
	public class ReservationListDto
	{
		public int MemberId { get; set; }
		public string Name { get; set; }
		public string Mobile { get; set; }
		public DateTime ReservationStartTime { get; set; }
		public string BranchName { get; set; }
		public string ReservationStatusDescription { get; set; }

		public int ReservationId { get; set; }

		//public int fk_ReservationSpeakerId { get; set; }
		public int SpeakerId { get; set; }
	}
}
