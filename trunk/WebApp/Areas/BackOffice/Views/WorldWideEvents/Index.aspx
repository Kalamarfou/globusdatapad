<%@ Page Title="WebApp.Content.i18n.BackOffice.WorldWideEvents.Index" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DAL.WorldWideEvent>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%:WebApp.Content.i18n.BackOffice.WorldWideEvents.Index %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:WebApp.Content.i18n.BackOffice.WorldWideEvents.Index %></h2>

    <table>
        <tr>
            <th>
                <%:DAL.Resources.Event.Name%>
            </th>
            <th>
                <%:DAL.Resources.Event.StartDate%>
            </th>
            <th>
                <%:DAL.Resources.Event.EndDate%>
            </th>
            <th></th>
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
                <%: Html.ActionLink(WebApp.Content.i18n.Common.ButtonEdit, "Edit", new { id=item.Id }) %> |
                <%: Html.ActionLink(WebApp.Content.i18n.Common.ButtonDetails, "Details", new { id=item.Id })%> |
                <%: Html.ActionLink(WebApp.Content.i18n.Common.ButtonDelete, "Delete", new { id=item.Id })%>
            </td>
        </tr>
    
    <% } %>

    </table>

    <p>
        <%: Html.ActionLink(WebApp.Content.i18n.Common.ButtonCreate, "Create") %>
    </p>

</asp:Content>

