using EFModels.EFModels;
using Flex.Products.dll.Models.Dtos;
using Flex.Products.dll.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex.Products.dll.Exts
{
	public static class CategoryExts
	{
		public static SalesCategoryIndexVM ToIndexVM(this SalesCategoryDto dto)
		{
			return new SalesCategoryIndexVM
			{
				SalesCategoryId = dto.SalesCategoryId,
				SalesCategoryName = dto.SalesCategoryName,
			};
		}
		
		public static SalesCategoryDto ToCreateDto(this SalesCategoryCreateVM vm)
		{
			return new SalesCategoryDto
			{
				SalesCategoryId = vm.SalesCategoryId,
				SalesCategoryName = vm.SalesCategoryName,
			};
		}

		public static SalesCategoryEditVM ToEditVM(this SalesCategoryDto dto)
		{
			return new SalesCategoryEditVM
			{
				SalesCategoryId = dto.SalesCategoryId,
				SalesCategoryName = dto.SalesCategoryName,
			};
		}

		public static SalesCategoryDto ToEditDto(this SalesCategoryEditVM vm)
		{
			return new SalesCategoryDto
			{
				SalesCategoryId = vm.SalesCategoryId,
				SalesCategoryName = vm.SalesCategoryName,
			};
		}


		public static ProductSubCategoryDto ToDto(this ProductSubCategory entity)
		{
			return new ProductSubCategoryDto
			{
				ProductSubCategoryId = entity.ProductSubCategoryId,
				ProductSubCategoryName = entity.ProductSubCategoryName,
				fk_ProductCategoryId = entity.fk_ProductCategoryId,
				SubCategoryPath = entity.SubCategoryPath
			};
		}

		public static ColorDto ToDto(this ColorCategory entity)
		{
			return new ColorDto
			{
				ColorId = entity.ColorId,
				ColorName = entity.ColorName,
			};
		}

		public static SizeDto ToDto(this SizeCategory entity)
		{
			return new SizeDto
			{
				SizeId = entity.SizeId,
				SizeName = entity.SizeName,
			};
		}

		public static ProductCategoryIndexVM ToIndexVM(this ProductCategoryDto dto)
		{
			return new ProductCategoryIndexVM
			{
				ProductCategoryId = dto.ProductCategoryId,
				ProductCategoryName = dto.ProductCategoryName,
				SalesCategoryName=dto.SalesCategoryName
			};
		}

		public static ProductCategoryDto ToCreateDto(this ProductCategoryCreateVM vm)
		{
			return new ProductCategoryDto
			{
				ProductCategoryName = vm.ProductCategoryName,
				fk_SalesCategoryId = vm.fk_SalesCategoryId,
				CategoryPath = vm.CategoryPath,
			};
		}

		public static ProductCategoryEditVM ToEditVM(this ProductCategoryDto dto)
		{
			return new ProductCategoryEditVM
			{
				ProductCategoryId = dto.ProductCategoryId,
				ProductCategoryName = dto.ProductCategoryName,
				fk_SalesCategoryId = dto.fk_SalesCategoryId,
			};
		}

		public static ProductCategoryDto ToDto(this ProductCategoryEditVM vm)
		{
			return new ProductCategoryDto
			{
				ProductCategoryId = vm.ProductCategoryId,
				ProductCategoryName = vm.ProductCategoryName,
				fk_SalesCategoryId = vm.fk_SalesCategoryId,
				CategoryPath = vm.CategoryPath,
			};
		}

		public static ProductSubCategoryIndexVM ToIndexVM(this ProductSubCategoryDto dto)
		{
			return new ProductSubCategoryIndexVM
			{
				ProductSubCategoryId = dto.ProductSubCategoryId,
				ProductCategoryName = dto.ProductCategoryName,
				SalesCategoryName = dto.SalesCategoryName,
				ProductSubCategoryName = dto.ProductSubCategoryName,
			};
		}

		public static ProductSubCategoryDto ToDto(this ProductSubCategoryCreateVM vm)
		{
			return new ProductSubCategoryDto
			{
				fk_ProductCategoryId = vm.fk_ProductCategoryId,
				ProductSubCategoryName = vm.ProductSubCategoryName,
				SubCategoryPath = vm.SubCategoryPath,
			};
		}

		public static ProductSubCategoryEditVM ToEditVM(this ProductSubCategoryDto dto)
		{
			return new ProductSubCategoryEditVM
			{
				ProductSubCategoryId = dto.ProductSubCategoryId,
				ProductSubCategoryName = dto.ProductSubCategoryName,
				fk_ProductCategoryId = dto.fk_ProductCategoryId,
			};
		}

		public static ProductSubCategoryDto ToDto(this ProductSubCategoryEditVM vm)
		{
			return new ProductSubCategoryDto
			{
				ProductSubCategoryId= vm.ProductSubCategoryId,
				ProductSubCategoryName = vm.ProductSubCategoryName,
				fk_ProductCategoryId= vm.fk_ProductCategoryId,
				SubCategoryPath= vm.SubCategoryPath,
			};
		}
	}
}
