using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Flex.Products.dll.Models.ViewModel
{
	public class ProductCategoryIndexVM
	{
		[Display(Name = "商品分類編碼")]
		public int ProductCategoryId { get; set; }

		[Display(Name = "商品分類名稱")]
		public string ProductCategoryName { get; set; }

		[Display(Name = "銷售分類")]
		public string SalesCategoryName { get; set; }

		[Display(Name = "商品分類路徑")]
		public string CategoryPath
		{
			get
			{
				return $"{SalesCategoryName}/{ProductCategoryName}";
			}
		}
	}
}
