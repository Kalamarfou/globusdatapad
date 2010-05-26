using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using DAL.Utils;

namespace DAL.Personalized
{
    [MetadataType(typeof(UserPersonalization))]
    public partial class User
    {

    }

    public class UserPersonalization
    {
        [LocalizedDisplayName("Username", NameResourceType = typeof(DAL.Resources.User))]
        [Required(ErrorMessageResourceName = "UsernameRequired", ErrorMessageResourceType = typeof(DAL.Resources.User))]
        public string Username { get; set; }

        [LocalizedDisplayName("Password", NameResourceType = typeof(DAL.Resources.User))]
        [Required(ErrorMessageResourceName = "PasswordRequired", ErrorMessageResourceType = typeof(DAL.Resources.User))]
        public string Password { get; set; }
    }

}
