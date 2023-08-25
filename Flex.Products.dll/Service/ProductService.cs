using EFModels.EFModels;
using Flex.Products.dll.Exts;
using Flex.Products.dll.Infra.DapperRepository;
using Flex.Products.dll.Interface;
using Flex.Products.dll.Models.Dtos;
using Flex.Products.dll.Models.Infra.Exts;
using Flex.Products.dll.Models.ViewModel;
using System;
using System.Collections.Generic;
using System.Dynamic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex.Products.dll.Service
{
	public class ProductService
	{
		private IProductRepository _repo;
        private AppDbContext _db;
        public ProductService(IProductRepository repo)
        {
            this._repo = repo;
            _db= new AppDbContext();
        }

		public IEnumerable<ProductDto> IndexProduct(IndexSearchCriteria criteria)
		{
			var products = _repo.Search(criteria);
			return products;
		}

		public Result SaveChangeStatus(List<ProductDto> dto)
		{
			_repo.SaveChangeStatus(dto);

			return Result.Success();

		}

		public Result CreateProduct(ProductDto dto)
        {
            //檢查ProductId是否存在
            if (ExisProductID(dto.ProductId))
            {
                return Result.Fail($"商品編碼 {dto.ProductId} 已存在，請更換其他編碼");
            }

			if (IsGroupsValid(dto.ProductGroups))
			{
				return Result.Fail("規格錯誤，請確認是否重複或留空");
			}

            dto.LogOut = false;
            dto.CreateTime = DateTime.Now;
            dto.EditTime = DateTime.Now;

            _repo.CreateProduct(dto);

            return Result.Success();
        }

		public ProductDto GetById(string productId)
		{
			return _repo.GetById(productId);
		}

		public List<ProductImgDto> GetImgById(string productId) 
		{
			return _repo.GetImgById(productId);
		}

		public Result EditProduct(ProductDto dto)
		{
			if (IsGroupsValid(dto.ProductGroups))
			{
				return Result.Fail("規格錯誤，請確認是否重複或留空");
			}
			
			_repo.EditProduct(dto);
			return Result.Success();
		}

		public Result SaveEditImg(List<ProductImgDto> dto)
		{
			_repo.SaveEditImg(dto);
			return Result.Success();
		}

		public Result DeleteProduct(string ProductId)
		{

			try
			{
				_repo.DeleteProduct(ProductId);
				return Result.Success();
			}
			catch (Exception ex)
			{

				string errorMessage = "删除失败："+ ex.Message;
				return Result.Fail(errorMessage);
			}
		}

		public IEnumerable<ProductExcelReportDto> ReportToExcel()
		{
			var repoDP=new ProductDPRepository();
			var products = repoDP.ReportToExcel();
			return products;

		}

		public Result CreateProductForExcel(List<ProductExcelImportDto> dto)
		{
			//檢查ProductId是否存在
			foreach(var product in dto)
			{
				if (ExisProductID(product.ProductId))
				{
					return Result.Fail($"商品編碼 {product.ProductId} 已存在，請更換其他編碼");
				}

				if (IsGroupsValid(product.ProductGroups))
				{
					return Result.Fail("規格錯誤，請確認是否重複或留空");
				}
				product.LogOut = false;
				product.CreateTime = DateTime.Now;
				product.EditTime = DateTime.Now;
			}

			foreach (var product in dto)
			{
				_repo.CreateProductForExcel(product);
			}

			return Result.Success();
		}

		public IEnumerable<ProductDto> IndexForExcel(List<string> productIds)
		{
			var products = _repo.SearchIndexForExcel(productIds);
			return products;
		}

		//判斷產品識別碼是否已存在
		private bool ExisProductID(string ProductId)
		{
			return _db.Products.Any(p => p.ProductId == ProductId);
		}

		//判斷規格是否重複或未填寫
		private bool IsGroupsValid(List<ProductGroupsDto> productGroups)
		{
			var groupSpecs = new HashSet<string>();
			foreach (var group in productGroups)
			{
				var colorId = group.ColorId.ToString();
				var sizeId = group.SizeId.ToString();
				var combine = colorId + "-" + sizeId;

				if (groupSpecs.Contains(combine))
				{
					return true;
				}
				if (group.ColorId <= 0 || group.SizeId <= 0 || group.Qty < 1)
				{
					return true;
				};
				groupSpecs.Add(combine);
			}
			return false;
		}


	}

}
