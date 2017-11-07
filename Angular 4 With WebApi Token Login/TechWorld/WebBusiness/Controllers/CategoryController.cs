using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using DALEntityFramework;
using BL;
using Newtonsoft.Json;
using System.Text;

namespace WebBusiness.Controllers
{
 
    public class CategoryController : ApiController
    {
        public IHttpActionResult Get()
        {
            try
            {
                return Ok(new BLCategory().Get());
            }
            catch (Exception ex)
            {
                return BadRequest(ex.InnerException.Message);
            }
        }

        public IHttpActionResult GetById(int id)
        {
            try
            {
                var entity = new BLCategory().GetById(id);
                if (entity != null)
                {
                    return Ok(entity);
                }
                else
                {
                    return NotFound();
                }
            }
            catch (Exception ex)
            {
                return BadRequest(ex.InnerException.Message);
            }
        }

        public IHttpActionResult Post([FromBody]Category BE)
        {
            try
            {
                BE = new BLCategory().Save(BE);
                var LocationUrl = new Uri(Request.RequestUri + BE.CategoryId.ToString());
                return Created(LocationUrl, BE);

            }
            catch (Exception ex)
            {
                return BadRequest();
            }
        }

        public IHttpActionResult Delete(int id)
        {
            try
            {
                Category be = new BLCategory().GetById(id);
                if (be == null)
                {
                    return Content(HttpStatusCode.NotFound,
                        "Category with Id = " + id.ToString() + " not found to delete");
                }
                else
                {
                    new BLCategory().Delete(id);
                    return Content(HttpStatusCode.OK, be);
                }

            }
            catch (Exception ex)
            {
                return Content(HttpStatusCode.BadRequest, ex);
            }
        }

        [HttpPut]
        public IHttpActionResult Put(Category _be)
        {
            try
            {
                Category be = new BLCategory().GetById(_be.CategoryId);
                if (be == null)
                {
                    return Content(HttpStatusCode.NotFound,
                            "Category with Id " + _be.CategoryId.ToString() + " not found to update");
                }
                else
                {
                    new BLCategory().Update(_be);
                    return Content(HttpStatusCode.OK, be);
                }

            }
            catch (Exception ex)
            {
                return Content(HttpStatusCode.BadRequest, ex);
            }
        }
    }
}
