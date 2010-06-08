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
            user.Common.Audit.CreatedBy = "System";
            user.Common.Audit.LastModifiedBy = "System";

            DAL.Utils.GenericCrud.Create<DAL.User>(user);
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

        public User getUserByEmailAddress(string email)
        {
            DAL.User user = null;

            using (GDPEntities db = new GDPEntities())
            {
                user = (from u in db.Users
                        where u.Email == email
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

        public void updateUser(DAL.User user, string authorId)
        {
            user.Common.Audit.LastModifiedAt = DateTime.Now;
            user.Common.Audit.LastModifiedBy = authorId;

            DAL.Utils.GenericCrud.Update<DAL.User>(user);
        }

        public void deleteUser(DAL.User user, string authorId)
        {
            user.Common.Audit.LastModifiedAt = DateTime.Now;
            user.Common.Audit.LastModifiedBy = authorId;
            user.Common.IsDeleted = true;

            DAL.Utils.GenericCrud.Update<DAL.User>(user);
        }

        public void logFailure(string username, string failureType, double passwordAttemptWindow, int maxInvalidPasswordAttempts)
        {
            DAL.User user = getUserByUsername(username);

            if (user == null)
            {
                throw new ApplicationException("User " + username + " doesn't exist.");
            }

            DateTime windowStart = new DateTime();
            int failureCount = 0;

            if (failureType == "password")
            {
                failureCount = Convert.ToInt32(user.FailedPasswordAttemptCount);
                windowStart = Convert.ToDateTime(user.FailedPasswordAttemptWindowStart);
            }

            if (failureType == "passwordAnswer")
            {
                failureCount = Convert.ToInt32(user.FailedPasswordAnswerAttemptCount);
                windowStart = Convert.ToDateTime(user.FailedPasswordAnswerAttemptWindowStart);
            }

            DateTime windowEnd = windowStart.AddMinutes(passwordAttemptWindow);

            if (failureCount == 0 || DateTime.Now > windowEnd)
            {
                // First password failure or outside of PasswordAttemptWindow. 
                // Start a new password failure count from 1 and a new window starting now.
                if (failureType == "password")
                {
                    user.FailedPasswordAttemptCount = 1;
                    user.FailedPasswordAttemptWindowStart = DateTime.Now;
                }
                if (failureType == "passwordAnswer")
                {
                    user.FailedPasswordAnswerAttemptCount = 1;
                    user.FailedPasswordAnswerAttemptWindowStart = DateTime.Now;
                }

                updateUser(user, "System");
            }
            else
            {
                if (failureCount++ >= maxInvalidPasswordAttempts)
                {
                    // Max password attempts have exceeded the failure threshold. Lock out the user.
                    user.IsLockedOut = true;
                    user.LastLockedOutDate = DateTime.Now;

                    updateUser(user, "System");
                }
                else
                {
                    // Max password attempts have not exceeded the failure threshold. Update
                    // the failure counts. Leave the window the same.
                    if (failureType == "password")
                    {
                        user.FailedPasswordAttemptCount = failureCount;
                    }
                    if (failureType == "passwordAnswer")
                    {
                        user.FailedPasswordAnswerAttemptCount = failureCount;
                    }

                    updateUser(user, "System");
                }
            }
        }

        public List<User> getAllUsers(int pageIndex, int pageSize, out int totalCount)
        {
            totalCount = 0;

            List<DAL.User> users;

            using (GDPEntities db = new GDPEntities())
            {
                totalCount = (from u in db.Users
                              where u.Common.IsDeleted == false
                              select u).Count<DAL.User>();

                users = (from u in db.Users
                         where u.Common.IsDeleted == false
                         orderby u.Id
                         select u).Skip(pageIndex * pageSize).Take(pageSize).ToList<DAL.User>();
            }

            return users;
        }

        public List<User> getAllNonApprovedUsers(int pageIndex, int pageSize, out int totalCount)
        {
            totalCount = 0;

            List<DAL.User> users;

            using (GDPEntities db = new GDPEntities())
            {
                totalCount = (from u in db.Users
                              where u.Common.IsDeleted == false && u.IsApproved == false
                              select u).Count<DAL.User>();

                users = (from u in db.Users
                         where u.Common.IsDeleted == false && u.IsApproved == false
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

        public void addUserToRole(string username, string roleName)
        {
            using (GDPEntities db = new GDPEntities())
            {
                DAL.Role role = db.Roles.Where(r => r.ShortName == roleName).FirstOrDefault<DAL.Role>();

                if (role == null)
                {
                    throw new ApplicationException("Role " + roleName + " not found.");
                }

                DAL.User user = db.Users.Where(u => u.Username == username).FirstOrDefault<DAL.User>();

                if (user == null)
                {
                    throw new ApplicationException("User " + username + " not found.");
                }

                if (user.Roles.Where(r => r.ShortName == roleName).Count() != 0)
                {
                    throw new ApplicationException("User " + username + " already in role " + roleName + ".");
                }
                else
                {
                    user.Roles.Add(role);
                }

                db.SaveChanges();
                db.Connection.Close();
            }
        }

    }
}