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

        #region ICampusService Members

        /// <summary>
        /// Persist a campus
        /// </summary>
        /// <param name="c">The campus entity to persist</param>
        public void Create(DAL.Campus c, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(c.Address.Common.Audit, authorId);
            DAL.Utils.GenericCrud.SetAudit(c.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Create(c.Address);
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

        public List<DAL.Campus> GetAll(int pageNum, int pageSize, out int totalRecords)
        {
            totalRecords = db.Campuses.Count();
            return (from c in db.Campuses
                    orderby c.Name
                    select c).Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Campus>();
        }

        public void Update(DAL.Campus c, string authorId)
        {
            //GUILLAUME si on a modifié le campus mais pas son adresse, il ne faudrais pas changer les set audit sur l'adresse
            DAL.Utils.GenericCrud.SetAudit(c.Address.Common.Audit, authorId);
            DAL.Utils.GenericCrud.SetAudit(c.Common.Audit, authorId);
           
            DAL.Utils.GenericCrud.Update(c.Address);
            DAL.Utils.GenericCrud.Update(c);
        }

        public void Delete(DAL.Campus c, string authorId)
        {
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
            return db.Venues.First(v => v.Id == id);
        }

        public List<Venue> GetAllVenues(int pageNum, int pageSize, out int totalRecords)
        {
            totalRecords = db.Venues.Count();
            return (from v in db.Venues
                    orderby v.Name
                    select v).Skip(pageNum * pageSize).Take(pageSize).ToList<DAL.Venue>();
        }

        public void UpdateVenue(Venue v, string authorId)
        {
            DAL.Utils.GenericCrud.SetAudit(v.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Update(v.Address);
            DAL.Utils.GenericCrud.Update(v);
        }

        public void DeleteVenue(Venue v, string authorId)
        {
            v.Common.IsDeleted = true;
            DAL.Utils.GenericCrud.SetAudit(v.Common.Audit, authorId);
            DAL.Utils.GenericCrud.Update(v);
        }

        #endregion
    }
}
