using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using DAL.Utils;

namespace DAL
{
    [MetadataType(typeof(EventPersonalization))]
    public partial class Event
    {

    }

    public class EventPersonalization
    {
        [LocalizedDisplayName("Name", NameResourceType = typeof(DAL.Resources.Event))]
        [Required(ErrorMessageResourceName = "NameRequired", ErrorMessageResourceType = typeof(DAL.Resources.Event))]
        public string Name { get; set; }

        [LocalizedDisplayName("StartDate", NameResourceType = typeof(DAL.Resources.Event))]
        [Required(ErrorMessageResourceName = "StartDateRequired", ErrorMessageResourceType = typeof(DAL.Resources.Event))]
        public string StartDate { get; set; }

        [LocalizedDisplayName("EndDate", NameResourceType = typeof(DAL.Resources.Event))]
        [Required(ErrorMessageResourceName = "EndDateRequired", ErrorMessageResourceType = typeof(DAL.Resources.Event))]
        public string EndDate { get; set; }

        [LocalizedDisplayName("Description", NameResourceType = typeof(DAL.Resources.Event))]
        [Required(ErrorMessageResourceName = "DescriptionRequired", ErrorMessageResourceType = typeof(DAL.Resources.Event))]
        public string Description { get; set; }
    }

}
