using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Customized_Shoes.dll.Models.Dtos
{
	public class ShoesColorCategoryDto
	{
		public int ShoesColorId { get; set; }

		public string ColorName { get; set; }

		public string ColorCode { get; set; }
	}
}
