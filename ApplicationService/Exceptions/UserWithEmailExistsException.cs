using System;

namespace Dynasty.ApplicationService.Exceptions
{
    public class UserWithEmailExistsException : Exception
    {
         public string Email { get; private set; }

        public UserWithEmailExistsException(string email)
            : base($"A user with the email '{email}' already exists.")
        {
            Email = email;
        }
    }
}