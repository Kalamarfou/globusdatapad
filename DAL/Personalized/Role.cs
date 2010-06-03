using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using DAL.Utils;

namespace DAL
{
    [MetadataType(typeof(RolePersonalization))]
    public partial class Role
    {

    }

    public class RolePersonalization
    {
        [LocalizedDisplayName("Name", NameResourceType = typeof(DAL.Resources.Role))]
        [Required(ErrorMessageResourceName = "NameRequired", ErrorMessageResourceType = typeof(DAL.Resources.Role))]
        public string Name { get; set; }

        [LocalizedDisplayName("ShortName", NameResourceType = typeof(DAL.Resources.Role))]
        [Required(ErrorMessageResourceName = "ShortNameRequired", ErrorMessageResourceType = typeof(DAL.Resources.Role))]
        public string ShortName { get; set; }
    }

}
