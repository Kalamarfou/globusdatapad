using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Services.Campus;
using DAL;

namespace Services.People
{
    public class PeopleService : IPeopleService
    {

        public void createAvailability(DAL.Availability a, string authorId)
        {
            ISecurityService service = new SecurityService();
            DAL.User user = service.getUserByUsername(authorId);
            a.UserId = user.Id;
            a.PersonId = a.UserId;
            //TODO
            //a.User = user;
            DAL.Utils.GenericCrud.SetAudit(a.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Create(a);
        }

        public void updateAvailability(DAL.Availability a, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(a.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Update(a);
        }

        public DAL.Availability getAvailabilityById(int id)
        {
            using (GDPEntities db = new GDPEntities())
            {
                return db.Availabilities.First(a => a.Id == id && a.Common.IsDeleted == false);
            }
        }

        public List<DAL.Availability> getAvailabilitiesForUser(string username, DateTime startDate, DateTime endDate, int pageNum, int pageSize, out int totalRecords)
        {
            ISecurityService secService = new SecurityService();
            DAL.User user = secService.getUserByUsername(username);

            using (GDPEntities db = new GDPEntities())
            {
                if (user != null)
                {
                    var result = (from a in db.Availabilities
                                  where a.StartDate >= startDate && a.StartDate <= endDate && a.Common.IsDeleted == false && a.User.Username == username
                                  orderby a.StartDate
                                  select a);
                    totalRecords = result.Count();
                    return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Availability>();
                }
                else
                {
                    throw new ApplicationException("User " + username + " does not exist.");
                }
            }
        }

        public List<DAL.Availability> getAvailablePeopleForCampus(int campusId, DateTime startDate, DateTime endDate, int pageNum, int pageSize, out int totalRecords)
        {
            //GUILLAUME //TODO //DUR C'es ttrop dur ... La ça devrais marcher, mais ça dois envoyer un nombre de requetes impressionant.
            ICampusService campusService = new CampusService();
            using (GDPEntities db = new GDPEntities())
            {
                var result = (from a in db.Availabilities
                              where a.EndDate >= startDate && a.EndDate <= endDate
                              && a.User.StakeholderCampuses.Contains(campusService.GetById(campusId))
                              && a.Common.IsDeleted == false
                              orderby a.StartDate
                              select a);
                totalRecords = result.Count();
                return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Availability>();
            }
        }

        public List<DAL.Availability> getAvailablePeopleForCampus(int id, int pageNum, int pageSize, out int totalRecords)
        {
            return getAvailablePeopleForCampus(id, new DateTime(1980, 1, 1), new DateTime(2050, 1, 1), pageNum, pageSize, out totalRecords);
        }

        public void deleteAvailability(int id, string authorId)
        {
            DAL.Availability a = getAvailabilityById(id);
            DAL.Utils.GenericCrud.SetAudit(a.Common.Audit, authorId);
            a.Common.IsDeleted = true;

            DAL.Utils.GenericCrud.Update(a);
        }
    }
}
