<%@ Page Title="WebApp.Content.i18n.BackOffice.Users.Index" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DAL.User>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%:WebApp.Content.i18n.BackOffice.Users.Index%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:WebApp.Content.i18n.BackOffice.Users.Index%></h2>

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
                <%: Html.ActionLink(WebApp.Content.i18n.Common.ButtonEdit, "Edit", new { id=item.Id }) %> |
                <%: Html.ActionLink(WebApp.Content.i18n.Common.ButtonDetails, "Details", new { id = item.Id })%> |
                <%: Html.ActionLink(WebApp.Content.i18n.Common.ButtonDelete, "Delete", new { id = item.Id })%>
            </td>
        </tr>
    
    <% } %>

    </table>

Page <%=Convert.ToInt32(ViewData["curpage"])%> of <%=ViewData["numpages"] %><br />
<%
   for (int i = 1; i <= Convert.ToInt32(ViewData["numpages"]); i++)
   {
      %> 

      <span><b><%= Html.ActionLink(i.ToString(),"Index","Users",new{page=i},null) %></b></span>

      <% 
   }
%>
    <p>
       <h2> <%: Html.ActionLink(WebApp.Content.i18n.BackOffice.Users.ViewAll, "Index")%></h2>
    </p>

    <p><strong><%:WebApp.Content.i18n.BackOffice.Users.AccountCreation%></strong><%:WebApp.Content.i18n.BackOffice.Users.AccountApprobation%> </p>

</asp:Content>

