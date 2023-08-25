using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex.Products.dll.Models.Dtos
{
	public class ProductCategoryDto
	{
		public int ProductCategoryId { get; set; }
		public string ProductCategoryName { get; set; }
		public int fk_SalesCategoryId { get; set; }
		public string SalesCategoryName { get; set; }
		public string CategoryPath { 
			get
			{
				return $"{SalesCategoryName}/{ProductCategoryName}";
			} set
			{
				
			}
		}
	}
}
