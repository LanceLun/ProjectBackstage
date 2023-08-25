using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex.Products.dll.Models.Dtos
{
	public class ProductExcelImportDto
	{
		public string ProductId { get; set; }

		public string ProductName { get; set; }

		public string ProductDescription { get; set; }

		public string ProductMaterial { get; set; }

		public string ProductOrigin { get; set; }

		public int fk_ProductSubCategoryId { get; set; }

		public int? UnitPrice { get; set; }

		public int SalesPrice { get; set; }

		public bool Status { get; set; }
		
		public bool LogOut { get; set; }

		public DateTime CreateTime { get; set; }

		public DateTime EditTime { get; set; }

		//public List<string> ImgPaths { get; set; }

		public List<ProductGroupsDto> ProductGroups { get; set; }
	}
}
