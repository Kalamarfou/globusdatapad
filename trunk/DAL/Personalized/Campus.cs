using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using DAL.Utils;

namespace DAL
{
    [MetadataType(typeof(CampusPersonalization))]
    public partial class Campus
    {

    }

    public class CampusPersonalization
    {
        [Required(ErrorMessageResourceName = "NameRequired", ErrorMessageResourceType = typeof(DAL.Resources.Campus))]
        [LocalizedDisplayName("Name", NameResourceType = typeof(DAL.Resources.Campus))]
        public string Name { get; set; }
    }
}
