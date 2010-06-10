<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DAL.StudyPeriod>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>StudyPeriods for cursus <%: ViewData["cursusName"] %></h2>

    <table>
        <tr>
            <th>
                Name
            </th>
            <th>
                StartDate
            </th>
            <th>
                EndDate
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: item.Name %>
            </td>
            <td>
                <%: String.Format("{0:g}", item.StartDate) %>
            </td>
            <td>
                <%: String.Format("{0:g}", item.EndDate) %>
            </td>
            <td>
                <%: Html.ActionLink("Edit", "Edit", new { id=item.Id }) %> |
                <%: Html.ActionLink("Delete", "Delete", new { id=item.Id })%>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink("Create New", "Create", new { id = ViewData["cursusId"] })%>
    </p>
    <p>
        <%: Html.ActionLink("Back to cursuses", "Index", "Cursuses") %>
    </p>

</asp:Content>

