using EFModels.EFModels;
using Flex.Products.dll.Models.Dtos;
using Flex.Products.dll.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Text;
using System.Threading.Tasks;

namespace Flex.Products.dll.Models.Infra.Exts
{
	public static class ProductExts
	{

		public static ProductIndexVM ToIndexVM(this ProductDto dto)
		{
			return new ProductIndexVM
			{
				ProductId = dto.ProductId,
				ProductName = dto.ProductName,
				SubCategoryPath = dto.ProductSubCategory,//dto.ProductSubCategory.SubCategoryPath,
				SalesPrice = dto.SalesPrice,
				//StartTime = dto.StartTime,
				//EndTime = dto.EndTime,
				Status = dto.Status,
				Tag = dto.Tag,
				ProductGroupList = dto.ProductGroups
			};
		}

		public static ProductDto ToIndexDto(this Product entity)
		{
			return new ProductDto
			{
				ProductId = entity.ProductId,
				ProductName = entity.ProductName,
				ProductDescription = entity.ProductDescription,
				ProductMaterial = entity.ProductMaterial,
				ProductOrigin = entity.ProductOrigin,
				UnitPrice = entity.UnitPrice,
				SalesPrice = entity.SalesPrice,
				//StartTime = entity.StartTime,
				//EndTime = entity.EndTime,
				Status = entity.Status,
				LogOut = entity.LogOut,
				Tag = entity.Tag,
				//fk_ProductSubCategoryId = entity.fk_ProductSubCategoryId,
				ProductSubCategory = $"{entity.ProductSubCategory.ProductCategory.SalesCategory.SalesCategoryName}/{entity.ProductSubCategory.ProductCategory.ProductCategoryName}/{entity.ProductSubCategory.ProductSubCategoryName}",
				ProductGroups = entity.ProductGroups.Select(x => new ProductGroupsDto
				{
					ColorId = x.ColorCategory.ColorId,
					ColorName = x.ColorCategory.ColorName,
					SizeId = x.SizeCategory.SizeId,
					SizeName = x.SizeCategory.SizeName,
					Qty = x.Qty
				}).ToList()
			};
		}

		public static ProductDto ToSaveChangeStatusDto(this ProductIdAndStatusVM vm)
		{
			return new ProductDto
			{
				ProductId = vm.ProductId,
				Status = vm.Status,
			};
		}

		public static ProductDto ToCreateDto(this ProductCreateVM vm)
		{
			return new ProductDto
			{
				ProductId = vm.ProductId,
				ProductName = vm.ProductName,
				ProductDescription = vm.ProductDescription,
				ProductMaterial = vm.ProductMaterial,
				ProductOrigin = vm.ProductOrigin,
				UnitPrice = vm.UnitPrice,
				SalesPrice = vm.SalesPrice,
				//StartTime = vm.StartTime,
				//EndTime = vm.EndTime,
				Status = vm.Status,
				Tag = vm.Tag,
				fk_ProductSubCategoryId = vm.fk_ProductSubCategoryId,
				ImgPaths = vm.ImgPaths,
				ProductGroups = vm.ProductGroups,
				CreateTime = DateTime.Now,
				EditTime = DateTime.Now,
			};
		}

		public static Product ToCreateEntity(this ProductDto dto)
		{
			return new Product
			{
				ProductId = dto.ProductId,
				ProductName = dto.ProductName,
				ProductDescription = dto.ProductDescription,
				ProductMaterial = dto.ProductMaterial,
				ProductOrigin = dto.ProductOrigin,
				UnitPrice = dto.UnitPrice,
				SalesPrice = dto.SalesPrice,
				//StartTime = dto.StartTime,
				//EndTime = dto.EndTime,
				Status = dto.Status,
				LogOut = false,
				Tag = dto.Tag,
				fk_ProductSubCategoryId = dto.fk_ProductSubCategoryId,
				CreateTime = dto.CreateTime,
				EditTime = dto.EditTime,
				ProductImgs = dto.ImgPaths.Select(p => new ProductImg
				{
					fk_ProductId = dto.ProductId,
					ImgPath = p
				}).ToList(),
				ProductGroups = dto.ProductGroups.Select(p => new ProductGroup
				{
					fk_ProductId = dto.ProductId,
					fk_ColorId = p.ColorId,
					fk_SizeId = p.SizeId,
					Qty = p.Qty
				}).ToList()
			};
		}

