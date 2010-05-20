using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Objects.DataClasses;
using System.Data;

namespace DAL.Utils
{
    public static class GenericCrud
    {
        public static void Create<T>(T e) where T : EntityObject
        {
            using (GDPEntities db = new GDPEntities())
            {
                db.AddObject(GetEntitySetName(e), e);
                db.SaveChanges();
            }
        }

        public static void Update<T>(T e) where T : EntityObject
        {
            using (GDPEntities db = new GDPEntities())
            {
                db.AttachTo(GetEntitySetName(e), e);
                db.ObjectStateManager.ChangeObjectState(e, System.Data.EntityState.Modified);
                try
                {
                    db.SaveChanges();
                }
                catch (OptimisticConcurrencyException oce)
                {
                    db.Refresh(System.Data.Objects.RefreshMode.ClientWins, e);
                    db.SaveChanges();
                }
            }
        }

        /// <summary>
        /// Get EntitySetName from the class name
        /// </summary>
        /// <typeparam name="T">EntityObject</typeparam>
        /// <param name="e">Entity</param>
        /// <returns>EntitySetName</returns>
        private static string GetEntitySetName<T>(T e) where T : EntityObject
        {
            switch (e.GetType().Name)
            {
                case "Campus":
                    return "Campuses";
                case "Address":
                    return "Addresses";
                case "Cursus":
                    return "Cursuses";
                case "Availability":
                    return "Availabilities";
                default:
                    throw new ApplicationException("Unknown entity: could not find EntitySetName for :" + e.GetType().Name);
            }
        }
    }
}
