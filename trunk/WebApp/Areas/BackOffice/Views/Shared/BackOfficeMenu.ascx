<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<% if(Roles.IsUserInRole("Admin")) {  %>
<li><%= Html.ActionLink("WorldWide Events", "Index", "WorldWideEvents") %></li>
<li><%= Html.ActionLink(WebApp.Resources.Views.BackOffice.Shared.Campuses, "Index", "Campuses") %></li>
<li><%= Html.ActionLink("Cursuses", "Index", "Cursuses") %></li>
<% } %>