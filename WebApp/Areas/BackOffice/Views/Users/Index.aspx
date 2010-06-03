<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DAL.User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <table>
        <tr>
            <th>
                FirstName
            </th>
            <th>
                LastName
            </th>
            <th>
                Username
            </th>
            <th>
                Email
            </th>
            <th>
                Title
            </th>
            <th>
                IsApproved
            </th>
            <th>
                IsOnline
            </th>
            <th>
                IsLockedOut
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: item.FirstName %>
            </td>
            <td>
                <%: item.LastName %>
            </td>
            <td>
                <%: item.Username %>
            </td>
            <td>
                <%: item.Email %>
            </td>
            <td>
                <%: item.Title %>
            </td>
            <td>
                <%: item.IsApproved %>
            </td>
            <td>
                <%: item.IsOnline %>
            </td>
            <td>
                <%: item.IsLockedOut %>
            </td>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { id=item.Id }) %> |
                <%: Html.ActionLink("Details", "Details", new { id=item.Id })%> |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.Id })%>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>User must create himself his account on the front office. It must then be approved in the back office.</p>

</asp:Content>

