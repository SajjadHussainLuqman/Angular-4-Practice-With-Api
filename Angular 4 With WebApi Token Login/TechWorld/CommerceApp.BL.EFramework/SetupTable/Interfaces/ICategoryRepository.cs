using CommerceApp.DAL.EFramework;

namespace CommerceApp.BL.EFramework
{
    public interface ICategoryRepository : IGenericRepository<Category>
    {
        Category GetSingle(int Id);
    }
}
