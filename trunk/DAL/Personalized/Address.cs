using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel;
using DAL.Utils;

namespace DAL
{
    [MetadataType(typeof(AddressPersonalization))]
    public partial class Address
    {

    }

    public class AddressPersonalization
    {
        [LocalizedDisplayName("Street", NameResourceType = typeof(DAL.Resources.Address))]
        [Required(ErrorMessageResourceName = "StreetRequired", ErrorMessageResourceType = typeof(DAL.Resources.Address))]
        public string Street { get; set; }

        [LocalizedDisplayName("PostalCode", NameResourceType = typeof(DAL.Resources.Address))]
        public string PostalCode { get; set; }

        [LocalizedDisplayName("City", NameResourceType = typeof(DAL.Resources.Address))]
        [Required(ErrorMessageResourceName = "CityRequired", ErrorMessageResourceType = typeof(DAL.Resources.Address))]
        public string City { get; set; }

        [LocalizedDisplayName("Country", NameResourceType = typeof(DAL.Resources.Address))]
        [Required(ErrorMessageResourceName = "CountryRequired", ErrorMessageResourceType = typeof(DAL.Resources.Address))]
        public string Country { get; set; }
    }
}