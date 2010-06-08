<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<% if(Roles.IsUserInRole("Admin") || Roles.IsUserInRole("CampusManager")) {  %>
<li><%= Html.ActionLink(WebApp.Content.i18n.BackOffice.BackOfficeMaster.UsersManagement, "Index", "Users")%></li>
<% } %>

<% if(Roles.IsUserInRole("Admin")) {  %>
<li><%= Html.ActionLink(WebApp.Content.i18n.BackOffice.BackOfficeMaster.WorldWideEvents, "Index", "WorldWideEvents")%></li>
<% } %>

<% if(Roles.IsUserInRole("Admin")) {  %>
<li><%= Html.ActionLink(WebApp.Content.i18n.BackOffice.BackOfficeMaster.Campuses, "Index", "Campuses")%></li>
<% } %>

<% if(Roles.IsUserInRole("Admin")) {  %>
<li><%= Html.ActionLink(WebApp.Content.i18n.BackOffice.BackOfficeMaster.Cursuses, "Index", "Cursuses")%></li>
<% } %>

<% if (Roles.IsUserInRole("Stakeholder")){  %>
<li><%= Html.ActionLink(WebApp.Content.i18n.BackOffice.BackOfficeMaster.Availabilities, "Index", "Availabilities")%></li>
<% } %>