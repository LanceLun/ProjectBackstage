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
	public class ShoesCategoryRepository
	{
		public List<ShoesCategoryDto> GetShoesCategory()
		{
			return new AppDbContext()
				.ShoesCategories
				.OrderBy(sc => sc.ShoesCategoryId)
				.ToList()
				.Select(sc => sc.ToDto())
				.ToList();
		}
	}
}
