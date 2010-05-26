using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;

namespace Services.People
{
    public class SecurityService : ISecurityService
    {

        public void createUser(DAL.User user)
        {
            user.Common.IsDeleted = false;
            user.Common.Audit.CreatedAt = DateTime.Now;
            user.Common.Audit.LastModifiedAt = DateTime.Now;
            user.Common.Audit.CreatedBy = "";
            user.Common.Audit.LastModifiedBy = "";

            byte[] test = new byte[8];
            test[0] = 1;
            test[1] = 1;
            test[2] = 1;
            test[3] = 1;
            test[4] = 1;
            test[5] = 1;
            test[6] = 1;
            test[7] = 1;
            
            user.Common.ConcurrencyToken = test;

            using (GDPEntities db = new GDPEntities())
            {
                db.AddToUsers(user);
                db.SaveChanges();
            }
        }

        public DAL.User getUserByUsername(string username)
        {
            DAL.User user = null;

            using (GDPEntities db = new GDPEntities())
            {
                user = (from u in db.Users
                    where u.Username == username
                    select u).SingleOrDefault<DAL.User>();
            }

            return user;
        }

        public User getUserById(int userId)
        {
            DAL.User user = null;

            using (GDPEntities db = new GDPEntities())
            {
                user = (from u in db.Users
                        where u.Id == userId
                        select u).SingleOrDefault<DAL.User>();
            }

            return user;
        }

        public void updateUser(DAL.User user)
        {
            user.Common.Audit.LastModifiedAt = DateTime.Now;
            user.Common.Audit.LastModifiedBy = "";

            DAL.Utils.GenericCrud.Update<DAL.User>(user);
        }

        public void deleteUser(DAL.User user)
        {
            user.Common.Audit.LastModifiedAt = DateTime.Now;
            user.Common.Audit.LastModifiedBy = "";
            user.Common.IsDeleted = true;

            DAL.Utils.GenericCrud.Update<DAL.User>(user);
        }

        public List<DAL.User> getAllUsers(int pageIndex, int pageSize)
        {
            List<DAL.User> users;

            using (GDPEntities db = new GDPEntities())
            {
                users = (from u in db.Users
                         orderby u.Id
                         select u).Skip(pageIndex * pageSize).Take(pageSize).ToList<DAL.User>();
            }

            return users;
        }

        public int getNumberOfUsersOnline(int userIsOnlineTimeWindow)
        {
            TimeSpan onlineSpan = new TimeSpan(0, userIsOnlineTimeWindow, 0);
            DateTime compareTime = DateTime.Now.Subtract(onlineSpan);

            int online = 0;

            using (GDPEntities db = new GDPEntities())
            {
                online = (from u in db.Users
                    where u.LastActivityDate > compareTime
                    select u).Distinct().Count();
            }

            return online;
        }

        public int getTotalNumberOfUsers()
        {
            int total = 0;

            using (GDPEntities db = new GDPEntities())
            {
                total = (from u in db.Users
                         select u).Distinct().Count();
            }
            return total;
        }

        public bool isUserInRole(string username, string roleName)
        {
            using (GDPEntities db = new GDPEntities())
            {
                return (from u in db.Users
                        where u.Username == username
                        from r in u.Roles
                        where r.ShortName == roleName
                        select r).Count() > 0;
            }
        }

        public string[] getUserRoles(string username)
        {
            using (GDPEntities db = new GDPEntities())
            {
                return (from u in db.Users
                        where u.Username == username
                        from r in u.Roles
                        select r.ShortName).ToArray();
            }
        }

        public void createRole(string shortName, string name, string authorId)
        {
            Role role = new Role();
            role.ShortName = shortName;
            role.Name = name;
            role.Common.Audit.CreatedAt = DateTime.Now;
            role.Common.Audit.LastModifiedAt = DateTime.Now;
            role.Common.Audit.CreatedBy = authorId;
            role.Common.Audit.LastModifiedBy = authorId;

            DAL.Utils.GenericCrud.Create<DAL.Role>(role);
        }

        public bool roleExists(string name)
        {
            using (GDPEntities db = new GDPEntities())
            {
                return (from r in db.Roles
                        where r.ShortName == name
                        select r).SingleOrDefault() != null;
            }
        }

        public string[] getUsersInRole(string roleName)
        {
            using (GDPEntities db = new GDPEntities())
            {
                return (from r in db.Roles
                        where r.ShortName == roleName
                        from u in r.Users
                        select u.Username).ToArray();
            }
        }

        public string[] getAllRoles()
        {
            using (GDPEntities db = new GDPEntities())
            {
                return (from r in db.Roles
                            select r.ShortName).ToArray();
            }
        }

    }
}