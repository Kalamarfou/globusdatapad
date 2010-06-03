<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DAL.User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <table>
        <tr>
            <th>
                <%: DAL.Resources.User.FirstName %>
            </th>
            <th>
                <%: DAL.Resources.User.LastName %>
            </th>
            <th>
                <%: DAL.Resources.User.Username %>
            </th>
            <th>
                <%: DAL.Resources.User.Email %>
            </th>
            <th>
                <%: DAL.Resources.User.Title %>
            </th>
            <th>
                <%: DAL.Resources.User.IsApproved %>
            </th>
            <th>
                <%: DAL.Resources.User.IsLockedOut %>
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

Page <%=Convert.ToInt32(ViewData["curpage"]) + 1 %> of <%=ViewData["numpages"] %><br />
<%
   for (int i = 1; i <= Convert.ToInt32(ViewData["numpages"]); i++)
   {
      %> 

      <span><b><%= Html.ActionLink(i.ToString(),"Index","Users",new{page=i},null) %></b></span>

      <% 
   }
%>

    <p>User must create himself his account on the front office. It must then be approved in the back office.</p>

</asp:Content>

