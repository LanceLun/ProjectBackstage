using Discount.dll.Models.Dtos;
using Discount.dll.Models.Infra;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Discount.dll.Models.Interfaces
{
    public interface ICouponRepository
    {
        IEnumerable<CouponIndexDto> GetCoupons(bool searchExpired = false, string searchDiscountName = null);
        CouponEditDto GetCouponById(int id);
        int Create(CouponCreateDto dto);
        void Delete(int id);
        void Update(CouponEditDto dto);

        bool ExistsStartDate(DateTime startDate, int id);
        bool AlreadyStarted(int id);
    }
}
