using Dynasty.Domain.Models;

namespace Dynasty.ApplicationService.Queries.User
{
    public class FindUserByEmailQuery : BaseQuery<SystemUserModel>
    {
         public string Email { get; private set; }

        public FindUserByEmailQuery(string email)
        {
            Core.Validation.ThrowIfNullOrEmpty(email, nameof(email));
            Email = email;
        }
    }
}