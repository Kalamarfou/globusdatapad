using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.DataAnnotations;
using DAL.Utils;

namespace DAL.Personalized
{
    [MetadataType(typeof(PersonPersonalization))]
    public partial class Person
    {

    }

    public class PersonPersonalization
    {
        [LocalizedDisplayName("FirstName", NameResourceType = typeof(DAL.Resources.Person))]
        [Required(ErrorMessageResourceName = "FirstNameRequired", ErrorMessageResourceType = typeof(DAL.Resources.Person))]
        public string FirstName { get; set; }

        [LocalizedDisplayName("LastName", NameResourceType = typeof(DAL.Resources.Person))]
        [Required(ErrorMessageResourceName = "LastNameRequired", ErrorMessageResourceType = typeof(DAL.Resources.Person))]
        public string LastName { get; set; }

        [LocalizedDisplayName("Email", NameResourceType = typeof(DAL.Resources.Person))]
        [Required(ErrorMessageResourceName = "EmailRequired", ErrorMessageResourceType = typeof(DAL.Resources.Person))]
        public string Email { get; set; }

        [LocalizedDisplayName("Title", NameResourceType = typeof(DAL.Resources.Person))]
        public string Title { get; set; }
    }

}
