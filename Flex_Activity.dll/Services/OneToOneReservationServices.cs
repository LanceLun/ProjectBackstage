using EFModels.EFModels;
using Flex_Activity.dll.Infra.DapperRepositories;
using Flex_Activity.dll.Interface;
using Flex_Activity.dll.Models.Dto;
using Flex_Activity.dll.Models.Exts;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.ModelBinding;

namespace Flex_Activity.dll.Services
{
	public class OneToOneReservationServices
	{
		private IReservationRepository _repo;
        public OneToOneReservationServices(IReservationRepository repo)
        {
            _repo = repo;
        }

        public List<OneToOneReservationIndexDto> GetAll()
        {
            var reservations =_repo.GetAll();
            return reservations.ToList();
        }

        public List<ReservationListDto> GetAll(int speakerId)
        {
            var reservations = _repo.GetAll(speakerId);
            return reservations.ToList();

        }

		public Result Delete(int id)
        {
           _repo.Delete(id);
            return Result.Success();
        }

		public List<OneToOneReservationDetailDapperDto> GetOneDetail(int speakerId, int MemberId)
        {
            var detailDto = _repo.GetOneDetail(speakerId, MemberId);
          
            return detailDto.ToList();
        }

        public Result Update (ReservationEditDapperDto dto)
		{
            AppDbContext db = new AppDbContext();
			DateTime ReservationEndTime = dto.ReservationStartTime.AddHours(1); // 根據開始時間計算結束時間
			bool hasReservation = db.OneToOneReservations.Any(a => a.fk_ReservationSpeakerId == dto.fk_ReservationSpeakerId &&
												((dto.ReservationStartTime >= a.ReservationStartTime && dto.ReservationStartTime <= a.ReservationEndTime) ||
												(ReservationEndTime >= a.ReservationStartTime && ReservationEndTime <= a.ReservationEndTime) ||
												(a.ReservationStartTime >= dto.ReservationStartTime && a.ReservationStartTime <= ReservationEndTime) ||
												(a.ReservationEndTime >= dto.ReservationStartTime && a.ReservationEndTime <= ReservationEndTime)));

            if (hasReservation)
            {
                //如果時間有重疊
                return Result.Fail("該時段已有預約，請重選時間");
                
            }
			_repo.Update(dto);
            return Result.Success();

           
        }

		public ReservationEditDapperDto GetOneEditInfo(int speakerId, int MemberId)
        {
            var detailDto = _repo.GetOneEditInfo(speakerId, MemberId);
            return detailDto.FirstOrDefault();
            
        }

	}
}
