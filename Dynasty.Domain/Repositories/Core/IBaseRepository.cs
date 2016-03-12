using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dynasty.Domain.Repositories
{
    interface IBaseRepository<T, TKey>
    {
        T GetObject(TKey key);
        IEnumerable<T> GetObjects(List<TKey> key);

        void Create(T newObject);
        void Create(IEnumerable<T> addedObjects);

        void Update(T updatedObject);
        void Update(IEnumerable<T> updatedObjects);

        void Delete(TKey key);   
        void Delete(IEnumerable<T> keys);
    }
}
