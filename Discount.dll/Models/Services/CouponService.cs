using Discount.dll.Models.Dtos;
using Discount.dll.Models.Infra;
using Discount.dll.Models.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Discount.dll.Models.Services
{
    public class CouponService
    {
        public ICouponRepository _repo;
        public CouponService(ICouponRepository repo)
        {
            _repo = repo;
        }

        public IEnumerable<CouponIndexDto> GetCoupons(bool searchExpired = false, string searchDiscountName = null)
        {
            return _repo.GetCoupons(searchExpired, searchDiscountName);
        }

        public CouponEditDto GetCouponById(int id)
        {
            return _repo.GetCouponById(id);
        }
        public Result Update(CouponEditDto dto)
        {
            if (dto.CouponCategoryId == 1)
            {
                dto.EndDays = null;
                dto.RequiredProjectTagID = null;
                dto.Requirement = null;
                dto.RequirementType = null;
            }
            else if (dto.CouponCategoryId == 2 || dto.CouponCategoryId == 3)
            {
                dto.EndDate = null;
                dto.RequiredProjectTagID = null;
                dto.Requirement = null;
                dto.RequirementType = null;
            }
            else if (dto.CouponCategoryId == 4)
            {
                if (dto.RequirementType == null || dto.RequirementType < 0 || dto.RequirementType > 1)
                {
                    return Result.Fail("請選擇正確獲得門檻類型");
                }
                if (dto.Requirement == null || dto.Requirement < 0)
                {
                    return Result.Fail("請輸入獲得門檻類型");
                }
                dto.EndDate = null;
            }
            else if (dto.CouponCategoryId > 5 || dto.CouponCategoryId < 1)
            {
                return Result.Fail("錯誤，請重新輸入");
            }
            // 折扣驗證
            if (dto.DiscountType < 0 || dto.DiscountType > 2 || dto.DiscountValue < 0)
            {
                return Result.Fail("折扣錯誤，請更新資訊");
            }
            if (dto.DiscountType == 1 && dto.DiscountValue > 100)
            {
                return Result.Fail("百分比折扣不得大於100，請更新資訊");
            }
            if (dto.DiscountType == 2)
            {
                dto.DiscountValue = 0;
            }

            // 驗證開始日期
            var existsStartDate = !_repo.ExistsStartDate(dto.StartDate, dto.CouponId);
            if (dto.StartDate < DateTime.Today && existsStartDate)
            {
                return Result.Fail("開始日期已不可更動");
            }
            var alreadyStarted = _repo.AlreadyStarted(dto.CouponId);

            if (!alreadyStarted && dto.StartDate < DateTime.Today)
            {
                return Result.Fail("開始日期不可小於今天");
            }
            // 驗證結束日期
            if (dto.EndDate.HasValue && (dto.EndDate.Value < dto.StartDate || dto.EndDate.Value < DateTime.Today))
            {
                return Result.Fail("結束日期錯誤");
            }

            _repo.Update(dto);
            return Result.Success();
        }
        public Result Delete(int id)
        {
            _repo.Delete(id);
            return Result.Success();
        }
        public (int id, Result result) Create(CouponCreateDto dto)
        {
            if (dto.CouponCategoryId == 1)
            {
                dto.EndDays = null;
                dto.RequiredProjectTagID = null;
                dto.Requirement = null;
                dto.RequirementType = null;
            }
            else if (dto.CouponCategoryId == 2 || dto.CouponCategoryId == 3)
            {
                dto.EndDate = null;
                dto.RequiredProjectTagID = null;
                dto.Requirement = null;
                dto.RequirementType = null;
            }
            else if (dto.CouponCategoryId == 4)
            {
                if (dto.RequirementType == null || dto.RequirementType < 0 || dto.RequirementType > 1)
                {
                    return (0, Result.Fail("請選擇正確獲得門檻類型"));
                }
                if (dto.Requirement == null || dto.Requirement < 0)
                {
                    return (0, Result.Fail("請輸入獲得門檻類型"));
                }
                dto.EndDate = null;
            }
            else if (dto.CouponCategoryId > 5 || dto.CouponCategoryId < 1)
            {
                return (0, Result.Fail("錯誤，請重新輸入"));
            }
            // 折扣驗證
            if (dto.DiscountType < 0 || dto.DiscountType > 2 || dto.DiscountValue < 0)
            {
                return (0, Result.Fail("折扣錯誤，請更新資訊"));
            }
            if (dto.DiscountType == 1 && dto.DiscountValue > 100)
            {
                return (0, Result.Fail("百分比折扣不得大於100，請更新資訊"));
            }
            if (dto.DiscountType == 2)
            {
                dto.DiscountValue = 0;
            }

            // 驗證開始日期
            if (dto.StartDate < DateTime.Today)
            {
                return (0, Result.Fail("開始日期不可小於今天"));
            }
            // 驗證結束日期
            if (dto.EndDate.HasValue && dto.EndDate.Value < dto.StartDate)
            {
                return (0, Result.Fail("結束日期錯誤"));
            }
            int id = _repo.Create(dto);
            return (id, Result.Success());
        }
    }
}
