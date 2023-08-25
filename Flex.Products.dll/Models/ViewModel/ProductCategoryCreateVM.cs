using Flex.Products.dll.Models.Dtos;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex.Products.dll.Models.ViewModel
{
	public class ProductCategoryCreateVM
	{
		
		public int ProductCategoryId { get; set; }

		[Display(Name = "銷售分類")]
		[Required(ErrorMessage = "{0}必填")]
		[Range(1, 999, ErrorMessage = "{0}必填")]
		public int fk_SalesCategoryId { get; set; }

		[Display(Name = "商品分類名稱")]
		[Required(ErrorMessage ="{0}必填")]
		public string ProductCategoryName { get; set;}

		[Display(Name = "商品分類路徑")]
		public string CategoryPath { get; set; }
		
	}
}
