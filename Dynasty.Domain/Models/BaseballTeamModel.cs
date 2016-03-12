using Dynasty.Domain.Repositories.Players;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Dynasty.Domain.Enumerators;
using Dynasty.Domain.Repositories;

namespace Dynasty.Domain.Models
{
    class BaseballTeamModel : BaseModel, ITeam, IBaseRepository<BaseballTeamModel, int>
    {
        private string _abbreviation;
        private string _city;
        private Division _division;
        private League _league;
        private string _logo;
        private string _team;

        public string Abbreviation
        {
            get { return _abbreviation; }
            set { _abbreviation = value; }
        }

        public string City
        {
            get { return _city; }
            set { _city = value; }
        }

        public Division Division
        {
            get { return _division; }
            set { _division = value; }
        }

        public League League
        {
            get { return _league; }
            set { _league = value; }
        }

        public string Logo
        {
            get { return _logo; }
            set { _logo = value; }
        }

        public Organization Organization
        {
            get { return Enumerators.Organization.MLB; }
        }

        public string Team
        {
            get { return _team; }
            set { _team = value; }
        }

        public void Create(IEnumerable<BaseballTeamModel> addedObjects)
        {
            throw new NotImplementedException();
        }

        public void Create(BaseballTeamModel newObject)
        {
            throw new NotImplementedException();
        }

        public void Delete(IEnumerable<BaseballTeamModel> keys)
        {
            throw new NotImplementedException();
        }

        public void Delete(int key)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<BaseballTeamModel> GetObjects(List<int> organizationId)
        {
            throw new NotImplementedException();
        }

        public BaseballTeamModel GetObject(int key)
        {
            throw new NotImplementedException();
        }

        public void Update(IEnumerable<BaseballTeamModel> updatedObjects)
        {
            throw new NotImplementedException();
        }

        public void Update(BaseballTeamModel updatedObject)
        {
            throw new NotImplementedException();
        }
    }
}
