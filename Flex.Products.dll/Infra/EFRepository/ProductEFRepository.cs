using EFModels.EFModels;
using Flex.Products.dll.Models.Dtos;
using Flex.Products.dll.Models.Infra.Exts;
using Flex.Products.dll.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using Flex.Products.dll.Exts;
using Flex.Products.dll.Service;
using static Flex.Products.dll.Service.ProductService;
using Flex.Products.dll.Models.ViewModel;

namespace Flex.Products.dll.Models.Infra.EFRepository
{
	public class ProductEFRepository : IProductRepository
	{
		private AppDbContext _db;
        public ProductEFRepository()
        {
			_db = new AppDbContext();
        }

		public void CreateProduct(ProductDto dto)
		{
			var product = dto.ToCreateEntity();
			 _db.Products.Add(product);

			_db.SaveChanges();
		}

		public List<ProductDto> Search(IndexSearchCriteria criteria)
		{
			criteria=criteria ?? new IndexSearchCriteria();

			var query = _db.Products.Include(p => p.ProductSubCategory.ProductCategory.SalesCategory).Include(p => p.ProductGroups);

			#region 搜尋條件
			if (criteria.Name != null)
			{
				query = query.Where(p => p.ProductId.Contains(criteria.Name) ||
										p.ProductName.Contains(criteria.Name) ||
										p.Tag.Contains(criteria.Name) ||
										p.ProductSubCategory.SubCategoryPath.Contains(criteria.Name));
			}
			if (criteria.ProductSubCategoryId != null && criteria.ProductSubCategoryId.Value > 0)
			{
				query = query.Where(p => p.fk_ProductSubCategoryId == criteria.ProductSubCategoryId);
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

			var products = query.OrderByDescending(p => p.CreateTime).ToList().Select(p => p.ToIndexDto()).ToList();

			//排除LogOut
			products=products.Where(p=>p.LogOut==false).ToList();
			return products;
		}		

		public void SaveChangeStatus(List<ProductDto> dto)
		{
			foreach (var item in dto)
			{
				var product=_db.Products.FirstOrDefault(p => p.ProductId == item.ProductId);
				if (product == null) return;

				product.Status = item.Status;
				product.EditTime = DateTime.Now;

				_db.SaveChanges();
			}
		}

		public ProductDto GetById(string productId)
		{
			var product=_db.Products.Include(p=>p.ProductGroups).FirstOrDefault(p => p.ProductId == productId);
			return product.ToEditDto();
		}

		public List<ProductImgDto> GetImgById(string productId)
		{
			var product = _db.ProductImgs.Where(p => p.fk_ProductId == productId).OrderBy(p=>p.ProductImgId).ToList();
			return product.ToEditImgDto();
		}

		public void EditProduct(ProductDto dto)
		{
			var product = dto.DtoToEditEntity();
			product.EditTime= DateTime.Now;

			var existingGroups = _db.ProductGroups.Where(p => p.fk_ProductId == product.ProductId).ToList();

			//如果資料庫先清空規格
			foreach (var group in existingGroups)
			{
				_db.ProductGroups.Remove(group);
			}

			foreach (var group in product.ProductGroups)
			{
				// 新增新的 ProductGroup
				_db.ProductGroups.Add(group);
			}

			_db.Entry(product).State = EntityState.Modified;

			_db.SaveChanges(); 
		}

		public void SaveEditImg(List<ProductImgDto> dto)
		{
			if (dto == null || dto.Count == 0) return;
			var productId = dto[0].fk_ProductId;
			var dbImgs = _db.ProductImgs.Where(i => i.fk_ProductId == productId).ToList();
			
			foreach(var img in dbImgs)
			{
				if(!dto.Any(i=>i.ProductImgId== img.ProductImgId))
				{
					_db.ProductImgs.Remove(img);
				}
			}

			foreach (var editImg in dto)
			{
				//var dbImg = _db.ProductImgs.FirstOrDefault(i => i.ProductImgId == editImg.ProductImgId);
				if (editImg.ProductImgId == 0)
				{
					_db.ProductImgs.Add(editImg.DtoToEditImgEntity());
				}
			}
			_db.SaveChanges();
		}

		public void DeleteProduct(string productId)
		{
			var product = _db.Products.FirstOrDefault(p => p.ProductId == productId);
			if(product==null)return;

			product.LogOut = true;
			_db.SaveChanges();
		}

		public List<ProductExcelReportDto> ReportToExcel()
		{
			throw new NotImplementedException();
		}

		public void CreateProductForExcel(ProductExcelImportDto dto)
		{
			var product = dto.ToCreateEntity();
			_db.Products.Add(product);

			_db.SaveChanges();
		}

		public List<ProductDto> SearchIndexForExcel(List<string> productIds)
		{
			throw new NotImplementedException();
		}
	}
}
