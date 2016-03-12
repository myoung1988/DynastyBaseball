using Dynasty.Domain.Models;
using Dynasty.Core;
using Dynasty.ApplicationService.Commands;

namespace Dynasty.Commands.User
{
    public class CreateUserCommand : ICommand
    {
        public CreateUserCommand(string email, int leagueId, string firstName, string lastName, SystemUserModel creator)
        {
            Core.Validation.ThrowIfNullOrEmpty(email, nameof(email));
            Core.Validation.ThrowIfLessThan(leagueId, -1, nameof(leagueId));
            Core.Validation.ThrowIfNullOrEmpty(firstName, nameof(firstName));
            Core.Validation.ThrowIfNullOrEmpty(lastName, nameof(lastName));
            Core.Validation.ThrowIfNull(creator, nameof(creator));

            Email = email;
            LeagueId = leagueId;
            FirstName = firstName;
            LastName = lastName;

        }

        public string Email { get; private set; }
        public int LeagueId { get; private set; }
        public string FirstName { get; private set; }
        public string LastName { get; private set; }
        public SystemUserModel Creator { get; private set; }
    }
} 