using CommerceApp.BL.EFramework;
using CommerceApp.DAL.EFramework;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CommerceApp.BL.EFramework
{
    public class SaleItemRepository : GenericRepository<CommerceAppDBEntities, SaleItem>, ISaleItemRepository
    {


    }
}
