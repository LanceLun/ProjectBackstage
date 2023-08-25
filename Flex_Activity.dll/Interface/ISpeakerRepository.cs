using Flex_Activity.dll.Models.Dto;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Flex_Activity.dll.Interface
{
    public interface ISpeakerRepository
    {
        IEnumerable<SpeakerDetailDto> Search();

        void CreateSpeaker(SpeakerDetailDto dto);

        void EditSpeaker(SpeakerDetailDto dto);


		void EditSpeakerImg(SpeakerDetailDto dto);

	}
}
