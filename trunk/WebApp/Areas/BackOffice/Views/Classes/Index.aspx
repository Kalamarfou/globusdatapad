<%@ Page Title="WebApp.Content.i18n.BackOffice.Classes.Index" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DAL.Class>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%:WebApp.Content.i18n.BackOffice.Classes.Index %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:WebApp.Content.i18n.BackOffice.Classes.Index %></h2>

    <table>
        <tr>
            <th>
                <%:DAL.Resources.Class.Name %>
            </th>
            <th></th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: item.Name %>
            </td>
            <td>
                <%: Html.ActionLink(WebApp.Content.i18n.Common.ButtonEdit, "Edit", new { id = item.Id })%> |
                <%: Html.ActionLink(WebApp.Content.i18n.BackOffice.Classes.StudyPeriods, "StudyPeriods", new { id = item.Id })%> |
                <%: Html.ActionLink(WebApp.Content.i18n.Common.ButtonDelete, "Delete", new { id = item.Id })%>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink(WebApp.Content.i18n.Common.ButtonCreate, "Create", new { id = ViewData["campusId"] })%>
    </p>

    <p>
        <%: Html.ActionLink(WebApp.Content.i18n.Common.BackToList, "Index", "Campuses")%>
    </p>

</asp:Content>

