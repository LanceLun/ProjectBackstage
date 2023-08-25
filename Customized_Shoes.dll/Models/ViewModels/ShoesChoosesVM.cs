using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Customized_Shoes.dll.Models.ViewModels
{
	public class ShoesChoosesVM
	{
		public int OptionId { get; set; }

		[Display(Name ="可選客製化名稱")]
		[Required(ErrorMessage = "{0}必填")]
		[StringLength(50)]
		public string OptinName { get; set; }
	}
}
