using CommerceApp.DAL.EFramework;
using System.Linq;

namespace CommerceApp.BL.EFramework
{
    public class CategoryRepository : GenericRepository<CommerceAppDBEntities, Category>, ICategoryRepository
    {
        public Category GetSingle(int CategoryId)
        {
            var query = GetAll().FirstOrDefault(x => x.CategoryId == CategoryId);
            return query;
        }
    }
}
