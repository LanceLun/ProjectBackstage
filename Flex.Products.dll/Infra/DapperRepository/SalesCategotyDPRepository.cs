using Dapper;
using EFModels.EFModels;
using Flex.Products.dll.Interface;
using Flex.Products.dll.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex.Products.dll.Infra.DapperRepository
{
	public class SalesCategotyDPRepository : ISalesCategoryRepository
	{
		private readonly string  _connStr;
        public SalesCategotyDPRepository()
        {
			_connStr = System.Configuration.ConfigurationManager.ConnectionStrings["AppDbContext"].ConnectionString;
		}
        public List<SalesCategoryDto> Search()
		{
			string sql = @"select SalesCategoryId,SalesCategoryName from SalesCategories 
order by SalesCategoryId";
			
			var salesCategory=new SqlConnection(_connStr).Query<SalesCategoryDto>(sql).ToList();

			return salesCategory;
		}

		public void CreateCategory(SalesCategoryDto dto)
		{
			using (var conn=new SqlConnection(_connStr))
			{
				string sql = @"insert into SalesCategories(SalesCategoryName)
values (@SalesCategoryName);";

				conn.Execute(sql, dto);
			}
		}

		public SalesCategoryDto GetCategoryById(int salesCategoryId)
		{
			using (var conn=new SqlConnection(_connStr))
			{
				string sql = @"select SalesCategoryId,SalesCategoryName 
from SalesCategories
where SalesCategoryId=@SalesCategoryId;"
				;

				return conn.QueryFirstOrDefault<SalesCategoryDto>(sql, new { SalesCategoryId = salesCategoryId });
			}
		}

		public void EditCategory(SalesCategoryDto dto)
		{
			using (var conn=new SqlConnection(_connStr))
			{
				string sql = @"update SalesCategories
set SalesCategoryName=@SalesCategoryName
where SalesCategoryId=@SalesCategoryId";

				conn.Execute(sql, new { SalesCategoryId =dto.SalesCategoryId, SalesCategoryName =dto.SalesCategoryName});
			}
		}

		public void DeleteCategory(int salesCategoryId)
		{
			using (var conn=new SqlConnection(_connStr))
			{
				string sql = @"delete SalesCategories
where SalesCategoryId=@SalesCategoryId";

				conn.Execute(sql, new { SalesCategoryId = salesCategoryId });
			}
		}

		public List<SalesCategoryDto> GetSalesCategoty()
		{
			string sql = @"select SalesCategoryId,SalesCategoryName from SalesCategories";

			var result = new SqlConnection(_connStr).Query<SalesCategoryDto>(sql).ToList();
			return result;
		}
	}
}
