using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dynasty.Domain.Enumerators;

namespace Dynasty.Domain.Models
{
    public class SystemUserModel
    {
        public new int Id { get; private set; }
        public string FirstName { get; private set; }
        public string LastName { get; private set; }
        public string FullName => $"{FirstName} {LastName}";
        public string Email { get; private set; }
        public UserRole Role { get; private set; }

        public static SystemUserModel Create(int id, string firstName, string lastName, string email, UserRole role)
        {
            return new SystemUserModel()
            {
                Id = id,
                Email = email,
                FirstName = firstName,
                LastName = lastName,
                Role = role
            };
        }
    }
}
