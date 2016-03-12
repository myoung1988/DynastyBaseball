using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dynasty.Domain.Repositories.Players
{
    interface IPlayerStats<IStat> : IBaseRepository<IStat, int>
    {
        DateTime Date { get; set; }
        string Season { get; set; }
        IStat Stat { get; set; }
    }
}
