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
using System.Security.Principal;
using System.Runtime.InteropServices.ComTypes;

namespace Discount.dll.Models.Infra.EFRepositories
{
    public class DiscountEFRepository : IDiscountRepository
    {
        private AppDbContext _db;

        public DiscountEFRepository()
        {
            _db = new AppDbContext();
        }

        public bool AlreadyStarted(int id)
        {
            return _db.Discounts.Any(m => m.DiscountId == id && m.StartDate <= DateTime.Today);
        }

        public int Create(DiscountCreateOrEditDto dto)
		{
			var discount = new EFModels.EFModels.Discount
			{
				DiscountName = dto.DiscountName,
				DiscountDescription = dto.DiscountDescription,
				DiscountType = dto.DiscountType,
				DiscountValue = dto.DiscountValue,
				fk_ProjectTagId = dto.ProjectTagId,
				ConditionType = dto.ConditionType,
				ConditionValue = dto.ConditionValue,
				StartDate = dto.StartDate,
				EndDate = dto.EndDate,
				OrderBy = dto.OrderBy
			};

			_db.Discounts.Add(discount);
			_db.SaveChanges();

			return discount.DiscountId;
		}

		public void Delete(int id)
		{
			var discount = _db.Discounts.Find(id);
			_db.Discounts.Remove(discount);
			_db.SaveChanges();
		}

		public bool ExistsDiscountName(string discountName)
		{
			return _db.Discounts.Any(m => m.DiscountName == discountName);
		}

		public bool ExistsDiscountName(string discountName, int id)
		{
			return _db.Discounts.Any(m => m.DiscountName == discountName && m.DiscountId != id);
		}

		public (bool exists,int smallerNum,int largerNum) ExistsOrderby(int OrderBy)
		{
			bool exists = _db.Discounts.Any(m => m.OrderBy == OrderBy);

			if (exists)
			{
				int smallerNumber = OrderBy - 1;
				int largerNumber = OrderBy + 1;

				while (_db.Discounts.Any(m => m.OrderBy == smallerNumber))
				{
					smallerNumber--;
				}
				while (_db.Discounts.Any(m => m.OrderBy == largerNumber))
				{
					largerNumber++;
				}
				return (exists, Math.Max(0,smallerNumber), largerNumber);
			}
			return (exists, 0, 0);
		}

		public (bool exists, int smallerNum, int largerNum) ExistsOrderby(int OrderBy, int id)
		{
			bool exists = _db.Discounts.Any(m => m.OrderBy == OrderBy && m.DiscountId != id);

			if (exists)
			{
				int smallerNumber = OrderBy - 1;
				int largerNumber = OrderBy + 1;

				while (_db.Discounts.Any(m => m.OrderBy == smallerNumber && m.DiscountId != id))
				{
					smallerNumber--;
				}
				while (_db.Discounts.Any(m => m.OrderBy == largerNumber && m.DiscountId != id))
				{
					largerNumber++;
				}

				return (exists, Math.Max(0, smallerNumber), largerNumber);
			}
			return (exists, 0, 0);
		}

		public bool ExistsStartDate(DateTime startDate, int id)
		{
			return _db.Discounts.Any(m => m.DiscountId == id && m.StartDate < DateTime.Today && m.StartDate == startDate);
		}

		public DiscountCreateOrEditDto GetDiscountById(int id)
		{
			return _db.Discounts
				.AsNoTracking()
				.Include(p => p.ProjectTag)
				.Where(d => d.DiscountId == id)
				.Select(p => new DiscountCreateOrEditDto
				{
					DiscountId = p.DiscountId,
					DiscountName = p.DiscountName,
					DiscountDescription = p.DiscountDescription,
					DiscountType = p.DiscountType,
					DiscountValue = p.DiscountValue,
					ProjectTagId = p.ProjectTag.ProjectTagId,
					ProjectTagName = p.ProjectTag.ProjectTagName,
					ConditionType = p.ConditionType,
					ConditionValue = p.ConditionValue,
					StartDate = p.StartDate,
					EndDate = p.EndDate,
					OrderBy = p.OrderBy
				})
				.FirstOrDefault();
		}

		public IEnumerable<DiscountIndexDto> GetDiscounts(bool searchExpired = false, string searchDiscountName = null)
        {
            var  query = _db.Discounts.AsQueryable();

			if (!searchExpired)
			{
				DateTime today = DateTime.Today;

				query = query.Where(d => d.EndDate == null || d.EndDate >= today);
			}

			if (!string.IsNullOrEmpty(searchDiscountName))
			{
				query = query.Where(d => d.DiscountName.Contains(searchDiscountName));
			}

			return query
				.AsNoTracking()
                .Include(p => p.ProjectTag)
                .OrderBy(p => p.OrderBy)
                .Select(p => new DiscountIndexDto
                {
                    DiscountId = p.DiscountId,
                    DiscountName = p.DiscountName,
                    DiscountDescription = p.DiscountDescription,
                    DiscountType = p.DiscountType,
                    DiscountValue = p.DiscountValue,
                    ProjectTagId = p.ProjectTag.ProjectTagId,
                    ProjectTagName = p.ProjectTag.ProjectTagName,
                    ConditionType = p.ConditionType,
                    ConditionValue = p.ConditionValue,
                    StartDate = p.StartDate,
                    EndDate = p.EndDate,
                    OrderBy = p.OrderBy
                });
        }

		public void Update(DiscountCreateOrEditDto dto)
		{
			var discount = _db.Discounts.Find(dto.DiscountId);

			discount.DiscountName = dto.DiscountName;
			discount.DiscountDescription = dto.DiscountDescription;
			discount.DiscountType = dto.DiscountType;
			discount.DiscountValue = dto.DiscountValue;
			discount.fk_ProjectTagId = dto.ProjectTagId;
			discount.ConditionType = dto.ConditionType;
			discount.ConditionValue = dto.ConditionValue;
			discount.StartDate = dto.StartDate;
			discount.EndDate = dto.EndDate;
			discount.OrderBy = dto.OrderBy;

			_db.SaveChanges();
		}
	}
}
