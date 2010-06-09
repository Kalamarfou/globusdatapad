<%@ Page Title="WebApp.Content.i18n.BackOffice.Users.RolesTitle" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%:WebApp.Content.i18n.BackOffice.Users.RolesTitle%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:WebApp.Content.i18n.BackOffice.Users.RolesTitle%></h2>

    
    <% using (Html.BeginForm()) {%>
    

    <% if ((bool)ViewData["isAdmin"])
       { %>
        <%= Html.CheckBox("Admin", true)%>
    <% }
       else
       { %>
        <%= Html.CheckBox("Admin", false)%>
    <% } %>
    <%:WebApp.Content.i18n.BackOffice.Users.RoleAdmin%>
    <br />
    <% if ((bool)ViewData["isStudent"])
       { %>
        <%= Html.CheckBox("Student", true)%>
    <% }
       else
       { %>
        <%= Html.CheckBox("Student", false)%>
    <% } %>
    <%:WebApp.Content.i18n.BackOffice.Users.RoleStudent%>
    <br />
    <% if ((bool)ViewData["isStakeholder"])
       { %>
        <%= Html.CheckBox("Stakeholder", true)%>
    <% }
       else
       { %>
        <%= Html.CheckBox("Stakeholder", false)%>
    <% } %>
    <%:WebApp.Content.i18n.BackOffice.Users.RoleStakeHolder%>
    <br />
    <% if ((bool)ViewData["isCampusManager"])
       { %>
        <%= Html.CheckBox("CampusManager", true)%>
    <% }
       else
       { %>
        <%= Html.CheckBox("CampusManager", false)%>
    <% } %>
    <%:WebApp.Content.i18n.BackOffice.Users.RoleCampusManager%>
    <br />
            <p>
                <input type="submit" value="<%:WebApp.Content.i18n.Common.Save %>" />
            </p>
        
        <div>
        <%: Html.ActionLink(WebApp.Content.i18n.Common.BackToList, "Index") %>
        </div>
    <% } %>


</asp:Content>
