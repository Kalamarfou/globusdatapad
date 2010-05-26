using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using DAL.Utils;

namespace Services.Cursus
{
    public class CursusService : ICursusService
    {

        private DAL.GDPEntities db;
        
        public CursusService()
        {
            db = new DAL.GDPEntities();
        }

        /// <summary>
        /// Persist a campus
        /// </summary>
        /// <param name="c">The campus entity to persist</param>
        public void Create(DAL.Cursus c)
        {
            

            db.AddToCursuses(c);
            db.SaveChanges();
        }

        /// <summary>
        /// Retrieve a Campus by his ID
        /// </summary>
        /// <param name="id">CampusID</param>
        /// <returns>DAL.Campus</returns>
        public DAL.Cursus GetById(int id)
        {
            return db.Cursuses.First(c => c.Id == id);
        }

        /// <summary>
        /// Retrieve ALL campuses
        /// </summary>
        /// <remarks>Warning, this can be huge if there is a lot of campuses</remarks>
        /// <returns>List<Campus></returns>
        public List<DAL.Cursus> GetAll()
        {
            return db.Cursuses.ToList<DAL.Cursus>();
        }

        public void Update(int id, DAL.Cursus c)
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
            db.Cursuses.DeleteObject(db.Cursuses.First(c => c.Id == id));
        }
    }
}
