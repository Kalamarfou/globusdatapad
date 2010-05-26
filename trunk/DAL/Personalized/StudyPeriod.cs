using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using DAL.Utils;

namespace DAL.Personalized
{
    [MetadataType(typeof(StudyPeriodPersonalization))]
    public partial class StudyPeriod
    {

    }

    public class StudyPeriodPersonalization
    {
        [LocalizedDisplayName("Name", NameResourceType = typeof(DAL.Resources.StudyPeriod))]
        [Required(ErrorMessageResourceName = "NameRequired", ErrorMessageResourceType = typeof(DAL.Resources.StudyPeriod))]
        public string Name { get; set; }

        [LocalizedDisplayName("StartDate", NameResourceType = typeof(DAL.Resources.StudyPeriod))]
        [Required(ErrorMessageResourceName = "StartDateRequired", ErrorMessageResourceType = typeof(DAL.Resources.StudyPeriod))]
        public string StartDate { get; set; }

        [LocalizedDisplayName("EndDate", NameResourceType = typeof(DAL.Resources.StudyPeriod))]
        [Required(ErrorMessageResourceName = "EndDateRequired", ErrorMessageResourceType = typeof(DAL.Resources.StudyPeriod))]
        public string EndDate { get; set; }
    }

}
