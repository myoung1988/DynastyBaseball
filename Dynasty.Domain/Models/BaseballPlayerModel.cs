using Dynasty.Domain.Enumerators;
using System;
using System.Collections.Generic;
using Dynasty.Domain.Repositories.Players;

namespace Dynasty.Domain.Models
{
    class BaseballPlayerModel : BaseModel, IPlayerRepository
    {
        private BaseballTeamModel _team;

        public int PlayerID { get; set; }
        public int Age
        {
            get
            {
                throw new NotImplementedException();
            }
        }

        public DateTime Birthdate { get; set; }
        public string FirstName { get; set; }
        public string FullName 
        {
            get
            {
                throw new NotImplementedException();
            }
        }
        public string LastName { get; set; }
     
        BattingStance Batting { get; set; }
        ThrowingHand Throwing { get; set; }

        public List<IPlayerStats<IStat>> Stats
        {
            get
            {
                throw new NotImplementedException();
            }
        }

        List<IPlayerStats<IStat>> IPlayerRepository.Stats
        {
            get
            {
                throw new NotImplementedException();
            }
        }

        public ITeam Team
        {
            get { return _team; }
            set { _team = (BaseballTeamModel)value; }
        }

        public BaseballPlayerModel()
        {

        }

        public BaseballPlayerModel(int loadedByID)
        {

        }

        public IPlayerRepository GetObject(int key)
        {
            throw new NotImplementedException();
        }

        public void Create(IPlayerRepository newObject)
        {
            throw new NotImplementedException();
        }

        public void Create(IEnumerable<IPlayerRepository> addedObjects)
        {
            throw new NotImplementedException();
        }

        public void Update(IPlayerRepository updatedObject)
        {
            throw new NotImplementedException();
        }

        public void Update(IEnumerable<IPlayerRepository> updatedObjects)
        {
            throw new NotImplementedException();
        }

        public void Delete(int key)
        {
            throw new NotImplementedException();
        }

        public void Delete(IEnumerable<IPlayerRepository> keys)
        {
            throw new NotImplementedException();
        }

        public List<IStat> FindStatsBySeason(string season)
        {
            throw new NotImplementedException();
        }

        public List<IStat> FindStatsByDates(List<DateTime> dates)
        {
            throw new NotImplementedException();
        }

        List<IPlayerStats<IStat>> IPlayerRepository.FindStatsBySeason(string season)
        {
            throw new NotImplementedException();
        }

        List<IPlayerStats<IStat>> IPlayerRepository.FindStatsByDates(List<DateTime> dates)
        {
            throw new NotImplementedException();
        }

        public IEnumerable<IPlayerRepository> GetObjects(List<int> key)
        {
            throw new NotImplementedException();
        }
    }
}
