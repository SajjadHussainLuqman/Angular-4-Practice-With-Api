using CommerceApp.BL.EFramework;
using CommerceApp.DAL.EFramework;
using System.Linq;

namespace CommerceApp.BL.EFramework
{
    public class SalesOrderRepository : GenericRepository<CommerceAppDBEntities, SaleOrder>, ISalesOrderRepository
    {
        
    }
}
