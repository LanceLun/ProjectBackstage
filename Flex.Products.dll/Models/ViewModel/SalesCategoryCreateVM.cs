using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Threading.Tasks;

namespace Flex.Products.dll.Models.ViewModel
{
	public class SalesCategoryCreateVM
	{
		[Display(Name = "分類編碼")]
		public int SalesCategoryId { get; set; }

		[Display(Name ="分類名稱")]
		[Required(ErrorMessage ="{0}必填")]
		public string SalesCategoryName { get; set; }
	}
}
