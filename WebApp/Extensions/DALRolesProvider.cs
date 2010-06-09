using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Collections.Specialized;
using System.Diagnostics;
using System.Text;
using System.Web.Hosting;
using Services.People;
using System.Configuration.Provider;

namespace WebApp.Extensions
{
    public class DALRolesProvider : RoleProvider
    {
        #region members
        private const string EVENTSOURCE = "DALRolesProvider";
        private const string EVENTLOG = "Application";
        private const string exceptionMessage = "An exception occurred. Please check the Event Log.";
        private string connectionString;
        #endregion

        #region properties
        /// <summary>
        /// Gets or sets the name of the application to store and retrieve role information for.
        /// </summary>
        /// <returns>
        /// The name of the application to store and retrieve role information for.
        /// </returns>
        public override string ApplicationName { get; set; }

        /// <summary>
        /// Gets or sets a value indicating whether [write exceptions to event log].
        /// </summary>
        /// <value><c>true</c> if [write exceptions to event log]; otherwise, <c>false</c>.
        /// </value>
        public bool WriteExceptionsToEventLog { get; set; }
        #endregion

        #region public methods
        /// <summary>
        /// System.Configuration.Provider.ProviderBase.Initialize Method
        /// </summary>
        /// <param name="name">The friendly name of the provider.</param>
        /// <param name="config">A collection of the name/value pairs representing the provider-specific attributes specified in the configuration for this provider.</param>
        /// <exception cref="T:System.ArgumentNullException">
        /// The name of the provider is null.
        /// </exception>
        /// <exception cref="T:System.ArgumentException">
        /// The name of the provider has a length of zero.
        /// </exception>
        /// <exception cref="T:System.InvalidOperationException">
        /// An attempt is made to call <see cref="M:System.Configuration.Provider.ProviderBase.Initialize(System.String,System.Collections.Specialized.NameValueCollection)"/> on a provider after the provider has already been initialized.
        /// </exception>
        public override void Initialize(string name, NameValueCollection config)
        {
            // Initialize values from web.config.
            if (config == null)
            {
                throw new ArgumentNullException("config");
            }

            if (String.IsNullOrEmpty(name))
            {
                name = "DALRolesProvider";
            }

            if (String.IsNullOrEmpty(config["description"]))
            {
                config.Remove("description");
                config.Add("description", "DALRolesProvider for GlobusDataPad application");
            }

            // Initialize the abstract base class.
            base.Initialize(name, config);

            ApplicationName = (string)ProviderUtils.GetConfigValue(config, "applicationName", HostingEnvironment.ApplicationVirtualPath);
            WriteExceptionsToEventLog = (bool)ProviderUtils.GetConfigValue(config, "writeExceptionsToEventLog", false);
        }

        /// <summary>
        /// Gets a value indicating whether the specified user is in the specified role for the configured applicationName.
        /// </summary>
        /// <param name="username">The user name to search for.</param>
        /// <param name="roleName">The role to search in.</param>
        /// <returns>true if the specified user is in the specified role for the configured applicationName; otherwise, false.</returns>
        public override bool IsUserInRole(string username, string roleName)
        {
            try
            {
                ISecurityService service = new SecurityService();
                return service.isUserInRole(username, roleName);
            }
            catch (Exception ex)
            {
                if (WriteExceptionsToEventLog)
                {
                    WriteToEventLog(ex, "IsUserInRole");
                }

                throw;
            }
        }

        /// <summary>
        /// Gets a list of the roles that a specified user is in for the configured applicationName.
        /// </summary>
        /// <param name="username">The user to return a list of roles for.</param>
        /// <returns>A string array containing the names of all the roles that the specified user is in for the configured applicationName.</returns>
        public override string[] GetRolesForUser(string username)
        {
            ISecurityService service = new SecurityService();
            return service.getUserRoles(username);
        }

        /// <summary>
        /// Adds a new role to the data source for the configured applicationName.
        /// </summary>
        /// <param name="roleName">The name of the role to create.</param>
        public override void CreateRole(string roleName)
        {
            ISecurityService service = new SecurityService();

            // Validate role name
            if (roleName.Contains(","))
            {
                throw new ArgumentException("Role names cannot contain commas.");
            }

            if (RoleExists(roleName))
            {
                throw new ProviderException("Role name already exists.");
            }

            try
            {
                service.createRole(roleName, roleName, "System");       // TODO à autoriser ?
            }
            catch (Exception ex)
            {
                if (WriteExceptionsToEventLog)
                {
                    WriteToEventLog(ex, "CreateRole");
                }
                else
                {
                    throw;
                }
            }
        }

