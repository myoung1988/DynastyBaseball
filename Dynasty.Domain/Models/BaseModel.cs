using Dynasty.Domain.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dynasty.Domain.Models
{
    public abstract class BaseModel
    {
        public bool IsUpdated { get; set; }
        public SystemUserModel UpdateBy { get; set; }
        public DateTime UpdatedDate { get; set; }
    }
}
