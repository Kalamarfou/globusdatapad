using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DAL;

namespace Services
{
    public class Campus
    {
        private DAL.GDPEntities db;
        
        public Campus()
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
            db.Campuses.DeleteObject(db.Campuses.First(c => c.Id == id));
        }
    }
}
