using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using DAL.Utils;

namespace DAL
{
    [MetadataType(typeof(AvailabilityPersonalization))]
    public partial class Availability
    {

    }

    public class AvailabilityPersonalization
    {
        [LocalizedDisplayName("StartDate", NameResourceType = typeof(DAL.Resources.Availability))]
        [Required(ErrorMessageResourceName = "StartDateRequired", ErrorMessageResourceType = typeof(DAL.Resources.Availability))]
        public string StartDate { get; set; }

        [LocalizedDisplayName("EndDate", NameResourceType = typeof(DAL.Resources.Availability))]
        [Required(ErrorMessageResourceName = "EndDateRequired", ErrorMessageResourceType = typeof(DAL.Resources.Availability))]
        public string EndDate { get; set; }

    }

}
