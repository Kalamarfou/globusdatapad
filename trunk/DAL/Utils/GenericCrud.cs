using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.Objects.DataClasses;
using System.Data;
using System.Linq.Expressions;

namespace DAL.Utils
{
    public static class GenericCrud
    {
        public static T Create<T>(T e) where T : EntityObject
        {
            using (GDPEntities db = new GDPEntities())
            {
                db.AddObject(GetEntitySetName(e), e);
                db.SaveChanges();
            }
        
            return  e;
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
                case "Address":
                    return "Addresses";
                case "Availability":
                    return "Availabilities";
                case "Campus":
                    return "Campuses";
                case "Class":
                    return "Classes";
                case "Course":
                    return "Events";
                case "CourseType":
                    return "BaseTypes";
                case "Cursus":
                    return "Cursuses";
                case "Discipline":
                    return "Disciplines";
                case "Evaluation":
                    return "Events";
                case "EvaluationType":
                    return "BaseTypes";
                case "Event":
                    return "Events";
                case "Person":
                    return "People";
                case "Role":
                    return "Roles";
                case "StudyPeriod":
                    return "StudyPeriods";
                case "User":
                    return "Users";
                case "Venue":
                    return "Venues";
                case "WorldWideEvent":
                    return "Events";
                default:
                    throw new ApplicationException("Unknown entity: could not find EntitySetName for :" + e.GetType().Name);
            }
        }

        /// <summary>
        /// Update audit fields
        /// </summary>
        /// <param name="audit">Audit fields</param>
        /// <param name="authorId">Username of the user that has made the modification.</param>
        public static void SetAudit(Audit audit, string authorId)
        {
            DateTime now = DateTime.Now;    // in order to have the exact same date for creation and modification, 
                                            // allowing us to find entities that have never been modified etc

            if (string.IsNullOrEmpty(audit.CreatedBy) && audit.CreatedAt == new DateTime())
            {
                audit.CreatedAt = now;
                audit.CreatedBy = authorId;
            }

            audit.LastModifiedAt = now;
            audit.LastModifiedBy = authorId;
        }
    }
}
