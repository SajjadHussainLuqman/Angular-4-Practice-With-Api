using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebBusiness.Models
{
    public abstract class ModelBase { }

    public class CustomerModel : ModelBase
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
    }

    public class VendorModel : ModelBase
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string PhoneNumber { get; set; }
    }
}