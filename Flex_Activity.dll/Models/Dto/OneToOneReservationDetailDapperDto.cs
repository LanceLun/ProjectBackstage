using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Flex_Activity.dll.Models.Dto
{
	public class OneToOneReservationDetailDapperDto
	{

	
		public int MemberId { get; set; }

	
		public string Name { get; set; }

	
		public string Mobile { get; set; }


		public DateTime ReservationStartTime { get; set; }


		public DateTime ReservationEndTime { get; set; }


		public string BranchName { get; set; }


		public DateTime ReservationCreatedDate { get; set; }

	
		public string ReservationStatusDescription { get; set; }


		public int fk_ReservationSpeakerId { get; set; }

		public int fk_ReservationStatusId { get; set; }
	}
}
