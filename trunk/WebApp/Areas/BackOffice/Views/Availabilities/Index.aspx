<%@ Page Title="WebApp.Content.i18n.BackOffice.Availabilities.Index" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DAL.Availability>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%:WebApp.Content.i18n.BackOffice.Availabilities.Index %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:WebApp.Content.i18n.BackOffice.Availabilities.Index %></h2>

    <table>
        <tr>
            <th></th>
            <th>
                <%:DAL.Resources.Availability.StartDate %>
            </th>
            <th>
                <%:DAL.Resources.Availability.EndDate %>
            </th>

        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: Html.ActionLink(WebApp.Content.i18n.Common.ButtonEdit, "Edit", new { id = item.Id })%> |
                <%: Html.ActionLink(WebApp.Content.i18n.Common.ButtonDetails, "Details", new { id = item.Id })%> |
                <%: Html.ActionLink(WebApp.Content.i18n.Common.ButtonDelete, "Delete", new { id = item.Id })%>
            </td>
            <td>
                <%: String.Format("{0:g}", item.StartDate) %>
            </td>
            <td>
                <%: String.Format("{0:g}", item.EndDate) %>
            </td>
            
        </tr>
    
    <% } %>

    </table>

Page <%=Convert.ToInt32(ViewData["curpage"])%> of <%=ViewData["numpages"] %><br />
<%
   for (int i = 1; i <= Convert.ToInt32(ViewData["numpages"]); i++)
   {
      %> 

      <span><b><%= Html.ActionLink(i.ToString(),"Index","Availabilities",new{page=i},null) %></b></span>

      <% 
   }
%>

    <p>
        <%: Html.ActionLink(WebApp.Content.i18n.Common.ButtonCreate, "Create")%>
    </p>

</asp:Content>

