
using System.Linq;
using CommerceApp.DAL.EFramework;

namespace CommerceApp.BL.EFramework
{
    public class ProductRepository : GenericRepository<CommerceAppDBEntities, Product>, IProductRepository
    {
        public Product GetSingle(int Id)
        {
            var query = GetAll().FirstOrDefault(x => x.ProductId == Id);
            return query;
        }
    }
}
