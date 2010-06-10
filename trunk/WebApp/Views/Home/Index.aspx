<%@ Page Title="WebApp.Content.i18n.Index.Title" Language="C#" MasterPageFile="~/Views/Shared/Site.Master"
    Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%:WebApp.Content.i18n.Index.Title %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%= Html.Encode(ViewData["Message"]) %></h2>
    <p>
        <%:WebApp.Content.i18n.Index.CorrectlyLogged %>
        <br />
        <%:WebApp.Content.i18n.Index.EventsForTheDay%>
    </p>
    <% if(((List<DAL.WorldWideEvent>)ViewData["WorldWideEvents"]).Count != 0)
       { %>
    <p>
        <strong>
            <%:WebApp.Content.i18n.Index.WorldwideEvents%></strong></p>
    <ul>
        <% foreach (DAL.WorldWideEvent e in (List<DAL.WorldWideEvent>)ViewData["WorldWideEvents"])
       { %>
        <li>
            <%: e.Name %></li>
        <% } %>
    </ul>
    <br />
    <%} %>

    <% if (((List<DAL.Event>)ViewData["CampusEvents"]).Count != 0)
       { %>
    <p>
        <strong>
            <%:WebApp.Content.i18n.Index.CampusEvents%></strong></p>
    <ul>
        <% foreach (DAL.Event e in (List<DAL.Event>)ViewData["CampusEvents"])
       { %>
        <li>
            <%: e.Name %></li>
        <% } %>
    </ul>
    <br />
    <%} %>

    <% if (((List<DAL.Event>)ViewData["ClassEvents"]).Count != 0)
       { %>
    <p>
        <strong>
            <%:WebApp.Content.i18n.Index.ClassEvents%></strong></p>
    <ul>
        <% foreach (DAL.Event e in (List<DAL.Event>)ViewData["ClassEvents"])
       { %>
        <li>
            <%: e.Name %></li>
        <% } %>
    </ul>
    <br />
    <%} %>

    <% if (((List<DAL.Event>)ViewData["UserEvents"]).Count != 0)
       { %>
    <p>
        <strong>
            <%:WebApp.Content.i18n.Index.UserEvents%></strong></p>
    <ul>
        <% foreach (DAL.Event e in (List<DAL.Event>)ViewData["UserEvents"])
       { %>
        <li>
            <%: e.Name %></li>
        <% } %>
    </ul>
    <% } %>
</asp:Content>
