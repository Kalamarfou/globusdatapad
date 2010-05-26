using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using DAL.Utils;

namespace DAL.Personalized
{
    [MetadataType(typeof(CursusPersonalization))]
    public partial class Cursus
    {

    }

    public class CursusPersonalization
    {
        [LocalizedDisplayName("Name", NameResourceType = typeof(DAL.Resources.Cursus))]
        [Required(ErrorMessageResourceName = "NameRequired", ErrorMessageResourceType = typeof(DAL.Resources.Cursus))]
        public string Name { get; set; }
    }

}
