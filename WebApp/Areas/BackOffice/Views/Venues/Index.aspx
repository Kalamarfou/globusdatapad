<%@ Page Title="WebApp.Content.i18n.BackOffice.Venues.Index" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DAL.Venue>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%:WebApp.Content.i18n.BackOffice.Venues.Index %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:WebApp.Content.i18n.BackOffice.Venues.VenuesForCampus %> <%: ViewData["campusName"] %></h2>
    <% if (Convert.ToInt32(ViewData["numpages"]) != 0)
       {%>
    <table>
        <tr>
            <th>
                <%:DAL.Resources.Venue.Name %>
            </th>
            <th></th>
        </tr>

    <% foreach (var item in Model) { %>
    
        <tr>
            <td>
                <%: item.Name %>
            </td>
            <td>
                <%: Html.ActionLink(WebApp.Content.i18n.Common.ButtonEdit, "Edit", new { id=item.Id }) %> |
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

              <span><b><%= Html.ActionLink(i.ToString(),"Index","Venues",new{id=ViewData["campusId"], page=i},null) %></b></span>

              <% 
           }
        %>
    <%}
    else
	    {%>
          <%:  WebApp.Content.i18n.BackOffice.Venues.NoItems%>
	    <%}        
         %>
    <p>
    <%: Html.ActionLink(WebApp.Content.i18n.BackOffice.Venues.BackToCampus, "Index", "Campuses")%>
</p>


    <p>
        <%: Html.ActionLink(WebApp.Content.i18n.Common.ButtonCreate, "Create", new { id=ViewData["campusId"] })%>
    </p>

</asp:Content>

