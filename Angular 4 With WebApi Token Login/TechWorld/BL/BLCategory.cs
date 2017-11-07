using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DALEntityFramework;

namespace BL
{
    public class BLCategory
    {
        public List<Category> Get()
        {
            try
            {
                using (var obj = new BusinessDBEntities())
                {
                    return obj.Categories.ToList();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public Category GetById(int Id)
        {
            try
            {
                using (var obj = new BusinessDBEntities())
                {
                    return obj.Categories.FirstOrDefault(e => e.CategoryId == Id);
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }
            
        }
        public Category GetByName(string name)
        {
            try
            {
                using (var obj = new BusinessDBEntities())
                {
                    return obj.Categories.FirstOrDefault(e => e.Name==name);
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }

        }
        public Category Save(Category BE)
        {
            try
            {
                using (var obj = new BusinessDBEntities())
                {
                    obj.Categories.Add(BE);
                    obj.SaveChanges();
                    return BE;
                }
            }
            catch (Exception)
            {
                return BE;
            }
        }
        public void Delete(int id)
        {
            try
            {
                using (var obj = new BusinessDBEntities())
                {
                    obj.Categories.Remove(obj.Categories.FirstOrDefault(e => e.CategoryId == id));
                    obj.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            
        }
        public Category Update(Category BE)
        {
            try
            {
                using (var obj = new BusinessDBEntities())
                {
                    var entity = obj.Categories.FirstOrDefault(e => e.CategoryId == BE.CategoryId);
                    entity.IsActive = BE.IsActive;
                    entity.Name = BE.Name;
                    obj.SaveChanges();
                    return entity;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
