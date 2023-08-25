using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Customized_Shoes.dll.Models.ViewModels
{
	public class Customized_materialsVM
	{
		public int Shoesmaterial_Id { get; set; }

		[Display(Name ="材質名稱")]
		[Required]
		[StringLength(50)]
		public string Material_Name { get; set; }

	}
}
