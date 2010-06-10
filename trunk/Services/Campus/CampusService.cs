using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DAL;

namespace Services.Campus
{
    public class CampusService : ICampusService
    {

        /// <summary>
        /// Persist a campus
        /// </summary>
        /// <param name="c">The campus entity to persist</param>
        public void Create(DAL.Campus c, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(c.Address.Common.Audit, authorId);
            DAL.Utils.GenericCrud.SetAudit(c.Common.Audit, authorId);

            DAL.Utils.GenericCrud.Create<DAL.Campus>(c);
        }

        /// <summary>
        /// Retrieve a Campus by his ID
        /// </summary>
        /// <param name="id">CampusID</param>
        /// <returns>DAL.Campus</returns>
        public DAL.Campus GetById(int id)
        {
            using (GDPEntities db = new GDPEntities())
            {
                DAL.Campus campus = db.Campuses.Include("Address").First(c => c.Id == id && c.Common.IsDeleted == false);
                return campus;
            }
        }

        public List<DAL.Campus> GetAll(int pageNum, int pageSize, out int totalRecords)
        {
            using (GDPEntities db = new GDPEntities())
            {
                var result = (from c in db.Campuses.Include("Address")
                              where c.Common.IsDeleted == false
                              orderby c.Name
                              select c);
                totalRecords = result.Count();

                List<DAL.Campus> campuses = result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Campus>();

                return campuses;
            }
        }

        public void Update(DAL.Campus c, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(c.Address.Common.Audit, authorId);
            DAL.Utils.GenericCrud.SetAudit(c.Common.Audit, authorId);

            DAL.Utils.GenericCrud.Update(c.Address);
            DAL.Utils.GenericCrud.Update(c);
        }

        public void Delete(int id, string authorId)
        {
            DAL.Campus c = GetById(id);
            
            c.Common.IsDeleted = true;
            DAL.Utils.GenericCrud.SetAudit(c.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Update(c);
        }

        public void CreateVenue(Venue v, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(v.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Create(v);
        }

        public Venue GetVenueById(int id)
        {
            using (GDPEntities db = new GDPEntities())
            {
                return db.Venues.Include("Campus").First(v => v.Id == id && v.Common.IsDeleted == false);
            }
        }

        public List<Venue> GetAllVenues(int pageNum, int pageSize, out int totalRecords)
        {
            using (GDPEntities db = new GDPEntities())
            {
                var result = (from v in db.Venues
                              where v.Common.IsDeleted == false
                              orderby v.Name
                              select v);
                totalRecords = result.Count();
                return result.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Venue>();
            }
        }

        public void UpdateVenue(Venue v, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(v.Common.Audit, authorId);
            //DAL.Utils.GenericCrud.Update(v.Address);
            DAL.Utils.GenericCrud.Update(v);
        }

        public void DeleteVenue(Venue v, string authorId)
        {
            v.Common.IsDeleted = true;
            DAL.Utils.GenericCrud.SetAudit(v.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Update(v);
        }

        public void CreateVenueForCampus(int campusId, Venue v, string authorId)
        {
            using (GDPEntities gdp = new GDPEntities())
            {
                DAL.Campus campus = (from c in gdp.Campuses
                                     where c.Id == campusId && c.Common.IsDeleted == false
                                     select c).FirstOrDefault<DAL.Campus>();

                if (campus == null)
                {
                    throw new ApplicationException("Campus #" + campusId + " doesn't exist or has been deleted.");
                }
                else
                {
                    DAL.Utils.GenericCrud.SetAudit(v.Common.Audit, authorId);

                    campus.Venues.Add(v);

                    gdp.SaveChanges();
                }
            }
        }

        public List<Venue> GetAllVenuesForCampus(int campusId, int pageNum, int pageSize, out int totalRecords)
        {
            using (GDPEntities gdp = new GDPEntities())
            {
                DAL.Campus campus = (from c in gdp.Campuses
                                     where c.Id == campusId && c.Common.IsDeleted == false
                                     select c).FirstOrDefault<DAL.Campus>();

                if (campus == null)
                {
                    throw new ApplicationException("Campus #" + campusId + " doesn't exist or has been deleted.");
                }
                else
                {
                    totalRecords = campus.Venues.Where(v => v.Common.IsDeleted == false).Count();
                    return campus.Venues.Where(v => v.Common.IsDeleted == false).Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Venue>();
                }
            }
        }

        public List<User> GetManagersForCampus(int id)
        {
            using (GDPEntities gdp = new GDPEntities())
            {
                DAL.Campus campus = (from c in gdp.Campuses.Include("Managers")
                                     where c.Id == id && c.Common.IsDeleted == false
                                     select c).FirstOrDefault<DAL.Campus>();

                if (campus != null)
                {
                    return campus.Managers.ToList<DAL.User>();
                }
                else
                {
                    throw new ApplicationException("Campus #" + id + " doesn't exist or has been deleted.");
                }
            }
        }

        public void AddManagerToCampus(int campusManagerId, int campusId)
        {
            using (GDPEntities gdp = new GDPEntities())
            {
                DAL.Campus campus = (from c in gdp.Campuses
                                     where c.Id == campusId && c.Common.IsDeleted == false
                                     select c).FirstOrDefault<DAL.Campus>();

                if (campus == null) throw new ApplicationException("Campus #" + campusId + " not found.");

                DAL.User user = (from u in gdp.Users
                                 where u.Id == campusManagerId && u.Common.IsDeleted == false
                                 select u).FirstOrDefault<DAL.User>();

                if (user == null) throw new ApplicationException("User #" + campusManagerId + " not found.");

                if (campus.Managers.Contains(user))
                {
                    throw new ApplicationException("User #" + campusManagerId + " already manager for campus #" + campusId + ".");
                }
                else
                {
                    campus.Managers.Add(user);
                    gdp.SaveChanges();
                }
            }
        }

        public List<DAL.Class> GetClassesForCampus(int campusId, int pageNum, int pageSize, out int totalRecords)
        {
            using (GDPEntities gdp = new GDPEntities())
            {
                DAL.Campus campus = (from c in gdp.Campuses.Include("Classes")
                                     where c.Id == campusId && c.Common.IsDeleted == false
                                     select c).FirstOrDefault<DAL.Campus>();

                if (campus == null)
                {
                    throw new ApplicationException("Campus #" + campusId + " not found or has been deleted.");
                }

                totalRecords = campus.Classes.Where(c => c.Common.IsDeleted == false).Count();

                return campus.Classes.Where(c => c.Common.IsDeleted == false).ToList<DAL.Class>();
            }
        }

        public void CreateClassForCampus(int campusId, DAL.Class c, string authorId)
        {
            using (GDPEntities gdp = new GDPEntities())
            {
                DAL.Campus cam = (from campus in gdp.Campuses
                                     where campus.Id == campusId && campus.Common.IsDeleted == false
                                     select campus).FirstOrDefault<DAL.Campus>();

                if (cam == null)
                {
                    throw new ApplicationException("Campus #" + campusId + " not found or has been deleted.");
                }

                DAL.Utils.GenericCrud.SetAudit(c.Common.Audit, authorId);

                cam.Classes.Add(c);

                gdp.SaveChanges();
            }
        }

    }
}
