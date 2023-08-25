using Customized_Shoes.dll.Models.Dtos;
using Customized_Shoes.dll.Models.Exts;
using Customized_Shoes.dll.Models.Interface;
using EFModels.EFModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Customized_Shoes.dll.Models.Infra.EFRepository
{
	public class CustomizedShoesEFRepository : IShoesRepository
	{
		private AppDbContext _db;

		public CustomizedShoesEFRepository()
		{ 		
			_db = new AppDbContext();
		}

		public void CreateShoes(CustomizedShoesDto dto)
		{
			var shoes = dto.ToCreateEntity();
			_db.CustomizedShoesPoes.Add(shoes);

			_db.SaveChanges();
		}

		public IEnumerable<CustomizedShoesDto> Search(ShoesSearchCriteria criteria)
		{
			criteria = criteria ?? new ShoesSearchCriteria();

			var query = _db.CustomizedShoesPoes.Include(p => p.ShoesCategory).Include(p => p.ShoesColorCategory);

			#region 搜尋條件
			if (criteria.Name != null)
			{
				query = query.Where(p => p.ShoesName.Contains(criteria.Name));
			}
			if (criteria.ShoesCategoryId != null && criteria.ShoesCategoryId.Value > 0)
			{
				query = query.Where(p => p.fk_ShoesCategoryId == criteria.ShoesCategoryId);
			}
			if (criteria.Status != null && criteria.Status != "請選擇狀態")
			{
				if (criteria.Status == "上架中")
				{
					query = query.Where(p => p.Status == false);
				}
				if (criteria.Status == "已下架")
				{
					query = query.Where(p => p.Status == true);
				}
			}
			#endregion

			var shoesproducts = query.OrderByDescending(p =>p.DataCreateTime).ToList().Select(p =>p.ToIndexDto()).ToList();

			return shoesproducts;

		}

		public void EditShoes(CustomizedShoesDto dto)
		{
			var shoesproducts = dto.DtoToEditEntity();
			shoesproducts.DataEditTime = DateTime.Now;

			_db.Entry(shoesproducts).State = EntityState.Modified;
			
			_db.SaveChanges();
		}

		public void EditShoesStatus(IEnumerable<CustomizedShoesDto> dto)
		{
			foreach (var item in dto) 
			{
				var shoesproducts = _db.CustomizedShoesPoes.FirstOrDefault(p => p.ShoesProductId == item.ShoesProductId);
				if (shoesproducts == null) return;

				shoesproducts.Status = item.Status;
				shoesproducts.DataEditTime = DateTime.Now;

				_db.SaveChanges();
			}
		}

		public CustomizedShoesDto GetById(int ShoesId)
		{
			var shoesproducts = _db.CustomizedShoesPoes.Include(p => p.ShoesCategory).Include(p => p.ShoesColorCategory).FirstOrDefault(p => p.ShoesProductId == ShoesId);
			
			return shoesproducts.ToEditDto();
		}

		public void SaveEditShoesImg(List<ShoesImgDto> dto)
		{
			if (dto == null || dto.Count == 0) return;
			var productId = dto[0].fk_ShoesProductId;
			var dbImgs = _db.ShoesPictures.Where(i => i.fk_ShoesPictureProduct_Id == productId).ToList();

			foreach (var img in dbImgs)
			{
				if (!dto.Any(i => i.ShoesImgId == img.ShoesPicture_Id))
				{
					_db.ShoesPictures.Remove(img);
				}
			}

			foreach (var editImg in dto)
			{
				//var dbImg = _db.ProductImgs.FirstOrDefault(i => i.ProductImgId == editImg.ProductImgId);
				if (editImg.ShoesImgId == 0)
				{
					_db.ShoesPictures.Add(editImg.DtoToEditImgEntity());
				}
			}
			_db.SaveChanges();
		}

		public List<ShoesImgDto> GetImgById(int ShoesId)
		{
			var product = _db.ShoesPictures.Where(p => p.fk_ShoesPictureProduct_Id == ShoesId).OrderBy(p => p.ShoesPicture_Id).ToList();
			return product.ToEditImgDto();
		}
	}
}
