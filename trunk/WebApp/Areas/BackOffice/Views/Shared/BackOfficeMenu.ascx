<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<% if(Roles.IsUserInRole("Admin") || Roles.IsUserInRole("CampusManager")) {  %>
<li><%= Html.ActionLink("Users management", "Index", "Users") %></li>
<% } %>

<% if(Roles.IsUserInRole("Admin")) {  %>
<li><%= Html.ActionLink("WorldWide Events", "Index", "WorldWideEvents") %></li>
<% } %>

<% if(Roles.IsUserInRole("Admin")) {  %>
<li><%= Html.ActionLink(WebApp.Resources.Views.BackOffice.Shared.Campuses, "Index", "Campuses") %></li>
<% } %>

<% if(Roles.IsUserInRole("Admin")) {  %>
<li><%= Html.ActionLink("Cursuses", "Index", "Cursuses") %></li>
<% } %>