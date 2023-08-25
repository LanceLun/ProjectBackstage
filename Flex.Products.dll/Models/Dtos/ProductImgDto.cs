using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex.Products.dll.Models.Dtos
{
	public class ProductImgDto
	{
		public int ProductImgId { get; set; }
		public string fk_ProductId { get; set; }
		public string ImgPath { get; set; }
	}
}
