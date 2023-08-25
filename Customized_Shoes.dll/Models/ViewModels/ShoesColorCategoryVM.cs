using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Customized_Shoes.dll.Models.ViewModels
{
	public class ShoesColorCategoryVM
	{
		public int ShoesColorId { get; set; }
		
		[Display(Name = "顏色名稱")]
		[Required(ErrorMessage = "{0}必填")]
		[StringLength(50)]
		public string ColorName { get; set; }

		[Display(Name = "顏色色碼")]
		[Required(ErrorMessage = "{0}必填")]
		[StringLength(100)]
		public string ColorCode { get; set; }
	}
}
