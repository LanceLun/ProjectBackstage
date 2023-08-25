using Discount.dll.Models.Dtos;
using Discount.dll.Models.Interfaces;
using EFModels.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using System.Runtime.Remoting.Contexts;

namespace Discount.dll.Models.Infra.EFRepositories
{
    public class CouponEFRepository : ICouponRepository
    {
        private AppDbContext _db = new AppDbContext();

        public bool AlreadyStarted(int id)
        {

            return _db.Coupons.Any(m => m.CouponId == id && m.StartDate <= DateTime.Today);
        }

        public int Create(CouponCreateDto dto)
        {
            var coupon = new Coupon
            {
                fk_CouponCategoryId = dto.CouponCategoryId,
                CouponName = dto.CouponName,
                StartDate = dto.StartDate,
                EndType = dto.EndType,
                EndDays = dto.EndDays,
                EndDate = dto.EndDate,
                MinimumPurchaseAmount = dto.MinimumPurchaseAmount,
                PersonMaxUsage = dto.PersonMaxUsage,
                DiscountType = dto.DiscountType,
                DiscountValue = dto.DiscountValue,
                RequirementType = dto.RequirementType,
                Requirement = dto.Requirement,
                fk_RequiredProjectTagID = dto.RequiredProjectTagID
            };

            _db.Coupons.Add(coupon);
            _db.SaveChanges();

            return coupon.CouponId;
        }

        public void Delete(int id)
        {
            var coupon = _db.Coupons.FirstOrDefault(c => c.CouponId == id);

            if (coupon != null)
            {
                _db.Coupons.Remove(coupon);
                _db.SaveChanges();
            }
        }

        public bool ExistsStartDate(DateTime startDate, int id)
        {
            return _db.Coupons.Any(m => m.CouponId == id && m.StartDate < DateTime.Today && m.StartDate == startDate);
        }

        public CouponEditDto GetCouponById(int id)
        {
            return _db.Coupons
                .AsNoTracking()
                .Include(c => c.CouponCategory)
                .Include(c => c.ProjectTag)
                .Where(d => d.CouponId == id)
                .Select(c => new CouponEditDto
                {
                    CouponId = c.CouponId,
                    CouponCategoryId = c.fk_CouponCategoryId,
                    CouponCategoryName = c.CouponCategory.CouponCategoryName,
                    CouponName = c.CouponName,
                    StartDate = c.StartDate,
                    EndType = c.EndType,
                    EndDays = c.EndDays,
                    EndDate = c.EndDate,
                    MinimumPurchaseAmount = c.MinimumPurchaseAmount,
                    PersonMaxUsage = c.PersonMaxUsage,
                    DiscountType = c.DiscountType,
                    DiscountValue = c.DiscountValue,
                    RequirementType = c.RequirementType,
                    Requirement = c.Requirement,
                    RequiredProjectTagID = c.fk_RequiredProjectTagID,
                    ProjectTagName = c.ProjectTag.ProjectTagName
                })
                .FirstOrDefault();
        }

        public IEnumerable<CouponIndexDto> GetCoupons(bool searchExpired = false, string searchDiscountName = null)
        {
            var query = _db.Coupons.AsQueryable();

            if (!searchExpired)
            {
                DateTime today = DateTime.Today;

                query = query.Where(d => d.EndDate == null || d.EndDate >= today);
            }

            if (!string.IsNullOrEmpty(searchDiscountName))
            {
                query = query.Where(d => d.CouponName.Contains(searchDiscountName));
            }

            return query
                .AsNoTracking()
                .Include(p => p.ProjectTag)
                .Select(c => new CouponIndexDto
                {
                    CouponCategoryId = c.fk_CouponCategoryId,
                    CouponId = c.CouponId,
                    CouponCategoryName = c.CouponCategory.CouponCategoryName,
                    CouponName = c.CouponName,
                    StartDate = c.StartDate,
                    EndType = c.EndType,
                    EndDays = c.EndDays,
                    EndDate = c.EndDate,
                    MinimumPurchaseAmount = c.MinimumPurchaseAmount,
                    PersonMaxUsage = c.PersonMaxUsage,
                    DiscountType = c.DiscountType,
                    DiscountValue = c.DiscountValue
                });
        }

        public void Update(CouponEditDto dto)
        {
            var coupon = _db.Coupons.FirstOrDefault(c => c.CouponId == dto.CouponId);


            coupon.fk_CouponCategoryId = dto.CouponCategoryId;
            coupon.CouponName = dto.CouponName;
            coupon.StartDate = dto.StartDate;
            coupon.EndType = dto.EndType;
            coupon.EndDays = dto.EndDays;
            coupon.EndDate = dto.EndDate;
            coupon.MinimumPurchaseAmount = dto.MinimumPurchaseAmount;
            coupon.PersonMaxUsage = dto.PersonMaxUsage;
            coupon.DiscountType = dto.DiscountType;
            coupon.DiscountValue = dto.DiscountValue;
            coupon.RequirementType = dto.RequirementType;
            coupon.Requirement = dto.Requirement;
            coupon.fk_RequiredProjectTagID = dto.RequiredProjectTagID;

            _db.SaveChanges();

        }
    }
}
