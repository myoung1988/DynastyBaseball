using Dynasty.Domain.Enumerators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dynasty.Domain.Repositories.Players
{
    interface ITeam : IDivision
    {
        string Team { get; set; }
        string Abbreviation { get; set; }
        string City { get; set; }
        string Logo { get; set; }
    }
}
