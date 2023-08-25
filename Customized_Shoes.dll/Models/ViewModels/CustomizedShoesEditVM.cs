using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Customized_Shoes.dll.Models.ViewModels
{
	public class CustomizedShoesEditVM
	{
		[Display(Name = "商品編號")]
		public int ShoesProductId { get; set; }

		[Display(Name = "鞋種編號")]
		[Required(ErrorMessage = "{0}必填")]
		public string ShoesName { get; set; }

		[Display(Name = "商品描述")]
		[Required(ErrorMessage = "{0}必填")]
		[StringLength(254)]
		public string ShoesDescription { get; set; }

		[Display(Name = "產地")]
		[Required(ErrorMessage = "{0}必填")]
		[StringLength(50)]
		[MaxLength(50, ErrorMessage = "長度限制為{1}個字")]
		public string ShoesOrigin { get; set; }

		[Display(Name = "商品售價")]
		[Range(0, 99999, ErrorMessage = "價格須介於{1}至{2}之間")]
		public int ShoesUnitPrice { get; set; }

		//public DateTime? StartTime { get; set; }

		//public DateTime? EndTime { get; set; }

		[Display(Name = "下架")]
		public bool Status { get; set; }

		[Display(Name = "商品分類")]
		[Required(ErrorMessage = "{0}必填")]
		[Range(1, 999, ErrorMessage = "{0}必填")]
		public int? fk_ShoesCategoryId { get; set; }

		[Display(Name = "主顏色分類")]
		[Required(ErrorMessage = "{0}必填")]
		[Range(1, 999, ErrorMessage = "{0}必填")]
		public int? fk_ShoesColorId { get; set; }

		[Display(Name = "創建時間")]
		public string CreateTime { get; set; }

		[Display(Name = "上次編輯時間")]
		public string EditTime { get; set; }
	}
}
