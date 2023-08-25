using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Flex.Products.dll.Models.ViewModel
{
	public class SalesCategoryIndexVM
	{
		[Display(Name = "分類編碼")]
		public int SalesCategoryId { get; set; }

		[Display(Name = "分類名稱")]
		public string SalesCategoryName { get; set; }
	}
}
