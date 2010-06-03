using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using DAL.Utils;

namespace DAL
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

        [LocalizedDisplayName("FirstName", NameResourceType = typeof(DAL.Resources.User))]
        [Required(ErrorMessageResourceName = "FirstNameRequired", ErrorMessageResourceType = typeof(DAL.Resources.User))]
        public string FirstName { get; set; }

        [LocalizedDisplayName("LastName", NameResourceType = typeof(DAL.Resources.User))]
        [Required(ErrorMessageResourceName = "LastNameRequired", ErrorMessageResourceType = typeof(DAL.Resources.User))]
        public string LastName { get; set; }

        [LocalizedDisplayName("Email", NameResourceType = typeof(DAL.Resources.User))]
        [Required(ErrorMessageResourceName = "EmailRequired", ErrorMessageResourceType = typeof(DAL.Resources.User))]
        [EmailAddressAttribute(ErrorMessageResourceName = "InvalidEmailAddress", ErrorMessageResourceType = typeof(DAL.Resources.User))]
        public string Email { get; set; }

        [LocalizedDisplayName("Title", NameResourceType = typeof(DAL.Resources.User))]
        public string Title { get; set; }
    }

}
