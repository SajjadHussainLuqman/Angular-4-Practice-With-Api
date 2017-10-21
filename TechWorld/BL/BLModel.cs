using System;
using System.Collections.Generic;
using System.Linq;
using DALEntityFramework;

namespace BL
{
   public class BLModel
    {
        public List<Model> Get()
        {
            try
            {
                using (var obj = new BusinessDBEntities())
                {
                    return obj.Models.ToList();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        public bool Save(Model BE)
        {
            try
            {
                using (var obj = new BusinessDBEntities())
                {
                    obj.Models.Add(BE);
                    obj.SaveChanges();
                    return true;
                }
            }
            catch (Exception)
            {
                return true;
            }
        }
    }
}
