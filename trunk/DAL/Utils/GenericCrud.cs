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

        public static IQueryable<T> Page<T, TResult>(this IQueryable<T> query,
                        int pageNum, int pageSize,
                        Expression<Func<T, TResult>> orderByProperty,
                        bool isAscendingOrder, out int rowsCount)
        {
            if (pageSize <= 0) pageSize = 20;
            rowsCount = query.Count();
            if (rowsCount <= pageSize || pageNum <= 0) pageNum = 1;

            int excludedRows = (pageNum - 1) * pageSize;

            if (isAscendingOrder)
                query = query.OrderBy(orderByProperty);
            else
                query = query.OrderByDescending(orderByProperty);

            return query.Skip(excludedRows).Take(pageSize);
        }


        public static List<T> GetPagedEntities<T>(T e) where T : EntityObject
        {
            using (GDPEntities db = new GDPEntities())
            {
               return db.CreateQuery<T>(GetEntitySetName(e), null).Skip<T>(20).Take(50).ToList<T>();
            }
            return null;
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
        /// Met a jour les champs d'audit
        /// </summary>
        /// <param name="audit">les champs d'audit</param>
        /// <param name="authorId">l'id de l'user</param>
        public static void SetAudit(Audit audit, string authorId)
        {
            if (audit.CreatedBy == null && audit.CreatedAt == null)
            {
                audit.CreatedAt = DateTime.Now;
                audit.CreatedBy = authorId;
            }
            audit.LastModifiedAt = DateTime.Now;
            audit.LastModifiedBy = authorId;
        }
    }
}
