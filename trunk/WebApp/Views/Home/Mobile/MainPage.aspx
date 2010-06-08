<%@ Page Title="WebApp.Content.i18n.Index.Title" Language="C#" MasterPageFile="~/Views/Shared/Mobile.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%:WebApp.Content.i18n.Index.Title %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%= Html.Encode(ViewData["Message"]) %></h2>
    <p>
    <%:WebApp.Content.i18n.Index.CorrectlyLogged %>
    <br />
    <%:WebApp.Content.i18n.Index.EventsForTheDay%>
    </p>

    <p><strong><%:WebApp.Content.i18n.Index.WorldwideEvents%></strong></p>
    <ul>
    <% foreach (DAL.WorldWideEvent e in (List<DAL.WorldWideEvent>)ViewData["WorldWideEvents"])
       { %>
       <li><%: e.Name %></li>

    <% } %>
    </ul>
</asp:Content>
