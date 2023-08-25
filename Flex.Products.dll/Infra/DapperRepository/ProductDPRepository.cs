using Dapper;
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
	public class ProductDPRepository:IProductRepository
	{
		private readonly string _connStr;
		public ProductDPRepository()
		{
			_connStr = System.Configuration.ConfigurationManager.ConnectionStrings["AppDbContext"].ConnectionString;
		}
		public List<ProductExcelReportDto> ReportToExcel()
		{
			string sql = @"select ProductId,ProductName,ProductDescription,ProductMaterial,ProductOrigin,
UnitPrice,SalesPrice,Status,LogOut,Tag,
CreateTime,EditTime,ProductSubCategoryName,ProductCategoryName,SalesCategoryName,
ColorName,SizeName,Qty
from Products
left join ProductGroups on fk_ProductId=ProductId 
join ProductSubCategories on ProductSubCategoryId=fk_ProductSubCategoryId
join ProductCategories on ProductCategoryId=fk_ProductCategoryId
join SalesCategories on SalesCategoryId=fk_SalesCategoryId
join ColorCategories on ColorId=fk_ColorId
join SizeCategories on SizeId=fk_SizeId
where LogOut=0;";

			var result=new SqlConnection(_connStr).Query<ProductExcelReportDto>(sql).ToList();
			return result;
		}

		public void CreateProduct(ProductDto dto)
		{
			throw new NotImplementedException();
		}

		public void DeleteProduct(string productId)
		{
			throw new NotImplementedException();
		}

		public void EditProduct(ProductDto dto)
		{
			throw new NotImplementedException();
		}

		public ProductDto GetById(string productId)
		{
			throw new NotImplementedException();
		}

		public List<ProductImgDto> GetImgById(string productId)
		{
			throw new NotImplementedException();
		}

		public void SaveChangeStatus(List<ProductDto> dto)
		{
			throw new NotImplementedException();
		}

		public void SaveEditImg(List<ProductImgDto> dto)
		{
			throw new NotImplementedException();
		}

		public List<ProductDto> Search(IndexSearchCriteria criteria)
		{
            throw new NotImplementedException();
            //criteria = criteria ?? new IndexSearchCriteria();

            //var sql = @"SELECT p.ProductId, p.ProductName, p.ProductDescription, p.ProductMaterial, p.ProductOrigin, p.UnitPrice, p.SalesPrice, p.Status, p.LogOut, p.Tag,
            //    CONCAT(pc.SalesCategoryName, '/', pc.ProductCategoryName, '/', psc.ProductSubCategoryName) AS ProductSubCategory,
            //    pg.ColorId, c.ColorName, pg.SizeId, s.SizeName, pg.Qty
            //    FROM Products p
            //    INNER JOIN ProductSubCategories psc ON p.fk_ProductSubCategoryId = psc.ProductSubCategoryId
            //    INNER JOIN ProductCategories pc ON psc.fk_ProductCategoryId = pc.ProductCategoryId
            //    LEFT JOIN ProductGroups as pg ON p.ProductId = pg.fk_ProductId
            //    LEFT JOIN ColorCategories c ON pg.ColorId = c.ColorId
            //    LEFT JOIN SizeCategories s ON pg.SizeId = s.SizeId
            //    WHERE 1=1";

            //var parameters = new DynamicParameters();

            //if (criteria.Name != null)
            //{
            //    sql += @" AND (p.ProductId LIKE @SearchTerm OR
            //        p.ProductName LIKE @SearchTerm OR
            //        p.Tag LIKE @SearchTerm OR
            //        psc.SubCategoryPath LIKE @SearchTerm)";
            //    parameters.Add("@SearchTerm", "%" + criteria.Name + "%");
            //}

            //if (criteria.ProductSubCategoryId != null && criteria.ProductSubCategoryId.Value > 0)
            //{
            //    sql += " AND p.fk_ProductSubCategoryId = @ProductSubCategoryId";
            //    parameters.Add("@ProductSubCategoryId", criteria.ProductSubCategoryId);
            //}

            //if (criteria.Status != null && criteria.Status != "請選擇狀態")
            //{
            //    if (criteria.Status == "上架中")
            //    {
            //        sql += " AND p.Status = 0";
            //    }
            //    if (criteria.Status == "已下架")
            //    {
            //        sql += " AND p.Status = 1";
            //    }
            //}

            //using (var conn = new SqlConnection(_connStr))
            //{
            //    var lookup = new Dictionary<string, ProductDto>();

            //    conn.Query<ProductDto, ProductGroupsDto, ProductDto>(sql, (product, productGroup) =>
            //    {
            //        if (!lookup.TryGetValue(product.ProductId, out var dto))
            //        {
            //            dto = product;
            //            dto.ProductGroups = new List<ProductGroupsDto>();
            //            lookup.Add(dto.ProductId, dto);
            //        }

            //        dto.ProductGroups.Add(productGroup);
            //        return dto;
            //    }, parameters);

            //    var products = lookup.Values.Where(p => !p.LogOut).ToList();
            //    return products;
            //}

        }

        public void CreateProductForExcel(ProductExcelImportDto dto)
		{
			throw new NotImplementedException();
		}

		public List<ProductDto> SearchIndexForExcel(List<string> productIds)
		{
			using (var conn=new SqlConnection(_connStr))
			{
				string sql = @"select ProductId,ProductName from Products 
where ProductId in @ProductId";

				return conn.Query<ProductDto>(sql, new { ProductId = productIds.ToArray() }).ToList();
			}
		}
	}
}
