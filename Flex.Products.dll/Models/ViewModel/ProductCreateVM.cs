using Flex.Products.dll.Models.Dtos;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Flex.Products.dll.Models.ViewModel
{
	public class ProductCreateVM
	{
		[Display(Name = "商品編碼")]
		[Required(ErrorMessage = "{0}必填")]
		[RegularExpression(@"^[^\u4e00-\u9fa5]+$", ErrorMessage = "不能輸入中文")]
		[StringLength(254)]
		public string ProductId { get; set; }

		[Display(Name = "商品名稱")]
		[Required(ErrorMessage = "{0}必填")]
		[StringLength(254)]
		public string ProductName { get; set; }

		[Display(Name = "商品描述")]
		[Required(ErrorMessage = "{0}必填")]
		public string ProductDescription { get; set; }

		[Display(Name = "材質")]
		[StringLength(50)]
		[MaxLength(50, ErrorMessage = "長度限制為{1}個字")]
		public string ProductMaterial { get; set; }

		[Display(Name = "產地")]
		[Required(ErrorMessage = "{0}必填")]
		[StringLength(50)]
		[MaxLength(50, ErrorMessage = "長度限制為{1}個字")]
		public string ProductOrigin { get; set; }

		[Display(Name = "標籤")]
		[StringLength(100)]
		[MaxLength(100, ErrorMessage = "長度限制為{1}個字")]
		public string Tag { get; set; }

		[Display(Name = "定價")]
		[Range(0, 99999, ErrorMessage = "{0}須介於{1}至{2}之間")]
		[DisplayFormat(DataFormatString = "{0:#,#}", ApplyFormatInEditMode = false)]
		public int? UnitPrice { get; set; }

		[Display(Name = "售價")]
		[Required(ErrorMessage = "{0}必填")]
		[Range(0, 99999, ErrorMessage = "{0}須介於{1}至{2}之間")]
		[DisplayFormat(DataFormatString ="{0:#,#}",ApplyFormatInEditMode =false)]
		public int SalesPrice { get; set; }

		//[Display(Name = "上架時間")]
		//[Required(ErrorMessage = "{0}必填")]
		//[Column(TypeName = "datetime")]
		//public DateTime StartTime { get; set; }

		//[Display(Name = "下架時間")]
		//[Column(TypeName = "datetime")]
		//public DateTime? EndTime { get; set; }

		[Display(Name = "下架")]
		public bool Status { get; set; }	

		[Display(Name = "商品分類")]
		[Required(ErrorMessage = "{0}必填")]
		[Range(1, 999, ErrorMessage = "{0}必填")]
		public int fk_ProductSubCategoryId { get; set; }

		[Display(Name = "照片")]
		public List<string> ImgPaths { get; set; }

		[Display(Name = "規格")]
		public List<ProductGroupsDto> ProductGroups { get; set; }

		public ProductCreateVM()
		{
			ImgPaths = new List<string>();
			ProductGroups = new List<ProductGroupsDto>();
		}
	}
}
