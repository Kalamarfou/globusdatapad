﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30319.1
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WebApp.Content.i18n.Account {
    using System;
    
    
    /// <summary>
    ///   A strongly-typed resource class, for looking up localized strings, etc.
    /// </summary>
    // This class was auto-generated by the StronglyTypedResourceBuilder
    // class via a tool like ResGen or Visual Studio.
    // To add or remove a member, edit your .ResX file then rerun ResGen
    // with the /str option, or rebuild your VS project.
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("System.Resources.Tools.StronglyTypedResourceBuilder", "4.0.0.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    public class Register {
        
        private static global::System.Resources.ResourceManager resourceMan;
        
        private static global::System.Globalization.CultureInfo resourceCulture;
        
        [global::System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")]
        internal Register() {
        }
        
        /// <summary>
        ///   Returns the cached ResourceManager instance used by this class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        public static global::System.Resources.ResourceManager ResourceManager {
            get {
                if (object.ReferenceEquals(resourceMan, null)) {
                    global::System.Resources.ResourceManager temp = new global::System.Resources.ResourceManager("WebApp.Content.i18n.Account.Register", typeof(Register).Assembly);
                    resourceMan = temp;
                }
                return resourceMan;
            }
        }
        
        /// <summary>
        ///   Overrides the current thread's CurrentUICulture property for all
        ///   resource lookups using this strongly typed resource class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        public static global::System.Globalization.CultureInfo Culture {
            get {
                return resourceCulture;
            }
            set {
                resourceCulture = value;
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Account Information.
        /// </summary>
        public static string AccountInfo {
            get {
                return ResourceManager.GetString("AccountInfo", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Use the form below to create a new account..
        /// </summary>
        public static string CreateBelow {
            get {
                return ResourceManager.GetString("CreateBelow", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Account creation was unsuccessful. Please correct the errors and try again..
        /// </summary>
        public static string Fail {
            get {
                return ResourceManager.GetString("Fail", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Passwords are required to be a minimum of .
        /// </summary>
        public static string Password1 {
            get {
                return ResourceManager.GetString("Password1", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to characters in length..
        /// </summary>
        public static string Password2 {
            get {
                return ResourceManager.GetString("Password2", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Register.
        /// </summary>
        public static string Register1 {
            get {
                return ResourceManager.GetString("Register1", resourceCulture);
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to Create a New Account.
        /// </summary>
        public static string Title {
            get {
                return ResourceManager.GetString("Title", resourceCulture);
            }
        }
    }
}