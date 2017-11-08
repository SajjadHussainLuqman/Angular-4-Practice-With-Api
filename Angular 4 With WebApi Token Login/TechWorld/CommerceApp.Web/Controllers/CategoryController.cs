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

namespace CommerceApp.Web.Controllers
{
 
    //[Authorize]
    public class CategoryController : ApiController
    {
        CategoryRepository repCategory;

        public CategoryController()
        {
            repCategory = new CategoryRepository();
        }

        public IHttpActionResult Get()
        {
            try
            {
                return Ok(repCategory.GetAll().ToList());
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
                var entity = repCategory.GetSingle(id);
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
                repCategory.AddSave(BE);
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
                Category be = repCategory.GetSingle(id);
                if (be == null)
                {
                    return Content(HttpStatusCode.NotFound,
                        "Category with Id = " + id.ToString() + " not found to delete");
                }
                else
                {
                    repCategory.DeleteSave(be);
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
                Category be = repCategory.GetSingle(_be.CategoryId);
                if (be == null)
                {
                    return Content(HttpStatusCode.NotFound,
                            "Category with Id " + _be.CategoryId.ToString() + " not found to update");
                }
                else
                {
                    be.Name = _be.Name;
                    be.IsActive = _be.IsActive;
                    repCategory.EditSave(be);
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
