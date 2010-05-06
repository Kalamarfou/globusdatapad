using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Services
{
    public class Campus
    {
        private DAL.GlobusDataPadEntities db;
        
        public Campus()
        {
            db = new DAL.GlobusDataPadEntities();
        }

        /// <summary>
        /// Persist a campus
        /// </summary>
        /// <param name="c">The campus entity to persist</param>
        public void Create(DAL.Campus c)
        {
            db.AddToCampuses(c);
            db.SaveChanges();
        }

        /// <summary>
        /// Retrieve a Campus by his ID
        /// </summary>
        /// <param name="id">CampusID</param>
        /// <returns>DAL.Campus</returns>
        public DAL.Campus GetById(int id)
        {
            return db.Campuses.First(c => c.CampusID == id);
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
            db.Campuses.ApplyCurrentValues(c);
            db.SaveChanges();
        }

        /// <summary>
        /// Delete campus
        /// </summary>
        /// <param name="id">CampusID</param>
        public void Delete(int id)
        {
            db.Campuses.DeleteObject(db.Campuses.First(c => c.CampusID == id));
        }
    }
}
