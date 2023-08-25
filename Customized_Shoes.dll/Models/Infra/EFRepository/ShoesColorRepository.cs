using Customized_Shoes.dll.Models.Dtos;
using Customized_Shoes.dll.Models.Exts;
using EFModels.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Customized_Shoes.dll.Models.Infra.EFRepository
{
	public class ShoesColorRepository
	{
		public List<ShoesColorCategoryDto> GetShoesColorCategory()
		{
			return new AppDbContext()
				.ShoesColorCategories
				.OrderBy(c => c.ShoesColorId)
				.ToList()
				.Select(c => c.ToDto())
				.ToList();
		}
	}
}
