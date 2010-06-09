﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DAL;

namespace Services.Campus
{
    public class CampusService : ICampusService
    {

        #region ICampusService Members

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
                return db.Venues.First(v => v.Id == id && v.Common.IsDeleted == false);
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

        #endregion

        #region ICampusService Members


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
                    return campus.Venues.Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Venue>();
                }
            }
        }

        #endregion
    }
}
