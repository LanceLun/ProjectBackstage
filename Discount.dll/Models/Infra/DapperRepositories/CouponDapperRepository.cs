using Discount.dll.Models.Dtos;
using Discount.dll.Models.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using System.Configuration;
using System.Data.SqlClient;

namespace Discount.dll.Models.Infra.DapperRepositories
{
    public class CouponDapperRepository : ICouponRepository
    {
        private readonly string _connStr;

        public CouponDapperRepository()
        {
            _connStr = ConfigurationManager.ConnectionStrings["AppDbContext"].ConnectionString;
        }

        public bool AlreadyStarted(int id)
        {
            using (var connection = new SqlConnection(_connStr))
            {
                connection.Open();

                string query = "SELECT COUNT(*) FROM Coupons WHERE CouponId = @Id AND StartDate <= GETDATE()";
                int count = connection.QuerySingle<int>(query, new { Id = id });

                return count > 0;
            }
        }

        public int Create(CouponCreateDto dto)
        {
            using (var connection = new SqlConnection(_connStr))
            {
                connection.Open();

                string query = @"INSERT INTO Coupons (
fk_CouponCategoryId, CouponName, StartDate, EndType, EndDays, 
EndDate, MinimumPurchaseAmount, PersonMaxUsage, DiscountType, DiscountValue, 
RequirementType, Requirement, fk_RequiredProjectTagID)
VALUES 
(@CouponCategoryId, @CouponName, @StartDate, @EndType, @EndDays, 
@EndDate, @MinimumPurchaseAmount, @PersonMaxUsage, @DiscountType, @DiscountValue, 
@RequirementType, @Requirement, @RequiredProjectTagID);
SELECT CAST(SCOPE_IDENTITY() AS INT)";
                int couponId = connection.QuerySingle<int>(query, dto);

                return couponId;
            }
        }

        public void Delete(int id)
        {
            using (var connection = new SqlConnection(_connStr))
            {
                connection.Open();

                string query = "DELETE FROM Coupons WHERE CouponId = @Id";
                connection.Execute(query, new { Id = id });
            }
        }

        public bool ExistsStartDate(DateTime startDate, int id)
        {
            using (var connection = new SqlConnection(_connStr))
            {
                connection.Open();

                string query = "SELECT COUNT(*) FROM Coupons WHERE CouponId = @Id AND StartDate < GETDATE() AND StartDate = @StartDate";
                int count = connection.QuerySingle<int>(query, new { Id = id, StartDate = startDate });

                return count > 0;
            }
        }

        public CouponEditDto GetCouponById(int id)
        {
            using (var connection = new SqlConnection(_connStr))
            {
                connection.Open();

                string query = @"SELECT c.CouponId, c.fk_CouponCategoryId, cc.CouponCategoryName, c.CouponName,
c.StartDate, c.EndType, c.EndDays, c.EndDate, c.MinimumPurchaseAmount,
c.PersonMaxUsage, c.DiscountType, c.DiscountValue, c.RequirementType,
c.Requirement, c.fk_RequiredProjectTagID, pt.ProjectTagName
FROM Coupons c
LEFT JOIN CouponCategories cc ON c.fk_CouponCategoryId = cc.CouponCategoryId
LEFT JOIN ProjectTags pt ON c.fk_RequiredProjectTagID = pt.ProjectTagID
WHERE c.CouponId = @Id";
                var coupon = connection.QueryFirstOrDefault<CouponEditDto>(query, new { Id = id });

                return coupon;
            }
        }

        public IEnumerable<CouponIndexDto> GetCoupons(bool searchExpired = false, string searchDiscountName = null)
        {
            using (var connection = new SqlConnection(_connStr))
            {
                connection.Open();

                string query = @"SELECT c.fk_CouponCategoryId, c.CouponId, cc.CouponCategoryName, c.CouponName,
c.StartDate, c.EndType, c.EndDays, c.EndDate, c.MinimumPurchaseAmount,
c.PersonMaxUsage, c.DiscountType, c.DiscountValue
FROM Coupons c
LEFT JOIN CouponCategories cc ON c.fk_CouponCategoryId = cc.CouponCategoryId
LEFT JOIN ProjectTags pt ON c.fk_RequiredProjectTagID = pt.ProjectTagID
WHERE (@SearchExpired = 0 AND (c.EndDate IS NULL OR c.EndDate >= GETDATE()))
AND (@SearchDiscountName IS NULL OR c.CouponName LIKE '%' + @SearchDiscountName + '%')";
                var coupons = connection.Query<CouponIndexDto>(query, new { SearchExpired = searchExpired, SearchDiscountName = searchDiscountName });

                return coupons;
            }
        }

        public void Update(CouponEditDto dto)
        {
            using (var connection = new SqlConnection(_connStr))
            {
                connection.Open();

                string query = @"UPDATE Coupons SET
fk_CouponCategoryId = @CouponCategoryId,
CouponName = @CouponName,
StartDate = @StartDate,
EndType = @EndType,
EndDays = @EndDays,
EndDate = @EndDate,
MinimumPurchaseAmount = @MinimumPurchaseAmount,
PersonMaxUsage = @PersonMaxUsage,
DiscountType = @DiscountType,
DiscountValue = @DiscountValue,
RequirementType = @RequirementType,
Requirement = @Requirement,
fk_RequiredProjectTagID = @RequiredProjectTagID
WHERE CouponId = @CouponId";
                connection.Execute(query, dto);
            }
        }
    }
}
