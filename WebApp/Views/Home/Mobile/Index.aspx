<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Mobile.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Home Page
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%= Html.Encode(ViewData["Message"]) %></h2>
    <p>
    You are correcty logged.

    Events for the day.
    </p>

    <p><strong>WorldWide Events in the next 10 days.</strong></p>
    <ul>
    <% foreach (DAL.WorldWideEvent e in (List<DAL.WorldWideEvent>)ViewData["WorldWideEvents"])
       { %>
       <li><%: e.Name %></li>

    <% } %>
    </ul>
    <p>
        To learn more about ASP.NET MVC visit <a href="http://asp.net/mvc" title="ASP.NET MVC Website">http://asp.net/mvc</a>.
    </p>
</asp:Content>
