using System.Threading.Tasks;
using Dynasty.ApplicationService;
using Dynasty.Domain.Models;
using Dynasty.Domain.Repositories;
using Dynasty.ApplicationService.Commands;
using Dynasty.Commands.User;
using Dynasty.ApplicationService.Exceptions;

namespace Dynasty.ApplicationService
{
    public class UserCommandService :
        ICommandHandler<CreateUserCommand>
    {
        private readonly IUserRepository _userRepository;

        public UserCommandService(IUserRepository userRepository)
        {
            Core.Validation.ThrowIfNull(userRepository, nameof(userRepository));
            _userRepository = userRepository;
        }
        public async Task HandleAsync(CreateUserCommand command)
        {
            var student = await _userRepository.FindByEmailAsync(command.Email);
            if (null != student)
            {
                throw new UserWithEmailExistsException(command.Email);
            }

            student = SystemUserModel.Create(command.LeagueId, command.Email, command.FirstName, command.LastName, command.Creator.Role);
            _userRepository.Add(student);

            await _userRepository.SaveChangesAsync();
        }
    }
}