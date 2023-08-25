using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dapper;
using System.Configuration;
using System.Data;
using Flex_Activity.dll.Interface;
using Flex_Activity.dll.Models.Dto;
using System.Data.SqlClient;
using EFModels.EFModels;

namespace Flex_Activity.dll.Infra.DapperRepositories
{
	public class ReservationDapperRepository : IReservationRepository
	{
		private readonly string _connStr;
		public ReservationDapperRepository()
		{
			_connStr = ConfigurationManager.ConnectionStrings["AppDbContext"].ConnectionString;
		}

		public void Delete(int reservationId)
		{
			string sql = @"Delete
FROM OneToOneReservations
Where ReservationId = @reservationId";

			using (var conn = new SqlConnection(_connStr))
			{
				conn.Execute(sql, new {reservationId});
			}
		}

		public IEnumerable<OneToOneReservationIndexDto> GetAll()
		{
			string sql = @"SELECT SpeakerId,SpeakerName,  FieldName
FROM Speakers
Join SpeakerFields ON Speakers.fk_SpeakerFieldId = SpeakerFields.FieldId
";

			using(var conn = new SqlConnection(_connStr))
			{
				return conn.Query<OneToOneReservationIndexDto>(sql);
			}
		}

		public IEnumerable<ReservationListDto> GetAll(int speakerId)
		{
			string sql = @"SELECT MemberId, Name, Mobile, ReservationStartTime, BranchName, ReservationStatusDescription, OneToOneReservations.reservationId,
fk_ReservationSpeakerId as SpeakerId
FROM OneToOneReservations
JOIN Members ON OneToOneReservations.fk_BookerId = Members.MemberId
JOIN Branches ON OneToOneReservations.fk_BranchId = Branches.BranchId
JOIN ReservationStatuses ON OneToOneReservations.fk_ReservationStatusId = ReservationStatuses.ReservationId
Where fk_ReservationSpeakerId = @speakerId
";

			using (var conn = new SqlConnection(_connStr))
			{
				return conn.Query<ReservationListDto>(sql, new {speakerId = speakerId});
			}
		}

		public IEnumerable<OneToOneReservationDetailDapperDto> GetOneDetail(int speakerId, int MemberId)
		{
			string sql = @"SELECT MemberId, Name, Mobile, ReservationStartTime, ReservationEndTime, 
BranchName, ReservationCreatedDate, ReservationStatusDescription, fk_ReservationSpeakerId, fk_ReservationStatusId
FROM OneToOneReservations
JOIN Members ON OneToOneReservations.fk_BookerId = Members.MemberId
JOIN Branches ON OneToOneReservations.fk_BranchId = Branches.BranchId
JOIN ReservationStatuses ON OneToOneReservations.fk_ReservationStatusId = ReservationStatuses.ReservationId
WHERE fk_ReservationSpeakerId = @speakerId AND MemberId = @MemberId";

			using(var conn = new SqlConnection(_connStr))
			{
				return conn.Query<OneToOneReservationDetailDapperDto>(sql, new {speakerId = speakerId, MemberId = MemberId });
			}
		}

		public void Update(ReservationEditDapperDto dto)
		{
			string sql = @"UPDATE OneToOneReservations
SET ReservationStartTime = CONVERT(datetime, @ReservationStartTime),
    ReservationEndTime = DATEADD(HOUR, 2, @ReservationStartTime)
WHERE ReservationStartTime IN (
    SELECT ReservationStartTime
    FROM OneToOneReservations
    JOIN Members ON OneToOneReservations.fk_BookerId = Members.MemberId
    JOIN Branches ON OneToOneReservations.fk_BranchId = Branches.BranchId
    JOIN ReservationStatuses ON OneToOneReservations.fk_ReservationStatusId = ReservationStatuses.ReservationId
    WHERE fk_ReservationSpeakerId = @fk_ReservationSpeakerId AND Members.MemberId = @MemberId
);";

			using(var conn = new SqlConnection(_connStr))
			{
				conn.Execute(sql, new
				{
					ReservationStartTime = dto.ReservationStartTime,
					fk_ReservationSpeakerId = dto.fk_ReservationSpeakerId,
					MemberId = dto.MemberId
				});
			}
		}

		public IEnumerable<ReservationEditDapperDto> GetOneEditInfo(int speakerId, int MemberId)
		{
			string sql = @" SELECT ReservationStartTime, fk_ReservationSpeakerId, MemberId
    FROM OneToOneReservations
    JOIN Members ON OneToOneReservations.fk_BookerId = Members.MemberId
    JOIN Branches ON OneToOneReservations.fk_BranchId = Branches.BranchId
    JOIN ReservationStatuses ON OneToOneReservations.fk_ReservationStatusId = ReservationStatuses.ReservationId
    WHERE fk_ReservationSpeakerId = @speakerId AND Members.MemberId = @MemberId";

			using (var conn = new SqlConnection(_connStr))
			{
				return conn.Query<ReservationEditDapperDto>(sql, new { speakerId = speakerId, MemberId = MemberId });
			}
		}
	}
}
