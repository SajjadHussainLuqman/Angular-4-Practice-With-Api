using CommerceApp.DAL.EFramework;
using System.Linq;

namespace CommerceApp.BL.EFramework
{
    public class BrandRepository : GenericRepository<CommerceAppDBEntities, Brand>, IBrandRepository
    {
        public Brand GetSingle(int Id)
        {
            var query = GetAll().FirstOrDefault(x => x.BrandId == Id);
            return query;
        }
    }
}
