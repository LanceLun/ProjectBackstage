using Dapper;
using EFModels.EFModels;
using Flex.Products.dll.Exts;
using Flex.Products.dll.Interface;
using Flex.Products.dll.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex.Products.dll.Infra.DapperRepository
{
	public class ProductSubCategoryDPRepository : IProductSubCategoryRepository
	{
		private readonly string _connStr;
		public ProductSubCategoryDPRepository() 
		{
			_connStr = System.Configuration.ConfigurationManager.ConnectionStrings["AppDbContext"].ConnectionString;
		}
		public void CreateCategory(ProductSubCategoryDto dto)
		{
			using (var conn=new SqlConnection(_connStr))
			{
				string sql = @"insert into ProductSubCategories(ProductSubCategoryName,fk_ProductCategoryId,SubCategoryPath)
values (@ProductSubCategoryName,@fk_ProductCategoryId,@SubCategoryPath)";

				conn.Execute(sql, dto);
			}
		}

		public void DeleteCategory(int productSubCategoryId)
		{
			using (var conn=new SqlConnection(_connStr))
			{
				string sql = @"delete ProductSubCategories
where ProductSubCategoryId=@ProductSubCategoryId;";

				conn.Execute(sql, new { ProductSubCategoryId = productSubCategoryId });
			}
		}

		public void EditCategory(ProductSubCategoryDto dto)
		{
			using (var conn=new SqlConnection(_connStr))
			{
				string sql = @"update ProductSubCategories
set ProductSubCategoryName=@ProductSubCategoryName,
fk_ProductCategoryId=@fk_ProductCategoryId,
SubCategoryPath=@SubCategoryPath
where ProductSubCategoryId=@ProductSubCategoryId;";

				conn.Execute(sql, new
				{
					ProductSubCategoryName=dto.ProductSubCategoryName,
					fk_ProductCategoryId=dto.fk_ProductCategoryId,
					SubCategoryPath=dto.SubCategoryPath,
					ProductSubCategoryId = dto.ProductSubCategoryId
				});
			}
		}

		public ProductSubCategoryDto GetCategoryById(int productSubCategoryId)
		{
			string sql = @"select ProductSubCategoryId,ProductSubCategoryName,fk_ProductCategoryId from ProductSubCategories
where ProductSubCategoryId=@ProductSubCategoryId"
			;

			var result=new SqlConnection(_connStr).QueryFirstOrDefault<ProductSubCategoryDto>(sql, new { ProductSubCategoryId = productSubCategoryId });
			return result;
		}

		public List<ProductSubCategoryDto> Search()
		{
			string sql = @"select ProductSubCategoryId,SalesCategoryName,ProductCategoryName,ProductSubCategoryName
from ProductSubCategories as PS
join ProductCategories AS P on P.ProductCategoryId=PS.fk_ProductCategoryId
Join SalesCategories AS S on S.SalesCategoryId=P.fk_SalesCategoryId";

			var result = new SqlConnection(_connStr).Query<ProductSubCategoryDto>(sql).ToList();
			return result;
		}

		public List<ProductSubCategoryDto> GetProductSubCategory()
		{
			string sql = @"select ProductSubCategoryId,ProductSubCategoryName,ProductCategoryName,SalesCategoryName,SubCategoryPath from ProductSubCategories
join ProductCategories on ProductCategoryId=fk_ProductCategoryId
join SalesCategories on SalesCategoryId=fk_SalesCategoryId";

			var result=new SqlConnection(_connStr).Query<ProductSubCategoryDto>(sql).ToList();
			return result;
		}
	}
}
