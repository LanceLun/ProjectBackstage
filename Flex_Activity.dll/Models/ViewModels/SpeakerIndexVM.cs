using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex_Activity.dll.Models.ViewModels
{
	public class SpeakerIndexVM
	{
		[Display(Name = "講師編號")]
		public int SpeakerId { get; set; }

        [Display(Name = "講師姓名")]
        public string SpeakerName { get; set; }

        [Display(Name = "專長領域")]
        public string FieldName { get; set; }
	}
}
