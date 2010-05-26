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
        private DAL.GDPEntities db;
        
        public CampusService()
        {
            db = new DAL.GDPEntities();
        }

        /// <summary>
        /// Persist a campus
        /// </summary>
        /// <param name="c">The campus entity to persist</param>
        public void Create(DAL.Campus c, string authorId)
        {
            c.Common.Audit.CreatedBy = authorId;

            DAL.Utils.GenericCrud.Create(c);
        }

        /// <summary>
        /// Retrieve a Campus by his ID
        /// </summary>
        /// <param name="id">CampusID</param>
        /// <returns>DAL.Campus</returns>
        public DAL.Campus GetById(int id)
        {
            return db.Campuses.First(c => c.Id == id);
        }

        /// <summary>
        /// Retrieve ALL campuses
        /// </summary>
        /// <remarks>Warning, this can be huge if there is a lot of campuses</remarks>
        /// <returns>List<Campus></returns>
        public List<DAL.Campus> GetAll()
        {
            int test;
            
            return db.Campuses.ToList<DAL.Campus>();
        }

        public void Update(int id, DAL.Campus c)
        {
            if (id != c.Id)
            {
                throw new Exception("id is different from CursusID");
            }

            DAL.Utils.GenericCrud.Update(c.Address);
            DAL.Utils.GenericCrud.Update(c);
        }

        /// <summary>
        /// Delete campus
        /// </summary>
        /// <param name="id">CampusID</param>
        public void Delete(int id)
        {
            DAL.Campus campus = GetById(id);
            campus.Common.IsDeleted = true;
            DAL.Utils.GenericCrud.Update(campus);
            //db.Campuses.DeleteObject(db.Campuses.First(c => c.Id == id));
        }

        #region ICampus Members


        public void CreateVenue(Venue v, string authorId, int campusId)
        {
            v.Common.Audit.CreatedBy = authorId;

            DAL.Campus campus = GetById(campusId);
            campus.Venues.Add(DAL.Utils.GenericCrud.Create(v));
            DAL.Utils.GenericCrud.Update(campus);
        }

        public Venue GetVenueById(int id)
        {
            return db.Venues.First(v => v.Id == id);
        }

        public List<Venue> GetAllVenues()
        {
            return db.Venues.ToList<DAL.Venue>();
        }

        public void UpdateVenue(int id, Venue v)
        {
            if (id != v.Id)
            {
                throw new Exception("id is different from VenueID");
            }

            DAL.Utils.GenericCrud.Update(v.Address);
            DAL.Utils.GenericCrud.Update(v);
        }

        public void DeleteVenue(int id)
        {
            DAL.Venue venue = GetVenueById(id);
            venue.Common.IsDeleted = true;
            DAL.Utils.GenericCrud.Update(venue);
        }

        #endregion
    }
}
