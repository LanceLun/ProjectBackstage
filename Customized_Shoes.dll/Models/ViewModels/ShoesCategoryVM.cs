using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Customized_Shoes.dll.Models.ViewModels
{
	public class ShoesCategoryVM
	{
		public int ShoesCategoryId { get; set; }

		[Display(Name ="分類名稱")]
		[Required(ErrorMessage = "{0}必填")]
		[StringLength(254)]
		public string ShoesCategoryName { get; set; }
	}
}
