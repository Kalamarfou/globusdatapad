using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DAL.Utils;

namespace Services
{
    public class Cursus
    {
        
        private DAL.GlobusDataPadEntities db;
        
        public Cursus()
        {
            db = new DAL.GlobusDataPadEntities();
        }

        /// <summary>
        /// Persist a campus
        /// </summary>
        /// <param name="c">The campus entity to persist</param>
        public void Create(DAL.Cursuses c)
        {
            db.AddToCursuses(c);
            db.SaveChanges();
        }

        /// <summary>
        /// Retrieve a Campus by his ID
        /// </summary>
        /// <param name="id">CampusID</param>
        /// <returns>DAL.Campus</returns>
        public DAL.Cursuses GetById(int id)
        {
            return db.Cursuses.First(c => c.CursusID == id);
        }

        /// <summary>
        /// Retrieve ALL campuses
        /// </summary>
        /// <remarks>Warning, this can be huge if there is a lot of campuses</remarks>
        /// <returns>List<Campus></returns>
        public List<DAL.Cursuses> GetAll()
        {
            return db.Cursuses.ToList<DAL.Cursuses>();
        }

        public void Update(int id, DAL.Cursuses c)
        {

            DAL.Utils.GenericCrud.Update(c);

            //if (id != c.CursusID)
            //{
            //    throw new Exception("id is different from CursusID");
            //}
            //db.Cursuses.Attach(c);
            //db.ObjectStateManager.ChangeObjectState(c, System.Data.EntityState.Modified);
            //try
            //{
            //    db.SaveChanges();
            //}
            //catch (OptimisticConcurrencyException e)
            //{
            //    db.Refresh(System.Data.Objects.RefreshMode.ClientWins, c);
            //    db.SaveChanges();
            //}
        }

        /// <summary>
        /// Delete campus
        /// </summary>
        /// <param name="id">CampusID</param>
        public void Delete(int id)
        {
            db.Cursuses.DeleteObject(db.Cursuses.First(c => c.CursusID == id));
        }
    }
}
