using CommerceApp.DAL.EFramework;

namespace CommerceApp.BL.EFramework
{
    public interface IProductRepository : IGenericRepository<Product>
    {
        Product GetSingle(int Id);
    }
}
