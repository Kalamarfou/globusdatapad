<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DAL.Campus>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%= WebApp.Resources.Views.BackOffice.Campuses.Index %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%= WebApp.Resources.Views.BackOffice.Campuses.Index %></h2>

    <table>
        <tr>
            <th><%= WebApp.Resources.Models.Campus.Campus.Name %></th>
            <th><%= WebApp.Resources.Models.Address.Address.City %></th>
            <th><%= WebApp.Resources.Models.Address.Address.Country %></th>
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
                <%: Html.ActionLink(WebApp.Resources.Views.BackOffice.Shared.Edit, "Edit", new { id=item.CampusID }) %> |
                <%: Html.ActionLink(WebApp.Resources.Views.BackOffice.Shared.Details, "Details", new { id = item.CampusID })%> |
                <%: Html.ActionLink(WebApp.Resources.Views.BackOffice.Shared.Delete, "Delete", new { id = item.CampusID })%>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink(WebApp.Resources.Views.BackOffice.Shared.Create, "Create")%>
    </p>

</asp:Content>