		public static ProductDto ToEditDto(this Product entity)
		{
			return new ProductDto
			{
				ProductId = entity.ProductId,
				ProductName = entity.ProductName,
				ProductDescription = entity.ProductDescription,
				ProductMaterial = entity.ProductMaterial,
				ProductOrigin = entity.ProductOrigin,
				UnitPrice = entity.UnitPrice,
				SalesPrice = entity.SalesPrice,
				Status = entity.Status,
				Tag = entity.Tag,
				fk_ProductSubCategoryId = entity.fk_ProductSubCategoryId,
				CreateTime = entity.CreateTime,
				EditTime = entity.EditTime,
				ProductGroups = entity.ProductGroups.Select(p => new ProductGroupsDto
				{
					ProductGroupId=p.ProductGroupId,
					ColorId = p.ColorCategory.ColorId,
					SizeId = p.SizeCategory.SizeId,
					Qty = p.Qty
				}).ToList()
			};
		}

		public static ProductEditVM ToEditVM(this ProductDto dto)
		{
			return new ProductEditVM
			{
				ProductId = dto.ProductId,
				ProductName = dto.ProductName,
				ProductDescription = dto.ProductDescription,
				ProductMaterial = dto.ProductMaterial,
				ProductOrigin = dto.ProductOrigin,
				UnitPrice = dto.UnitPrice,
				SalesPrice = dto.SalesPrice,
				Status = dto.Status,
				Tag = dto.Tag,
				fk_ProductSubCategoryId = dto.fk_ProductSubCategoryId,
				CreateTime = dto.CreateTime.ToString("G"),
				EditTime = dto.EditTime.ToString("G"),
				ProductGroups = dto.ProductGroups
			};
		}

		public static ProductDto VMToEditDto(this ProductEditVM vm)
		{
			return new ProductDto
			{
				ProductId = vm.ProductId,
				ProductName = vm.ProductName,
				ProductDescription = vm.ProductDescription,
				ProductMaterial = vm.ProductMaterial,
				ProductOrigin = vm.ProductOrigin,
				UnitPrice = vm.UnitPrice,
				SalesPrice = vm.SalesPrice,
				Status = vm.Status,
				Tag = vm.Tag,
				CreateTime = DateTime.Parse(vm.CreateTime),
				fk_ProductSubCategoryId = vm.fk_ProductSubCategoryId,
				ProductGroups = vm.ProductGroups
			};
		}

		public static Product DtoToEditEntity(this ProductDto dto)
		{
			return new Product
			{
				ProductId = dto.ProductId,
				ProductName = dto.ProductName,
				ProductDescription = dto.ProductDescription,
				ProductMaterial = dto.ProductMaterial,
				ProductOrigin = dto.ProductOrigin,
				UnitPrice = dto.UnitPrice,
				SalesPrice = dto.SalesPrice,
				Status = dto.Status,
				Tag = dto.Tag,
				fk_ProductSubCategoryId = dto.fk_ProductSubCategoryId,
				CreateTime=dto.CreateTime,
				EditTime=dto.EditTime,
				ProductGroups = dto.ProductGroups.Select(p => new ProductGroup
				{
					fk_ProductId = dto.ProductId,
					fk_ColorId = p.ColorId,
					fk_SizeId = p.SizeId,
					Qty = p.Qty,
				}).ToList()
			};
		}

		public static List<ProductImgDto> ToEditImgDto(this List<ProductImg> entity)
		{
			var result=entity.Select(p => new ProductImgDto
			{
				ProductImgId = p.ProductImgId,
				fk_ProductId=p.fk_ProductId,
				ImgPath = p.ImgPath
			}).ToList();
			return result;
		}

