using Customized_Shoes.dll.Models.Dtos;
using Customized_Shoes.dll.Models.ViewModels;
using EFModels.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Customized_Shoes.dll.Models.Exts
{
	public static class CustomizedShoesExts
	{
		public static CustomizedShoesIndexVM ToIndexVM(this CustomizedShoesDto dto) 
		{
			return new CustomizedShoesIndexVM
			{
				ShoesProductId = dto.ShoesProductId,
				ShoesName = dto.ShoesName,
				ShoesOrigin = dto.ShoesOrigin,
				ShoesDescription = dto.ShoesDescription,
				ShoesUnitPrice = dto.ShoesUnitPrice,
				Status = dto.Status,
				ShoesCategory = dto.ShoesCategory,
				ShoesColoeCategory = dto.ShoesColorCategory,
			};
					
		}

		public static CustomizedShoesDto ToIndexDto(this CustomizedShoesPo entity) 
		{
			return new CustomizedShoesDto
			{
				ShoesProductId = entity.ShoesProductId,
				ShoesName = entity.ShoesName,
				ShoesOrigin = entity.ShoesOrigin,
				ShoesDescription = entity.ShoesDescription,
				ShoesUnitPrice = entity.ShoesUnitPrice,
				Status = entity.Status,
				ShoesCategory = entity.ShoesCategory.ShoesCategoryName,
				ShoesColorCategory = entity.ShoesColorCategory.ColorName,

			};				
		}

		public static CustomizedShoesDto ToSaveShoesStatusDto(this CustomizedShoesIdAndStatusVM vm)
		{
			return new CustomizedShoesDto {
				ShoesProductId = vm.ShoesProductId,
				Status = vm.Status,
			};

		}

		public static CustomizedShoesDto ToCreateDto(this CustomizedShoesCreateVM vm) 
		{
			return new CustomizedShoesDto
			{
				ShoesProductId = vm.ShoesProductId,
				ShoesName = vm.ShoesName,
				ShoesOrigin = vm.ShoesOrigin,
				ShoesDescription = vm.ShoesDescription,
				ShoesUnitPrice = vm.ShoesUnitPrice,
				Status = vm.Status,
				fk_ShoesCategoryId = vm.fk_ShoesCategoryId,
				fk_ShoesColorId = vm.fk_ShoesColorId,
				DataCreateTime = DateTime.Now,
				DataEditTime = DateTime.Now,
				ImgPaths = vm.ImgPaths,
			};				
		}

		public static CustomizedShoesPo ToCreateEntity(this CustomizedShoesDto dto) 
		{
			return new CustomizedShoesPo
			{
				ShoesProductId = dto.ShoesProductId,
				ShoesName = dto.ShoesName,
				ShoesOrigin = dto.ShoesOrigin,
				ShoesDescription = dto.ShoesDescription,
				ShoesUnitPrice= dto.ShoesUnitPrice,
				Status = dto.Status,
				fk_ShoesCategoryId = dto.fk_ShoesCategoryId,
				fk_ShoesColorId = dto.fk_ShoesColorId,
				DataCreateTime = dto.DataCreateTime,
				DataEditTime = dto.DataEditTime,
				ShoesPictures = dto.ImgPaths.Select(p => new ShoesPicture 
				{ 
					fk_ShoesPictureProduct_Id = dto.ShoesProductId,
					ShoesPictureUrl = p				
				}).ToList(),
			};
		}

		public static CustomizedShoesDto ToEditDto(this CustomizedShoesPo entity) 
		{
			return new CustomizedShoesDto
			{
				ShoesProductId= entity.ShoesProductId,
				ShoesName= entity.ShoesName,
				ShoesOrigin= entity.ShoesOrigin,
				ShoesDescription= entity.ShoesDescription,
				ShoesUnitPrice = entity.ShoesUnitPrice,
				Status = entity.Status,
				fk_ShoesCategoryId = entity.fk_ShoesCategoryId,
				fk_ShoesColorId = entity.fk_ShoesColorId,
				DataCreateTime = (DateTime)entity.DataCreateTime,
				DataEditTime = (DateTime)entity.DataEditTime,				
			};				
		}

		public static CustomizedShoesEditVM ToEditVM(this CustomizedShoesDto dto) 
		{
			return new CustomizedShoesEditVM
			{
				ShoesProductId = dto.ShoesProductId,
				ShoesName = dto.ShoesName,
				ShoesOrigin = dto.ShoesOrigin,
				ShoesDescription = dto.ShoesDescription,
				ShoesUnitPrice = dto.ShoesUnitPrice,
				Status = dto.Status,
				fk_ShoesCategoryId = dto.fk_ShoesCategoryId,
				fk_ShoesColorId = dto.fk_ShoesColorId,
				CreateTime = dto.DataCreateTime.ToString("G"),
				EditTime = dto.DataEditTime.ToString("G"),
			};
		}

		public static CustomizedShoesDto VMToEditDto(this CustomizedShoesEditVM vm) 
		{
			return new CustomizedShoesDto
			{
				ShoesProductId = vm.ShoesProductId,
				ShoesName = vm.ShoesName,
				ShoesOrigin = vm.ShoesOrigin,
				ShoesDescription = vm.ShoesDescription,
				ShoesUnitPrice = vm.ShoesUnitPrice,
				Status = vm.Status,
				fk_ShoesCategoryId = vm.fk_ShoesCategoryId,
				fk_ShoesColorId = vm.fk_ShoesColorId,
				DataCreateTime = DateTime.Parse(vm.CreateTime),
			};
		}

		public static CustomizedShoesPo DtoToEditEntity(this CustomizedShoesDto dto) 
		{
			return new CustomizedShoesPo
			{
				ShoesProductId = dto.ShoesProductId,
				ShoesName = dto.ShoesName,
				ShoesOrigin = dto.ShoesOrigin,
				ShoesDescription = dto.ShoesDescription,
				ShoesUnitPrice = dto.ShoesUnitPrice,
				Status = dto.Status,
				fk_ShoesCategoryId = dto.fk_ShoesCategoryId,
				fk_ShoesColorId = dto.fk_ShoesColorId,
				DataCreateTime = dto.DataCreateTime,
				DataEditTime = dto.DataEditTime,
			};
		}

		public static List<ShoesImgDto> ToEditImgDto(this List<ShoesPicture> entity)
		{
			var result = entity.Select(p => new ShoesImgDto
			{
				ShoesImgId = p.ShoesPicture_Id,
				fk_ShoesProductId = p.fk_ShoesPictureProduct_Id,
				ShoesPictureUrl = p.ShoesPictureUrl
			}).ToList();
			return result;
		}

		public static ShoesEditImgVM ToEditImgVM(this List<ShoesImgDto> dto, int ShoesId)
		{
			return new ShoesEditImgVM
			{
				ShoesProductId = ShoesId,
				ShoesPictureUrl =dto,
			};
		}

		public static List<ShoesImgDto> VMToEditImgDto(this ShoesEditImgVM vm)
		{
			var result = new List<ShoesImgDto>();

			foreach (var p in vm.ShoesPictureUrl)
			{
				result.Add(new ShoesImgDto
				{
					ShoesImgId = p.ShoesImgId,
					fk_ShoesProductId = p.fk_ShoesProductId,
					ShoesPictureUrl = p.ShoesPictureUrl
				});
			}
			return result;
		}

		public static ShoesPicture DtoToEditImgEntity(this ShoesImgDto dto)
		{
			return new ShoesPicture
			{
				ShoesPicture_Id = dto.ShoesImgId,
				fk_ShoesPictureProduct_Id = dto.fk_ShoesProductId,
				ShoesPictureUrl = dto.ShoesPictureUrl
			};
		}
	}
}
