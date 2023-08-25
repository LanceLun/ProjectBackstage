using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Flex.Products.dll.Models.ViewModel
{
	public class ProductSubCategoryCreateVM
	{
		[Display(Name = "商品子分類編碼")]
		public int ProductSubCategoryId { get; set; }

		[Display(Name = "商品分類")]
		[Required(ErrorMessage ="{0}必填")]
		[Range(1, 999, ErrorMessage = "{0}必填")]
		public int fk_ProductCategoryId { get; set; }

		[Display(Name = "商品子分類名稱")]
		[Required(ErrorMessage = "{0}必填")]
		public string ProductSubCategoryName { get; set; }

		[Display(Name = "商品分類路徑")]
		public string SubCategoryPath { get; set; }
	}
}