		public static ProductEditImgVM ToEditImgVM(this List<ProductImgDto> dto,string ProductId)
		{	
			return new ProductEditImgVM
			{
				ProductId = ProductId,
				ProductImgs= dto
			};
		}

		public static List<ProductImgDto> VMToEditImgDto(this ProductEditImgVM vm)
		{
			var result = new List<ProductImgDto>();

			foreach (var p in vm.ProductImgs)
			{
				result.Add(new ProductImgDto
				{
					ProductImgId = p.ProductImgId,
					fk_ProductId=vm.ProductId,
					ImgPath = p.ImgPath
				});
			}
			return result;
		}

		public static ProductImg DtoToEditImgEntity(this ProductImgDto dto)
		{
			return new ProductImg
			{
				ProductImgId = dto.ProductImgId,
				fk_ProductId = dto.fk_ProductId,
				ImgPath = dto.ImgPath
			};
		}

		public static ProductExcelReportVM ToExcelVM(this ProductExcelReportDto dto)
		{
			return new ProductExcelReportVM
			{
				ProductId = dto.ProductId,
				ProductName = dto.ProductName,
				ProductDescription = dto.ProductDescription,
				ProductMaterial = dto.ProductMaterial,
				ProductOrigin = dto.ProductOrigin,
				SalesCategoryName = dto.SalesCategoryName,
				ProductCategoryName = dto.ProductCategoryName,
				ProductSubCategoryName = dto.ProductSubCategoryName,
				UnitPrice = dto.UnitPrice,
				SalesPrice = dto.SalesPrice,
				ColorName = dto.ColorName,
				SizeName = dto.SizeName,
				Qty = dto.Qty,
				StatusText = dto.StatusText,
				Tag = dto.Tag,
				CreateTime = dto.CreateTime,
				EditTime = dto.EditTime,
			};
		}

		public static ProductExcelImportDto ToExcelDto(this ProductExcelImportVM vm)
		{
			return new ProductExcelImportDto
			{
				ProductId = vm.ProductId,
				ProductName = vm.ProductName,
				ProductDescription = vm.ProductDescription,
				ProductMaterial = vm.ProductMaterial,
				ProductOrigin = vm.ProductOrigin,
				fk_ProductSubCategoryId = vm.fk_ProductSubCategoryId,
				UnitPrice = vm.UnitPrice == 0 ? null : vm.UnitPrice,
				SalesPrice = vm.SalesPrice,
				Status = vm.Status,
				ProductGroups = vm.ProductGroups
			};
		}

		public static Product ToCreateEntity(this ProductExcelImportDto dto)
		{
			return new Product
			{
				ProductId = dto.ProductId,
				ProductName = dto.ProductName,
				ProductDescription = dto.ProductDescription,
				ProductMaterial = dto.ProductMaterial,
				ProductOrigin = dto.ProductOrigin,
				UnitPrice = dto.UnitPrice,
				SalesPrice = dto.SalesPrice,
				Status = dto.Status,
				LogOut = dto.LogOut,
				fk_ProductSubCategoryId = dto.fk_ProductSubCategoryId,
				CreateTime = dto.CreateTime,
				EditTime = dto.EditTime,
				//ProductImgs = dto.ImgPaths.Select(p => new ProductImg
				//{
				//	fk_ProductId = dto.ProductId,
				//	ImgPath = p
				//}).ToList(),
				ProductGroups = dto.ProductGroups.Select(p => new ProductGroup
				{
					fk_ProductId = dto.ProductId,
					fk_ColorId = p.ColorId,
					fk_SizeId = p.SizeId,
					Qty = p.Qty
				}).ToList()
			};
		}

		public static ProductIndexForExcelVM ToIndexForExcelVM(this ProductDto dto)
		{
			return new ProductIndexForExcelVM
			{
				ProductId = dto.ProductId,
				ProductName = dto.ProductName
			};
		}
	}
}
