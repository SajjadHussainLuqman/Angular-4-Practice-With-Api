using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CommerceApp.DAL.EFramework
{
    public abstract class GenericRepository<C, T> : IDisposable,
      IGenericRepository<T> where T : class where C : DbContext, new()
    {

        private C _entities = new C();
        public C Context
        {

            get { return _entities; }
            set { _entities = value; }
        }

        public virtual IQueryable<T> GetAll()
        {
            IQueryable<T> query = _entities.Set<T>();
            return query;
        }
        
        public IQueryable<T> FindBy(System.Linq.Expressions.Expression<Func<T, bool>> predicate)
        {

            IQueryable<T> query = _entities.Set<T>().Where(predicate);
            return query;
        }

        public virtual void Add(T entity)
        {
            _entities.Set<T>().Add(entity);
        }

        public virtual void Delete(T entity)
        {
            _entities.Set<T>().Remove(entity);
        }

        public virtual void Edit(T entity)
        {
            _entities.Entry(entity).State = EntityState.Modified;
        }

        public virtual void AddSave(T entity)
        {
            _entities.Set<T>().Add(entity);
            Save();
        }

        public virtual void DeleteSave(T entity)
        {
            _entities.Set<T>().Remove(entity);
            Save();
        }

        public virtual void EditSave(T entity)
        {
            _entities.Entry(entity).State = EntityState.Modified;
            Save();
        }

        public virtual void Save()
        {
            _entities.SaveChanges();
        }

        public void Dispose()
        {
            this.Dispose();
        }
    }
}
