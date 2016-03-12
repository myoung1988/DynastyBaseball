using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dynasty.Domain.Models;

namespace Dynasty.Domain.Repositories
{
    public interface IUserRepository
    {
        void Add(SystemUserModel user);
        Task<SystemUserModel> FindByIdAsync(int id);
        Task<SystemUserModel> FindByLeagueIdAsync(string leagueId);
        Task<SystemUserModel> FindByEmailAsync(string email);
        Task<IEnumerable<SystemUserModel>> GetAsync();
        Task SaveChangesAsync();

    }
}