        /// <summary>
        /// Removes a role from the data source for the configured applicationName.
        /// </summary>
        /// <param name="roleName">The name of the role to delete.</param>
        /// <param name="throwOnPopulatedRole">If true, throw an exception if <paramref name="roleName"/> has one or more members and do not delete <paramref name="roleName"/>.</param>
        /// <returns>
        /// true if the role was successfully deleted; otherwise, false.
        /// </returns>
        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            throw new NotImplementedException("OSEF");
        }

        /// <summary>
        /// Gets a value indicating whether the specified role name already exists in the role data source for the configured applicationName.
        /// </summary>
        /// <returns>true if the role name already exists in the data source for the configured applicationName; otherwise, false.</returns>
        /// <param name="roleName">The name of the role to search for in the data source.</param>
        public override bool RoleExists(string roleName)
        {
            ISecurityService service = new SecurityService();
            return service.roleExists(roleName);
        }

        /// <summary>
        /// Adds the specified user names to the specified roles for the configured applicationName.
        /// </summary>
        /// <param name="userNames">A string array of user names to be added to the specified roles.</param>
        /// <param name="roleNames">A string array of the role names to add the specified user names to.</param>
        public override void AddUsersToRoles(string[] userNames, string[] roleNames)
        {
            ISecurityService service = new SecurityService();
            foreach (string user in userNames)
            {
                foreach (string role in roleNames)
                {
                    service.addUserToRole(user, role);
                }
            }
        }

        /// <summary>
        /// Removes the specified user names from the specified roles for the configured applicationName.
        /// </summary>
        /// <param name="userNames">A string array of user names to be removed from the specified roles.</param>
        /// <param name="roleNames">A string array of role names to remove the specified user names from.</param>
        public override void RemoveUsersFromRoles(string[] userNames, string[] roleNames)
        {
            ISecurityService service = new SecurityService();
            foreach (string user in userNames)
            {
                foreach (string role in roleNames)
                {
                    service.removeUserInRole(user, role);
                }
            }
        }

        /// <summary>
        /// Gets a list of users in the specified role for the configured applicationName.
        /// </summary>
        /// <param name="roleName">The name of the role to get the list of users for.</param>
        /// <returns>
        /// A string array containing the names of all the users who are members of the specified role for the configured applicationName.
        /// </returns>
        public override string[] GetUsersInRole(string roleName)
        {
            ISecurityService service = new SecurityService();
            return service.getUsersInRole(roleName);

        }

        /// <summary>
        /// Gets a list of all the roles for the configured applicationName.
        /// </summary>
        /// <returns>A string array containing the names of all the roles stored in the data source for the configured applicationName.</returns>
        public override string[] GetAllRoles()
        {
            ISecurityService service = new SecurityService();
            return service.getAllRoles();
        }

        /// <summary>
        /// Gets an array of user names in a role where the user name contains the specified user name to match.
        /// </summary>
        /// <returns>A string array containing the names of all the users where the user name matches <paramref name="usernameToMatch" /> 
        /// and the user is a member of the specified role.</returns>
        /// <param name="roleName">The role to search in.</param>
        /// <param name="usernameToMatch">The user name to search for.</param>
        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            throw new NotImplementedException("OSEF");
            /*
            using (EFDataModelEntities context = new EFDataModelEntities(connectionString))
            {
                Role role = GetRole(r => r.Name == roleName, context);
                if (role == null)
                {
                    throw new ProviderException("Role not found.");
                }

                if (!role.User.IsLoaded)
                {
                    role.User.Load();
                }

                return role.User.Select(u => u.Username).Where(un => un.Contains(usernameToMatch)).ToArray();
            }
             */
        }

        #endregion

        /// <summary>
        /// Writes exception to event log.
        /// </summary>
        /// <param name="exception">The exception.</param>
        /// <param name="action">The action.</param>
        /// <remarks>A helper function that writes exception detail to the event log. Exceptions
        /// are written to the event log as a security measure to avoid private database
        /// details from being returned to the browser. If a method does not return a status
        /// or boolean indicating the action succeeded or failed, a generic exception is also
        /// thrown by the caller.</remarks>
        private static void WriteToEventLog(Exception exception, string action)
        {
            EventLog log = new EventLog { Source = EVENTSOURCE, Log = EVENTLOG };

            StringBuilder message = new StringBuilder();
            message.Append(exceptionMessage + "\n\n");
            message.Append("Action: " + action + "\n\n");
            message.Append("Exception: " + exception);

            log.WriteEntry(message.ToString());
        }
        
    }
}