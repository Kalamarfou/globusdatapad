<%@ Page Title="WebApp.Content.i18n.BackOffice.Users.Managers" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master"
    Inherits="System.Web.Mvc.ViewPage<IEnumerable<DAL.User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%:WebApp.Content.i18n.BackOffice.Users.Managers%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%:WebApp.Content.i18n.BackOffice.Users.Managers%></h2>
    <table>
        <tr>
            <th>
                <%: DAL.Resources.User.Username %>
            </th>
            <th>
                <%: DAL.Resources.User.FirstName %>
            </th>
            <th>
                <%: DAL.Resources.User.LastName %>
            </th>
            <th>
                <%: DAL.Resources.User.Title %>
            </th>
            <th>
                <%: DAL.Resources.User.Email %>
            </th>
        </tr>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: item.Username %>
            </td>
            <td>
                <%: item.FirstName %>
            </td>
            <td>
                <%: item.LastName %>
            </td>
            <td>
                <%: item.Title %>
            </td>
            <td>
                <%: item.Email %>
            </td>
        </tr>
        <% } %>
    </table>
    <br />
    <% Html.BeginForm();
       { %>
    <% if (((IEnumerable<SelectListItem>)ViewData["campusManagers"]).Count() == 0)
       {
       %>
       <%:WebApp.Content.i18n.BackOffice.Users.NoMoreManagers%>
       <%}
       else
       {
    %>
    <%:WebApp.Content.i18n.BackOffice.Users.UserManagerRoles%>
    <%: Html.DropDownList("AddManager", (IEnumerable<SelectListItem>)ViewData["campusManagers"])%>
    <p>
        <input type="submit" value="<%:WebApp.Content.i18n.BackOffice.Users.AddManager%>" /></p>
    <%   
        } %>
    <% } %>
</asp:Content>
