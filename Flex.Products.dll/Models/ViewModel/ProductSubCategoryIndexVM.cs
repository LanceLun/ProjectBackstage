using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex.Products.dll.Models.ViewModel
{
	public class ProductSubCategoryIndexVM
	{
		[Display(Name = "商品子分類編碼")]
		public int ProductSubCategoryId { get; set; }

		[Display(Name = "銷售分類名稱")]
		public string SalesCategoryName { get; set; }

		[Display(Name = "商品分類名稱")]
		public string ProductCategoryName { get; set; }

		[Display(Name = "商品子分類名稱")]
		public string ProductSubCategoryName { get; set; }

		[Display(Name = "商品分類路徑")]
		public string SubCategoryPath 
		{ 
			get 
			{
				return $"{SalesCategoryName}/{ProductCategoryName}/{ProductSubCategoryName}";
			} 
		}
	}
}
