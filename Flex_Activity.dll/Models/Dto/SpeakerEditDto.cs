using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Flex_Activity.dll.Models.Dto
{
	public class SpeakerEditDto
	{
		[Display(Name = "講師編號")]
		public int SpeakerId { get; set; }

		[Display(Name = "講師姓名")]
		public string SpeakerName { get; set; }

		[Display(Name = "連絡電話")]
		public string SpeakerPhone { get; set; }

		[Display(Name = "專長領域")]
		public int fk_SpeakerFieldId { get; set; }

		[Display(Name = "講師照片")]
		public string SpeakerImg { get; set; }

		[Display(Name = "駐點分店")]
		public int? fk_SpeakerBranchId { get; set; }

		[Display(Name = "講師簡介")]
		public string SpeakerDescription { get; set; }
	}
}
