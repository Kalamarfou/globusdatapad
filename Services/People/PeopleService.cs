using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Services.Campus;

namespace Services.People
{
    class PeopleService : IPeopleService
    {
        private DAL.GDPEntities db;

        public void createAvailability(DAL.Availability a, string authorId)
        {
            DAL.Utils.GenericCrud.SetFirstAudit(a.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Create(a);
        }

        public void updateAvailability(DAL.Availability a, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(a.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Update(a);
        }

        public DAL.Availability getAvailabilityById(int id)
        {
            return db.Availabilities.First(a => a.Id == id && a.Common.IsDeleted == false);
        }

        public List<DAL.Availability> getAvailabilitiesForUser(int id, DateTime startDate, DateTime endDate, int pageNum, int pageSize, out int totalRecords)
        {
            ISecurityService secService = new SecurityService();
            DAL.User user = secService.getUserById(id);

            if (user != null)
            {
                var result = (from a in user.Availabilities
                              where a.StartDate >= startDate && a.EndDate >= endDate && a.Common.IsDeleted == false
                              select a);
                totalRecords = result.Count();
                return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Availability>();
            }
            else
            {
                throw new ApplicationException("User " + id + " does not exist.");
            }
        }

        public List<DAL.Availability> getAvailabilitiesForUser(int id, int pageNum, int pageSize, out int totalRecords)
        {
            return getAvailabilitiesForUser(id, new DateTime(1980, 1, 1), new DateTime(2050, 1, 1), pageNum, pageSize, out totalRecords);
        }

        public List<DAL.Availability> getAvailablePeopleForCampus(int campusId, DateTime startDate, DateTime endDate, int pageNum, int pageSize, out int totalRecords)
        {
            //GUILLAUME //TODO //DUR C'es ttrop dur ... La ça devrais marcher, mais ça dois envoyer un nombre de requetes impressionant.
            ICampusService campusService = new CampusService();

            var result = (from a in db.Availabilities
                          where a.StartDate >= startDate && a.EndDate >= endDate  
                          && a.User.StakeholderCampuses.Contains(campusService.GetById(campusId)) 
                          && a.Common.IsDeleted == false
                          select a);
            totalRecords = result.Count();
            return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Availability>();
        }

        public List<DAL.Availability> getAvailablePeopleForCampus(int id, int pageNum, int pageSize, out int totalRecords)
        {
            return getAvailablePeopleForCampus(id, new DateTime(1980, 1, 1), new DateTime(2050, 1, 1), pageNum, pageSize, out totalRecords);
        }

        public void deleteAvailability(DAL.Availability a, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(a.Common.Audit, authorId);
            a.Common.IsDeleted = true;

            DAL.Utils.GenericCrud.Update(a);
        }
    }
}
