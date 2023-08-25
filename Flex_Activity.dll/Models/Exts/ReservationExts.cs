using EFModels.EFModels;
using Flex_Activity.dll.Models.Dto;
using Flex_Activity.dll.Models.ViewModels;
using Flex_Activity.dll.Models.ViewModels.DapperVM;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using static Dapper.SqlMapper;

namespace Flex_Activity.dll.Models.Exts
{
	public static class ReservationExts
	{
		public static OneToOneReservationDapperVM ToIndexVM(this OneToOneReservationIndexDto dto)
		{
			return new OneToOneReservationDapperVM
			{
				SpeakerId = dto.SpeakerId,
				SpeakerName = dto.SpeakerName,
				FieldName = dto.FieldName

			};
		}

		public static ReservationListVM ToIndexVM(this ReservationListDto dto)
		{
			return new ReservationListVM
			{
				MemberId = dto.MemberId,
				Name = dto.Name,
				Mobile = dto.Mobile,
				ReservationStartTime = dto.ReservationStartTime,
				BranchName = dto.BranchName,
				ReservationStatusDescription = dto.ReservationStatusDescription,
				ReservationId = dto.ReservationId,
				SpeakerId =dto.SpeakerId

			};
		}

		public static OneToOneReservationDetailDapperDto ToDetailDto (this OneToOneReservation entity)
		{
			return new OneToOneReservationDetailDapperDto
			{
				MemberId = entity.Member.MemberId,
				Name = entity.Member.Name,
				Mobile = entity.Member.Mobile,
				ReservationStartTime = entity.ReservationStartTime,
				ReservationEndTime = entity.ReservationEndTime,
				BranchName = entity.Branch.BranchName,
				ReservationCreatedDate = entity.ReservationCreatedDate,
				ReservationStatusDescription = entity.ReservationStatus.ReservationStatusDescription,
				fk_ReservationSpeakerId = entity.fk_ReservationSpeakerId,
				fk_ReservationStatusId = entity.fk_ReservationStatusId
			};
	}

		public static OneToOneReservationDetailDapperVM ToDetailVM (this OneToOneReservationDetailDapperDto dto)
		{
			return new OneToOneReservationDetailDapperVM
			{
				MemberId = dto.MemberId,
				Name = dto.Name,
				Mobile = dto.Mobile,
				ReservationStartTime = dto.ReservationStartTime,
				ReservationEndTime = dto.ReservationEndTime,
				BranchName = dto.BranchName,
				ReservationCreatedDate = dto.ReservationCreatedDate,
				ReservationStatusDescription = dto.ReservationStatusDescription,
				fk_ReservationSpeakerId = dto.fk_ReservationSpeakerId,
				fk_ReservationStatusId = dto.fk_ReservationStatusId
			};

		}

		public static ReservationEditDapperVM ToEditVM (this ReservationEditDapperDto dto)
		{
			return new ReservationEditDapperVM
			{
				//ReservationEndTime = dto.ReservationEndTime,
				ReservationStartTime = dto.ReservationStartTime
			};
		}

		public static ReservationEditDapperDto ToEditDto (this OneToOneReservation entity)
		{
			return new ReservationEditDapperDto
			{
				ReservationStartTime = entity.ReservationStartTime,
				//ReservationEndTime = entity.ReservationEndTime
			};
		}

		public static ReservationEditDapperDto ToEditDto(this ReservationEditDapperVM vm)
		{
			return new ReservationEditDapperDto
			{
				ReservationStartTime = vm.ReservationStartTime,
				//ReservationEndTime = vm.ReservationEndTime
				fk_ReservationSpeakerId = vm.fk_ReservationSpeakerId,

				 MemberId = vm.MemberId
	};
		}

		//public static OneToOneReservation ToEditEntity (this ReservationEditDapperDto dto)
		//{
		//	return new OneToOneReservation
		//	{
		//		ReservationStartTime = dto.ReservationStartTime,
		//		//ReservationEndTime = dto.ReservationEndTime
		//		fk_ReservationSpeakerId = dto.fk_ReservationSpeakerId,

			
		//	};
		//}
	}
}
