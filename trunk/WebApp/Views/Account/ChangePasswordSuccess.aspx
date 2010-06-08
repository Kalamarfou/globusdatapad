<%@Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="changePasswordTitle" ContentPlaceHolderID="TitleContent" runat="server">
    <%:WebApp.Content.i18n.Account.ChangePasswordSuccess.ChangePassword %>
</asp:Content>

<asp:Content ID="changePasswordSuccessContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%:WebApp.Content.i18n.Account.ChangePasswordSuccess.ChangePassword %></h2>
    <p>
        <%:WebApp.Content.i18n.Account.ChangePasswordSuccess.Success %>
    </p>
</asp:Content>
