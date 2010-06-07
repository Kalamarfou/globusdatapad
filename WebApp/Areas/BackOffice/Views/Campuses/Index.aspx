<%@ Page Title="WebApp.Content.i18n.BackOffice.Campuses.Index" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DAL.Campus>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%:WebApp.Content.i18n.BackOffice.Campuses.Index %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%= WebApp.Content.i18n.BackOffice.Campuses.Index%></h2>

    <table>
        <tr>
            <th><%= DAL.Resources.Campus.Name %></th>
            <th><%= DAL.Resources.Address.City%></th>
            <th><%= DAL.Resources.Address.Country%></th>
            <th></th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: item.Name %>
            </td>
            <td>
                <%: item.Address.City %>
            </td>
            <td>
                <%: item.Address.Country %>
            </td>
            <td>
                <%: Html.ActionLink(WebApp.Content.i18n.Common.ButtonEdit, "Edit", new { id=item.Id }) %> |
                <%: Html.ActionLink(WebApp.Content.i18n.Common.ButtonDetails, "Details", new { id = item.Id })%> |
                <%: Html.ActionLink(WebApp.Content.i18n.Common.ButtonDelete, "Delete", new { id = item.Id })%>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink(WebApp.Content.i18n.Common.ButtonCreate, "Create")%>
    </p>

</asp:Content>

