using EFModels.EFModels;
using Flex_Activity.dll.Infra;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace Flex_Activity.dll.Models.ViewModels
{
	public class ActivityCreateVM
	{
		[Display(Name = "活動編號")]
		public int ActivityId { get; set; }

		[Display(Name = "活動名稱")]
		[Required]
		[StringLength(50)]
		public string ActivityName { get; set; }

		[Display(Name = "活動類別")]
		[Required]
		[Range(1, 999, ErrorMessage = "{0}必填")]
		public int fk_ActivityCategoryId { get; set; }



		[Display(Name = "活動日期")]
		[Required]
		public DateTime ActivityDate { get; set; }

		[Display(Name = "活動講者")]
		[Required]
		[Range(1, 999, ErrorMessage = "{0}必填")]
		public int fk_SpeakerId { get; set; }


		[Display(Name = "活動地點")]
		[Required]
		[StringLength(100)]
		public string ActivityPlace { get; set; }

		[Display(Name = "報名時間(起)")]
		[Required]
		public DateTime ActivityBookStartTime { get; set; }

		[Display(Name = "報名時間(迄)")]
		[Required]
		public DateTime ActivityBookEndTime { get; set; }


		[Display(Name = "活動照片")]

		[FileExtensions(Extensions = ".jpg,.jpeg,.png,.tif", ErrorMessage = "只接受圖片檔案")]
		[StringLength(300)]
		public string ActivityImage { get; set; }


		[Display(Name = "參加年齡")]
		[Required]
		[Range(1, 130, ErrorMessage = "{0}輸入錯誤")]
		//public byte ActivityAge { get; set; }
		public int ActivityAge { get; set; }

		[Display(Name = "活動特價")]
		[Required]
		public int ActivitySalePrice { get; set; }

		[Display(Name = "活動原價")]
		[Required]
		public int ActivityOriginalPrice { get; set; }

		[Display(Name = "活動描述")]
		[Required]
		[StringLength(300)]
		public string ActivityDescription { get; set; }


		public int fk_ActivityStatusId { get; set; }
		public ActivityCreateVM()
		{
			fk_ActivityStatusId = 1;
		}


	}
}
