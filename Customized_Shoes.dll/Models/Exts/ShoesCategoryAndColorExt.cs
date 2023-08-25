using Customized_Shoes.dll.Models.ViewModels;
using EFModels.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Customized_Shoes.dll.Models.Exts
{
	public static class ShoesCategoryAndColorExt
	{
		public static ShoesCategoryVM ToVM(this ShoesCategory entity)
		{

			return new ShoesCategoryVM
			{
				ShoesCategoryId = entity.ShoesCategoryId,		
				ShoesCategoryName = entity.ShoesCategoryName,
			};
		}

		public static ShoesCategory ToEntity(this ShoesCategoryVM vm)
		{

			return new ShoesCategory
			{
				ShoesCategoryId = vm.ShoesCategoryId,
				ShoesCategoryName = vm.ShoesCategoryName,
			};
		}

		public static ShoesColorCategoryVM ToColorVM(this ShoesColorCategory entity)
		{

			return new ShoesColorCategoryVM
			{
				ShoesColorId = entity.ShoesColorId,
				ColorName = entity.ColorName,
				ColorCode = entity.ColorCode,
			};
		}
		public static ShoesColorCategory ToColorEntity(this ShoesColorCategoryVM vm)
		{

			return new ShoesColorCategory
			{
				ShoesColorId = vm.ShoesColorId,
				ColorName = vm.ColorName,
				ColorCode = vm.ColorCode,
			};
		}
	}
}
