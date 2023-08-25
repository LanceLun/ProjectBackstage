using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex.Products.dll.Models.Dtos
{
	public class ProductGroupsDto
	{
		public string ProductId { get; set; }
		public int ProductGroupId { get; set; }
		public int ColorId { get; set; }
		public int SizeId { get; set; }
		public int Qty { get; set; }
		public string ColorName { get; set; }
		public string SizeName { get; set; }

	}
}
