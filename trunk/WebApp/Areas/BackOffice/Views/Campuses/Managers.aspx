<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DAL.User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Managers
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Managers</h2>

    <table>
        <tr>
            <th>
                Username
            </th>
            <th>
                FirstName
            </th>
            <th>
                LastName
            </th>
            <th>
                Title
            </th>
            <th>
                Email
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
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

    Users having the campusmanager role: <%: Html.DropDownList("AddManager", (IEnumerable<SelectListItem>)ViewData["campusManagers"])%>

    <p><input type="submit" value="Add to managers of this campus" /></p>

    <% } %>

</asp:Content>

