using Customized_Shoes.dll.Models.Dtos;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Customized_Shoes.dll.Models.ViewModels
{
	public class ShoesEditImgVM
	{
		public int ShoesProductId { get; set; }

		[Display(Name = "商品照片")]
		public List<ShoesImgDto> ShoesPictureUrl { get; set; }

		public ShoesEditImgVM() 
		{ 
			ShoesPictureUrl = new List<ShoesImgDto>();
		}

	}
}
