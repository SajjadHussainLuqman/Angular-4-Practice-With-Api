using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DALEntityFramework;
using BL;

namespace WebBusiness.Controllers
{
    public class BrandModelController : ApiController
    {
        public List<Model> Get()
        {
            return new BLModel().Get();
        }
    }
}
