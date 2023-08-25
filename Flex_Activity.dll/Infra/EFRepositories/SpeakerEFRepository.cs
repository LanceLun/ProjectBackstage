using EFModels.EFModels;
using Flex_Activity.dll.Interface;
using Flex_Activity.dll.Models.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.Entity;
using Flex_Activity.dll.Models.Exts;

namespace Flex_Activity.dll.Infra.EFRepositories
{
    public class SpeakerEFRepository : ISpeakerRepository
    {
        private AppDbContext _db;
        public SpeakerEFRepository()
        {
            _db = new AppDbContext();
        }

        public void CreateSpeaker(SpeakerDetailDto dto)
        {
            var speaker = dto.ToDetailEntity();
            speaker.SpeakerVisible = true;
            _db.Speakers.Add(speaker);
            _db.SaveChanges();
        }

        public void EditSpeaker(SpeakerDetailDto dto)
        {
            Speaker speaker = _db.Speakers.Find(dto.SpeakerId);

            speaker.SpeakerName = dto.SpeakerName;
            speaker.SpeakerPhone = dto.SpeakerPhone;
            speaker.fk_SpeakerFieldId = dto.fk_SpeakerFieldId;
            speaker.fk_SpeakerBranchId = dto.fk_SpeakerBranchId;
            speaker.SpeakerDescription = dto.SpeakerDescription;
            //var speaker = dto.ToDetailEntity();
            speaker.SpeakerVisible = true;
            var result = speaker;
            _db.Entry(speaker).State = EntityState.Modified;
            _db.SaveChanges();



        }


        public void EditSpeakerImg (SpeakerDetailDto dto)
        {
            Speaker speaker = _db.Speakers.Find(dto.SpeakerId);

            speaker.SpeakerImg = dto.SpeakerImg;
            speaker.SpeakerVisible = true;

            var result = speaker;

            _db.Entry(speaker).State = EntityState.Modified;
            _db.SaveChanges();
        }

        public IEnumerable<SpeakerDetailDto> Search()
        {
            return _db.Speakers
                .AsNoTracking()
                .Include(s => s.fk_SpeakerFieldId)
                .Select(s => new SpeakerDetailDto
                {
                    SpeakerId = s.SpeakerId,
                    SpeakerName = s.SpeakerName,
                    FieldName = s.SpeakerField.FieldName
                });
        }
    }
}
