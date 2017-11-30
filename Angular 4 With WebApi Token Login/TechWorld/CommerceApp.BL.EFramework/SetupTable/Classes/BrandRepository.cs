using CommerceApp.DAL.EFramework;
using System.Collections.Generic;
using System.Linq;

namespace CommerceApp.BL.EFramework
{
    public class BrandRepository : GenericRepository<CommerceAppDBEntities, Brand>, IBrandRepository
    {
        public Brand GetSingle(int Id)
        {
            var query = Context.Brands.FirstOrDefault(x => x.BrandId == Id);
            return query;
        }

        public List<Brand_Get> BrandGet()
        {
            using (var obj=new CommerceAppDBEntities())
            {
              return  obj.usp_Brand_Get().ToList();
            }
        }

        public Brand_Get BrandGetById(int Id)
        {
            using (var obj = new CommerceAppDBEntities())
            {
              return   obj.usp_Brand_Get().FirstOrDefault(x=>x.BrandId==Id);
            }
        }

    }
}
