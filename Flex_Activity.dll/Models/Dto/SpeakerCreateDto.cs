using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Flex_Activity.dll.Models.Dto
{
    public class SpeakerCreateDto
    {

        public int SpeakerId { get; set; }

   
        public string SpeakerName { get; set; }

      
        public string SpeakerPhone { get; set; }

      
        public int fk_SpeakerFieldId { get; set; }
     
   
        public string SpeakerImg { get; set; }

       
        public int? fk_SpeakerBranchId { get; set; }

      
        public string SpeakerDescription { get; set; }
    }
}
