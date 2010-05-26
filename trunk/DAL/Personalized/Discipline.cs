using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using DAL.Utils;

namespace DAL.Personalized
{
    [MetadataType(typeof(DisciplinePersonalization))]
    public partial class Discipline
    {

    }

    public class DisciplinePersonalization
    {
        [LocalizedDisplayName("Name", NameResourceType = typeof(DAL.Resources.Discipline))]
        [Required(ErrorMessageResourceName = "NameRequired", ErrorMessageResourceType = typeof(DAL.Resources.Discipline))]
        public string Name { get; set; }
    }

}
