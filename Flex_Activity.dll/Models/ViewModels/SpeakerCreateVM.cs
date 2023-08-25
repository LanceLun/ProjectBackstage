using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex_Activity.dll.Models.ViewModels
{
    public class SpeakerCreateVM
    {
        [Display(Name ="講師編號")]
        public int SpeakerId { get; set; }

        [Display(Name ="講師姓名")]
        [Required]
        [StringLength(50)]
        public string SpeakerName { get; set; }

        [Display(Name = "連絡電話")]
        [StringLength(10, MinimumLength =10, ErrorMessage ="電話長度錯誤")]
		[Required]
		public string SpeakerPhone { get; set; }

        [Display(Name = "專長領域")]
		[Range(1, 999, ErrorMessage = "{0}必填")]
		public int fk_SpeakerFieldId { get; set; }

        [Display(Name = "講師照片")]
        [StringLength(300)]
        public string SpeakerImg { get; set; }

        [Display(Name = "駐點分店")]
		[Range(1, 999, ErrorMessage = "{0}必填")]
		public int? fk_SpeakerBranchId { get; set; }

        [Display(Name ="講師簡介")]
        [StringLength(500)]
        public string SpeakerDescription { get; set; }
    }
}
