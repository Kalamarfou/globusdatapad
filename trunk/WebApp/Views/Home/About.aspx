<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="aboutTitle" ContentPlaceHolderID="TitleContent" runat="server">
    <%:WebApp.Content.i18n.About.AboutUs %>
</asp:Content>

<asp:Content ID="aboutContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%:WebApp.Content.i18n.About.AboutUs %></h2>
    <p>
    <%:WebApp.Content.i18n.About.AboutText %>
    </p>
</asp:Content>
