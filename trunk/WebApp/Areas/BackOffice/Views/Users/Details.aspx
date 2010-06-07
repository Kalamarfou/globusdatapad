<%@ Page Title="WebApp.Content.i18n.BackOffice.Cursuses.DetailsTitle" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<DAL.User>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%:WebApp.Content.i18n.BackOffice.Users.DetailsTitle%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:WebApp.Content.i18n.BackOffice.Users.DetailsTitle%></h2>

    <fieldset>
        <legend><%:WebApp.Content.i18n.Common.Fields %></legend>
        
        <div class="display-label"><%:DAL.Resources.User.Username %></div>
        <div class="display-field"><%: Model.Username %></div>
        
        <div class="display-label"><%:DAL.Resources.User.IsApproved %></div>
        <div class="display-field"><%: Model.IsApproved %></div>

        <div class="display-label"><%:DAL.Resources.User.FirstName%></div>
        <div class="display-field"><%: Model.FirstName %></div>
        
        <div class="display-label"><%:DAL.Resources.User.LastName%></div>
        <div class="display-field"><%: Model.LastName %></div>
        
        <div class="display-label"><%:DAL.Resources.User.Email%></div>
        <div class="display-field"><%: Model.Email %></div>
        
        <div class="display-label"><%:DAL.Resources.User.Title%></div>
        <div class="display-field"><%: Model.Title %></div>
        
        <div class="display-label"><%:WebApp.Content.i18n.BackOffice.Users.LastActivityDate%></div>
        <div class="display-field"><%: String.Format("{0:g}", Model.LastActivityDate) %></div>
        
        <div class="display-label"><%:WebApp.Content.i18n.BackOffice.Users.LastLoginDate%></div>
        <div class="display-field"><%: String.Format("{0:g}", Model.LastLoginDate) %></div>
        
        <div class="display-label"><%:WebApp.Content.i18n.BackOffice.Users.LastPasswordChangedDate%></div>
        <div class="display-field"><%: String.Format("{0:g}", Model.LastPasswordChangedDate) %></div>
        
        <div class="display-label"><%:WebApp.Content.i18n.BackOffice.Users.IsOnline%></div>
        <div class="display-field"><%: Model.IsOnline %></div>
        
        <div class="display-label"><%:DAL.Resources.User.IsLockedOut%></div>
        <div class="display-field"><%: Model.IsLockedOut %></div>
        
        <div class="display-label"><%:WebApp.Content.i18n.BackOffice.Users.LastLockedOutDate%></div>
        <div class="display-field"><%: String.Format("{0:g}", Model.LastLockedOutDate) %></div>
        
        <div class="display-label"><%:WebApp.Content.i18n.BackOffice.Users.FailedPasswordAttemptCount%></div>
        <div class="display-field"><%: Model.FailedPasswordAttemptCount %></div>
        
        <div class="display-label"><%:WebApp.Content.i18n.BackOffice.Users.FailedPasswordAttemptWindowStart%></div>
        <div class="display-field"><%: String.Format("{0:g}", Model.FailedPasswordAttemptWindowStart) %></div>
        
        <div class="display-label"><%:WebApp.Content.i18n.BackOffice.Users.FailedPasswordAnswerAttemptCount%></div>
        <div class="display-field"><%: Model.FailedPasswordAnswerAttemptCount %></div>
        
        <div class="display-label"><%:WebApp.Content.i18n.BackOffice.Users.FailedPasswordAnswerAttemptWindowStart%></div>
        <div class="display-field"><%: String.Format("{0:g}", Model.FailedPasswordAnswerAttemptWindowStart) %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink(WebApp.Content.i18n.Common.ButtonEdit, "Edit", new { id=Model.Id }) %> |
        <%: Html.ActionLink(WebApp.Content.i18n.Common.BackToList, "Index")%>
    </p>

</asp:Content>

