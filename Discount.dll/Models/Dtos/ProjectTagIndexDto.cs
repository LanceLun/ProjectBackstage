using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;

namespace Discount.dll.Models.Dtos
{
    public class ProjectTagIndexDto
    {
        public int ProjectTagId { get; set; }
        public string ProjectTagName { get; set; }
        public string ProductItems { get; set; }
        public DateTime CreateAt { get; set; }
        public DateTime ModifiedAt { get; set; }
        public bool Status { get; set; }
    }
    public class ProjectTagStatusChangeDto
    {
        public int ProjectTagId { get; set; }
        public bool Status { get; set; }
    }

    public class ProjectTagEditNameDto
    {
        public int ProjectTagId { get; set; }
        public string ProjectTagName { get; set; }
        public bool Status { get; set; }
    }
}
