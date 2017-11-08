using CommerceApp.DAL.EFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

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
