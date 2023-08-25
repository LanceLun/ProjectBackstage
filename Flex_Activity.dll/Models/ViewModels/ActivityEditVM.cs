using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Flex_Activity.dll.Models.ViewModels
{
	public class ActivityEditVM
	{
		[Display(Name = "活動編號")]
		public int ActivityId { get; set; }

		[Display(Name = "活動名稱")]
		[Required]
		[StringLength(50)]
		public string ActivityName { get; set; }

		[Display(Name = "活動類別")]
		[Range(1, 999, ErrorMessage = "{0}必填")]
		public int fk_ActivityCategoryId { get; set; }


		[Display(Name = "活動日期")]
		[DataType(DataType.DateTime)]
		[DisplayFormat(DataFormatString = "{0:yyyy-MM-dd HH:mm}", ApplyFormatInEditMode = true)]
		public DateTime ActivityDate { get; set; }

		[Display(Name = "活動地點")]
		[Required]
		[StringLength(100)]
		public string ActivityPlace { get; set; }

		[Display(Name = "報名時間(起)")]
		public DateTime ActivityBookStartTime { get; set; }

		[Display(Name = "報名時間(迄)")]
		public DateTime ActivityBookEndTime { get; set; }

		[Display(Name = "活動講者")]
		[Range(1, 999, ErrorMessage = "{0}必填")]
		public int fk_SpeakerId { get; set; }

		[Display(Name = "課程圖片")]
		[Required]
		//[fileextensions(extensions = ".jpg,.jpeg,.png,.tif", errormessage = "只接受圖片檔案")]
		[StringLength(300)]
		public string ActivityImage { get; set; }


		[Display(Name = "參加年齡")]
		//public byte ActivityAge { get; set; }
		public int ActivityAge { get; set; }

		[Display(Name = "活動特價")]
		public int ActivitySalePrice { get; set; }

		[Display(Name = "活動原價")]
		public int ActivityOriginalPrice { get; set; }

		[Display(Name = "活動描述")]
		[StringLength(300)]
		public string ActivityDescription { get; set; }


		public int fk_ActivityStatusId { get; set; }
		public ActivityEditVM()
		{
			fk_ActivityStatusId = 1;
		}
	}
}
