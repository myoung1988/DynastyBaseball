using System.Threading.Tasks;
using Dynasty.ApplicationService.Queries;
using Dynasty.ApplicationService.Queries.User;
using Dynasty.Domain.Models;
using Dynasty.Domain.Repositories;

namespace Dynasty.ApplicationService
{
    public class UserQueryService :
        IQueryHandler<GetAllUsersQuery>,
        IQueryHandler<FindUserByEmailQuery>
    {
        private readonly IUserRepository _userRepository;

        public UserQueryService(IUserRepository studentRepository)
        {
            Core.Validation.ThrowIfNull(studentRepository, nameof(studentRepository));
            _userRepository = studentRepository;
        }
        public async Task<GetAllUsersQuery> HandleAsync(GetAllUsersQuery query)
        {
            Core.Validation.ThrowIfNull(query, nameof(query));
            var students = await _userRepository.GetAsync();
            query.SetResult(students);
            return query;
        }

        public async Task<FindUserByEmailQuery> HandleAsync(FindUserByEmailQuery query)
        {
            Core.Validation.ThrowIfNull(query, nameof(query));
            var student = await _userRepository.FindByEmailAsync(query.Email);
            query.SetResult(student);
            return query;
        }
    }
}