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
    public class ProductController : ApiController
    {
        ProductRepository repProduct;

        public ProductController()
        {
            repProduct = new ProductRepository();
        }

        public IHttpActionResult Get()
        {
            try
            {
                return Ok(repProduct.GetAll().ToList());
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
                var entity = repProduct.GetSingle(id);
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

        public IHttpActionResult Post([FromBody]Product BE)
        {
            try
            {
                repProduct.AddSave(BE);
                var LocationUrl = new Uri(Request.RequestUri + BE.ProductId.ToString());
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
                Product be = repProduct.GetSingle(id);
                if (be == null)
                {
                    return Content(HttpStatusCode.NotFound,
                        "Product with Id = " + id.ToString() + " not found to delete");
                }
                else
                {
                    repProduct.DeleteSave(be);
                    return Content(HttpStatusCode.OK, be);
                }

            }
            catch (Exception ex)
            {
                return Content(HttpStatusCode.BadRequest, ex);
            }
        }

        [HttpPut]
        public IHttpActionResult Put(Product _be)
        {
            try
            {
                Product be = repProduct.GetSingle(_be.ProductId);
                if (be == null)
                {
                    return Content(HttpStatusCode.NotFound,
                            "Product with Id " + _be.ProductId.ToString() + " not found to update");
                }
                else
                {
                    be.Name = _be.Name;
                    be.IsActive = _be.IsActive;
                    repProduct.EditSave(be);
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
