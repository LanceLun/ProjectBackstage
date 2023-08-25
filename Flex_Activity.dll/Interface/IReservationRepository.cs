using EFModels.EFModels;
using Flex_Activity.dll.Models.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex_Activity.dll.Interface
{
	public interface IReservationRepository
	{
		IEnumerable<OneToOneReservationIndexDto> GetAll();

		IEnumerable<ReservationListDto> GetAll(int speakerId);

		void Delete(int reservationId);

		IEnumerable<OneToOneReservationDetailDapperDto> GetOneDetail(int speakerId, int MemberId);

		void Update(ReservationEditDapperDto dto/*int fk_ReservationSpeakerId, int MemberId, DateTime ReservationStartTime*/);

		IEnumerable<ReservationEditDapperDto> GetOneEditInfo(int speakerId, int MemberId);

	}
}
