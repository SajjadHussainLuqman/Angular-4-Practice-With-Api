using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Newtonsoft.Json;
using System.Text;
using CommerceApp.DAL.EFramework;
using CommerceApp.BL.EFramework;

namespace WebBusiness.Controllers
{
    public class SalesOrderController : ApiController
    {
        ISalesOrderRepository rep;

        public SalesOrderController()
        {
            rep = new SalesOrderRepository();
        }

        public IHttpActionResult Get()
        {
            try
            {
                return Ok(rep.GetAll().ToList());
            }
            catch (Exception ex)
            {
                return BadRequest(ex.InnerException.Message);
            }
        }
        

        public IHttpActionResult Post([FromBody]SaleOrder BE)
        {
            try
            {
                rep.AddSave(BE);
                var LocationUrl = new Uri(Request.RequestUri + BE.SaleId.ToString());
                return Created(LocationUrl, BE);

            }
            catch (Exception ex)
            {
                return BadRequest();
            }
        }
        
    }
}
