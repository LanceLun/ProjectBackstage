using DocumentFormat.OpenXml.Wordprocessing;
using Flex.Products.dll.Models.Dtos;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex.Products.dll.Models.ViewModel
{
	public class ProductIndexForExcelVM
	{
		[Display(Name = "商品編碼")]
		public string ProductId { get; set; }

		[Display(Name = "商品名稱")]
		public string ProductName { get; set; }

		public string ProductIds { get; set; }

	}
}
