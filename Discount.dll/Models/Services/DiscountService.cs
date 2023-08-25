using Discount.dll.Models.Dtos;
using Discount.dll.Models.Infra;
using Discount.dll.Models.Infra.EFRepositories;
using Discount.dll.Models.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Discount.dll.Models.Services
{
	public class DiscountService
	{

		private IDiscountRepository _repo;
		public DiscountService(IDiscountRepository repo)
		{
			_repo = repo;
		}

		public IEnumerable<DiscountIndexDto> GetDiscounts(bool searchExpired = false, string searchDiscountName = null)
		{
			return _repo.GetDiscounts(searchExpired, searchDiscountName);
		}
		public DiscountCreateOrEditDto GetDiscountById(int id)
		{
			return _repo.GetDiscountById(id);
		}
		public (int id, Result result) Create(DiscountCreateOrEditDto dto)
		{
			// 驗證優惠名稱是否重複
			bool existsDiscountName = _repo.ExistsDiscountName(dto.DiscountName);
			if (existsDiscountName)
			{
				return (0, Result.Fail("優惠名稱已存在，請更新資訊"));
			}
			// 優先度驗證
			if(!dto.OrderBy.HasValue || dto.OrderBy.Value < 0)
			{
				return (0, Result.Fail("優先度錯誤，請更新資訊"));
			}
			var existsOrderby = _repo.ExistsOrderby(dto.OrderBy.Value);
			if (existsOrderby.exists)
			{
				string otherNum = existsOrderby.smallerNum <= 0 ? string.Empty : $"{existsOrderby.smallerNum},或是 ";
				otherNum += existsOrderby.largerNum.ToString() ;
				return (0, Result.Fail($"優先度與其他優惠重複，您可以嘗試 {otherNum}"));
			}
			// 條件驗證
			if (dto.ConditionType<0 || dto.ConditionType > 1 || dto.ConditionValue <0)
			{
				return (0, Result.Fail("條件錯誤，請更新資訊"));
			}
			// 折扣驗證
			if (dto.DiscountType < 0 || dto.DiscountType > 1 || dto.DiscountValue < 0)
			{
				return (0, Result.Fail("折扣錯誤，請更新資訊"));
			}
            if (dto.DiscountType == 1 && dto.DiscountValue > 100)
            {
                return (0, Result.Fail("百分比折扣不得大於100，請更新資訊"));
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

			return (_repo.Create(dto),Result.Success());
		}

		public Result Delete(int[] ids)
		{
			for (int i = 0; i < ids.Length; i++)
			{
				_repo.Delete(ids[i]);
			}
			return Result.Success();
		}
		public Result Update(DiscountCreateOrEditDto dto)
		{
			// 驗證優惠名稱是否重複
			bool existsDiscountName = _repo.ExistsDiscountName(dto.DiscountName,dto.DiscountId);
			if (existsDiscountName)
			{
				return  Result.Fail("優惠名稱已存在，請更新資訊");
			}
			// 優先度驗證
			if (!dto.OrderBy.HasValue || dto.OrderBy.Value < 0)
			{
				return Result.Fail("優先度錯誤，請更新資訊");
			}
			var existsOrderby = _repo.ExistsOrderby(dto.OrderBy.Value,dto.DiscountId);
			if (existsOrderby.exists)
			{
				string otherNum = existsOrderby.smallerNum <= 0 ? string.Empty : $"{existsOrderby.smallerNum},或是 ";
				otherNum += existsOrderby.largerNum.ToString();
				return Result.Fail($"優先度與其他優惠重複，您可以嘗試 {otherNum}");
			}
			// 條件驗證
			if (dto.ConditionType < 0 || dto.ConditionType > 1 || dto.ConditionValue < 0)
			{
				return Result.Fail("條件錯誤，請更新資訊");
			}
			// 折扣驗證
			if (dto.DiscountType < 0 || dto.DiscountType > 1 || dto.DiscountValue < 0)
			{
				return Result.Fail("折扣錯誤，請更新資訊");
			}
            if (dto.DiscountType == 1 && dto.DiscountValue > 100)
            {
                return Result.Fail("百分比折扣不得大於100，請更新資訊");
            }

            // 驗證開始日期
            var existsStartDate = !_repo.ExistsStartDate(dto.StartDate,dto.DiscountId);
			if (dto.StartDate<DateTime.Today && existsStartDate)
			{
				return Result.Fail("開始日期已不可更動");
			}
			var alreadyStarted = _repo.AlreadyStarted(dto.DiscountId);

            if (!alreadyStarted && dto.StartDate < DateTime.Today)
			{
				return Result.Fail("開始日期不可小於今天");
			}
			// 驗證結束日期
			if (dto.EndDate.HasValue && (dto.EndDate.Value < dto.StartDate || dto.EndDate.Value< DateTime.Today))
			{
				return Result.Fail("結束日期錯誤");
			}

			_repo.Update(dto);
			return Result.Success();
		}
	}
}
