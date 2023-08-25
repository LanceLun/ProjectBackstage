using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex_Activity.dll.Models.ViewModels
{
	public class ActivityIndexVM
	{
		[Display(Name = "活動編號")]
		public int ActivityId { get; set; }

		[Display(Name = "活動名稱")]
		public string ActivityName { get; set; }

		[Display(Name = "活動類別")]
		public string ActivityCategoryName { get; set; }

		[Display(Name = "活動日期")]
		[DisplayFormat(DataFormatString = "{0:yyyy-MM-dd HH:mm}", ApplyFormatInEditMode = false)]
		public DateTime ActivityDate { get; set; }

		[Display(Name = "活動講者")]
		public string SpeakerName { get; set; }

		[Display(Name = "活動地點")]
		public string ActivityPlace { get; set; }

		[Display(Name = "報名時間(起)")]
		[DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = false)]
		public DateTime ActivityBookStartTime { get; set; }

		[Display(Name = "報名時間(迄)")]
		[DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode = false)]
		public DateTime ActivityBookEndTime { get; set; }

		[Display(Name = "狀態")]
		public string ActivityStatusDescription { get; set; }
	}
}
