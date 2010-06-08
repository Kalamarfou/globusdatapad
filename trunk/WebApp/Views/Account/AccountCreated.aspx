<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%:WebApp.Content.i18n.Account.AccountCreated.AccountCreated1 %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:WebApp.Content.i18n.Account.AccountCreated.AccountCreated1 %></h2>

    <p><%:WebApp.Content.i18n.Account.AccountCreated.Success %></p>

</asp:Content>
