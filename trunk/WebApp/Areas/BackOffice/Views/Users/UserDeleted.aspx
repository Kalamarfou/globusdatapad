﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%:WebApp.Content.i18n.BackOffice.Users.UserDeleted %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:WebApp.Content.i18n.BackOffice.Users.UserDeleted %></h2>

    <p><%:WebApp.Content.i18n.BackOffice.Users.Success %></p>

    <p><%= Html.ActionLink(WebApp.Content.i18n.SiteMaster.Home, "Index", "Home", new { Area = "" }, null)%></p>

</asp:Content>
