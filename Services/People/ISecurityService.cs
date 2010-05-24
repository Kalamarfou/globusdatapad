﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Services.People
{
    public interface ISecurityService
    {
        /// <summary>
        /// Create user
        /// </summary>
        void createUser(DAL.User user);

        /// <summary>
        /// Get DAL.User by username
        /// </summary>
        /// <param name="username"></param>
        /// <returns></returns>
        DAL.User getUserByUsername(string username);

        void updateUser(DAL.User user);

        void deleteUser(DAL.User user);

        List<DAL.User> getAllUsers(int pageIndex, int pageSize);

        /// <summary>
        /// Get the number of users online in the given time window
        /// </summary>
        /// <param name="userIsOnlineTimeWindow">Minutes from now wehre users were online</param>
        /// <returns>Count of users online in the given time window</returns>
        int getNumberOfUsersOnline(int userIsOnlineTimeWindow);

        /// <summary>
        /// Count number of not deleted users in database
        /// </summary>
        /// <returns></returns>
        int getTotalNumberOfUsers();

        bool isUserInRole(string username, string roleName);

        string[] getUserRoles(string username);

        void createRole(string name);

        bool roleExists(string name);

        string[] getUsersInRole(string username);

        List<DAL.User> getUsersInRole(string username);
    }
}