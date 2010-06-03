using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using DAL.Utils;

namespace DAL
{
    [MetadataType(typeof(aseTypePersonalization))]
    public partial class BaseType
    {

    }

    public class aseTypePersonalization
    {
        [LocalizedDisplayName("Name", NameResourceType = typeof(DAL.Resources.BaseType))]
        [Required(ErrorMessageResourceName = "NameRequired", ErrorMessageResourceType = typeof(DAL.Resources.BaseType))]
        public string Name { get; set; }
    }

}
