using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using DAL.Utils;

namespace DAL.Personalized
{
    [MetadataType(typeof(VenuePersonalization))]
    public partial class Venue
    {

    }

    public class VenuePersonalization
    {
        [LocalizedDisplayName("Name", NameResourceType = typeof(DAL.Resources.Venue))]
        [Required(ErrorMessageResourceName = "NameRequired", ErrorMessageResourceType = typeof(DAL.Resources.Venue))]
        public string Name { get; set; }

    }

}
