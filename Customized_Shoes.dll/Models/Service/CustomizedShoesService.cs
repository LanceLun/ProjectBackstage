using Customized_Shoes.dll.Models.Dtos;
using Customized_Shoes.dll.Models.Exts;
using Customized_Shoes.dll.Models.Interface;
using EFModels.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Customized_Shoes.dll.Models.Service
{
	public class CustomizedShoesService
	{
		private IShoesRepository _repo;
		private AppDbContext _db;

		public CustomizedShoesService(IShoesRepository repo)
		{ 
			this._repo = repo;
			_db = new AppDbContext();
		}

		public IEnumerable<CustomizedShoesDto> IndexshoesPo(ShoesSearchCriteria criteria) 
		{
			var shoesproducts = _repo.Search(criteria);
			return shoesproducts;		
		}

		public Result EditShoesStatus(List<CustomizedShoesDto> dto) 
		{
			_repo.EditShoesStatus(dto);

			return Result.Success();
		}

		public Result CreateShoes(CustomizedShoesDto dto) 
		{
			if (ExitShoesName(dto.ShoesName)) 
			{
				return Result.Fail($"鞋種編號 {dto.ShoesName} 已存在，請新增新的鞋種編碼");
			}
			dto.DataCreateTime = DateTime.Now;
			dto.DataEditTime = DateTime.Now;

			_repo.CreateShoes(dto);

			return Result.Success();
		}

		public CustomizedShoesDto GetById(int id) 
		{
			return _repo.GetById(id);		
		}

		public List<ShoesImgDto> GetImgById(int ShoesId)
		{
			return _repo.GetImgById(ShoesId);
		}


		public Result EditShoes(CustomizedShoesDto dto) 
		{ 	
			
			_repo.EditShoes(dto);
			
			return Result.Success();
		}

		public bool ExitShoesName(string ShoesName)
		{
			return _db.CustomizedShoesPoes.Any(p => p.ShoesName == ShoesName);
		}

		public Result SaveEditImg(List<ShoesImgDto> dto)
		{
			_repo.SaveEditShoesImg(dto);
			return Result.Success();
		}

	}
}
