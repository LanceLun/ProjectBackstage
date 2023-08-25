using Customized_Shoes.dll.Models.Dtos;
using EFModels.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Customized_Shoes.dll.Models.Exts
{
	public static class CategoryExts
	{
		public static ShoesCategoryDto ToDto(this ShoesCategory entity)
		{
			return new ShoesCategoryDto
			{
				ShoesCategoryId = entity.ShoesCategoryId,
				ShoesCategoryName = entity.ShoesCategoryName,
			};
		}

		public static ShoesColorCategoryDto ToDto(this ShoesColorCategory entity)
		{
			return new ShoesColorCategoryDto
			{
				ShoesColorId = entity.ShoesColorId,
				ColorName = entity.ColorName,
				ColorCode = entity.ColorCode,
			};
		}
	}
}
