using Discount.dll.Models.Dtos;
using Discount.dll.Models.Infra;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Discount.dll.Models.Interfaces
{
    public interface IDiscountRepository
    {
        IEnumerable<DiscountIndexDto> GetDiscounts(bool searchExpired = false, string searchDiscountName = null);
        DiscountCreateOrEditDto GetDiscountById(int id);
        int Create(DiscountCreateOrEditDto dto);
		void Delete(int id);
		void Update(DiscountCreateOrEditDto dto);
		bool ExistsDiscountName(string discountName);
		bool ExistsDiscountName(string discountName, int id);
		bool ExistsStartDate(DateTime startDate, int id);
        bool AlreadyStarted(int id);
        (bool exists, int smallerNum, int largerNum) ExistsOrderby(int OrderBy);
		(bool exists, int smallerNum, int largerNum) ExistsOrderby(int OrderBy, int id);
	}
}
