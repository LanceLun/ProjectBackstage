using Dapper;
using EFModels.EFModels;
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
	public class ProductCategoryDPRepository : IProductCategoryRepository
	{
		private readonly string _connStr;
        public ProductCategoryDPRepository()
        {
			_connStr = System.Configuration.ConfigurationManager.ConnectionStrings["AppDbContext"].ConnectionString;
		}

        public List<ProductCategoryDto> Search()
		{
			string sql = @"select P.ProductCategoryId,P.ProductCategoryName,p.fk_SalesCategoryId,S.SalesCategoryName as  SalesCategoryName,S.SalesCategoryId as SalesCategoryId
from ProductCategories as P
left join SalesCategories as S on S.SalesCategoryId=P.fk_SalesCategoryId";

			var result = new SqlConnection(_connStr).Query<ProductCategoryDto>(sql).ToList();
			return result;
		}

		public void CreateCategory(ProductCategoryDto dto)
		{
			using (var conn=new SqlConnection(_connStr))
			{
				string sql = @"insert into ProductCategories
(ProductCategoryName,fk_SalesCategoryId,CategoryPath)
values (@ProductCategoryName,@fk_SalesCategoryId,@CategoryPath);";

				conn.Execute(sql,dto);
			}
		}

		public void DeleteCategory(int productCategoryId)
		{
			using (var conn=new SqlConnection(_connStr))
			{
				string sql = @"delete ProductCategories
where ProductCategoryId=@ProductCategoryId";

				conn.Execute(sql, new { ProductCategoryId = productCategoryId });
			}
		}

		public void EditCategory(ProductCategoryDto dto)
		{
			using (var conn=new SqlConnection(_connStr))
			{
				string sql = @"update ProductCategories
set ProductCategoryName=@ProductCategoryName,
fk_SalesCategoryId=@fk_SalesCategoryId,
CategoryPath=@CategoryPath
where ProductCategoryId=@ProductCategoryId;";

				conn.Execute(sql, new { ProductCategoryName =dto.ProductCategoryName, fk_SalesCategoryId =dto.fk_SalesCategoryId, CategoryPath =dto.CategoryPath, ProductCategoryId =dto.ProductCategoryId});
			};
		}

		public ProductCategoryDto GetCategoryById(int productCategoryId)
		{
			using (var conn=new SqlConnection(_connStr))
			{
				string sql = @"select ProductCategoryId,ProductCategoryName,fk_SalesCategoryId  
from ProductCategories
where ProductCategoryId=@ProductCategoryId;";

				var result=conn.QueryFirstOrDefault<ProductCategoryDto>(sql, new { ProductCategoryId =productCategoryId});

				return result;
			}
		}

		public List<ProductCategoryDto> GetProductCategory()
		{
			string sql = @"select ProductCategoryId,CategoryPath,ProductCategoryName,SalesCategoryName from ProductCategories
join SalesCategories on SalesCategoryId=fk_SalesCategoryId";

			var result=new SqlConnection(_connStr).Query<ProductCategoryDto>(sql).ToList();

			return result;
		}


	}
}
