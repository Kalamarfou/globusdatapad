using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using DAL.Utils;

namespace DAL.Personalized
{
    [MetadataType(typeof(ClassPersonalization))]
    public partial class Class
    {

    }

    public class ClassPersonalization
    {
        [LocalizedDisplayName("Name", NameResourceType = typeof(DAL.Resources.Class))]
        [Required(ErrorMessageResourceName = "NameRequired", ErrorMessageResourceType = typeof(DAL.Resources.Class))]
        public string Name { get; set; }
    }

}
