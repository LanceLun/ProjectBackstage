using Flex.Products.dll.Models.Dtos;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex.Products.dll.Models.ViewModel
{
	public class ProductEditImgVM
	{
		public string ProductId { get; set; }

		[Display(Name ="商品照片")]
		public List<ProductImgDto> ProductImgs { get; set; }
        public ProductEditImgVM()
        {
			ProductImgs = new List<ProductImgDto>();

		}

		public string ProductIds { get; set; }
	}
}
