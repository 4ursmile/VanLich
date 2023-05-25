namespace VanLichAPI.Services
{
    public interface IModelServices<T>
    {
        public Task<List<T>> GetAllAsync(int top);
        public Task<T> GetAsync(string id);
        public Task CreateAsync(T user);
        public Task UpdateAsync(string id, T userIn);
        public Task RemoveAsync(string id);

    }
}