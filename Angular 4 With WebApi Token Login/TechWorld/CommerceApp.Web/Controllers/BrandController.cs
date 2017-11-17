using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using CommerceApp.DAL.EFramework;
using CommerceApp.BL.EFramework;

namespace WebBusiness.Controllers
{
    public class BrandController : ApiController
    {
        BrandRepository repBrand;

        public BrandController()
        {
            repBrand = new BrandRepository();
        }

        public IHttpActionResult Get()
        {
            try
            {
                return Ok(repBrand.GetAll().ToList());
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
                var entity = repBrand.GetSingle(id);
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

        public IHttpActionResult Post([FromBody]Brand BE)
        {
            try
            {
                repBrand.AddSave(BE);
                var LocationUrl = new Uri(Request.RequestUri + BE.BrandId.ToString());
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
                Brand be = repBrand.GetSingle(id);
                if (be == null)
                {
                    return Content(HttpStatusCode.NotFound,
                        "Brand with Id = " + id.ToString() + " not found to delete");
                }
                else
                {
                    repBrand.DeleteSave(be);
                    return Content(HttpStatusCode.OK, be);
                }

            }
            catch (Exception ex)
            {
                return Content(HttpStatusCode.BadRequest, ex);
            }
        }

        [HttpPut]
        public IHttpActionResult Put(Brand _be)
        {
            try
            {
                Brand be = repBrand.GetSingle(_be.BrandId);
                if (be == null)
                {
                    return Content(HttpStatusCode.NotFound,
                            "Brand with Id " + _be.BrandId.ToString() + " not found to update");
                }
                else
                {
                    be.Name = _be.Name;
                    be.IsActive = _be.IsActive;
                    repBrand.EditSave(be);
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
