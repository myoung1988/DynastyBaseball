﻿using Dynasty.Domain.Enumerators;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Dynasty.Domain.Repositories.Players
{
    interface IDivision : ILeague
    {
        Division Division { get; set; }
    }
}
