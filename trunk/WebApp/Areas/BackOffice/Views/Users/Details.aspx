<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<DAL.User>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Details</h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">Username</div>
        <div class="display-field"><%: Model.Username %></div>
        
        <div class="display-label">IsApproved</div>
        <div class="display-field"><%: Model.IsApproved %></div>

        <div class="display-label">FirstName</div>
        <div class="display-field"><%: Model.FirstName %></div>
        
        <div class="display-label">LastName</div>
        <div class="display-field"><%: Model.LastName %></div>
        
        <div class="display-label">Email</div>
        <div class="display-field"><%: Model.Email %></div>
        
        <div class="display-label">Title</div>
        <div class="display-field"><%: Model.Title %></div>
        
        <div class="display-label">LastActivityDate</div>
        <div class="display-field"><%: String.Format("{0:g}", Model.LastActivityDate) %></div>
        
        <div class="display-label">LastLoginDate</div>
        <div class="display-field"><%: String.Format("{0:g}", Model.LastLoginDate) %></div>
        
        <div class="display-label">LastPasswordChangedDate</div>
        <div class="display-field"><%: String.Format("{0:g}", Model.LastPasswordChangedDate) %></div>
        
        <div class="display-label">IsOnline</div>
        <div class="display-field"><%: Model.IsOnline %></div>
        
        <div class="display-label">IsLockedOut</div>
        <div class="display-field"><%: Model.IsLockedOut %></div>
        
        <div class="display-label">LastLockedOutDate</div>
        <div class="display-field"><%: String.Format("{0:g}", Model.LastLockedOutDate) %></div>
        
        <div class="display-label">FailedPasswordAttemptCount</div>
        <div class="display-field"><%: Model.FailedPasswordAttemptCount %></div>
        
        <div class="display-label">FailedPasswordAttemptWindowStart</div>
        <div class="display-field"><%: String.Format("{0:g}", Model.FailedPasswordAttemptWindowStart) %></div>
        
        <div class="display-label">FailedPasswordAnswerAttemptCount</div>
        <div class="display-field"><%: Model.FailedPasswordAnswerAttemptCount %></div>
        
        <div class="display-label">FailedPasswordAnswerAttemptWindowStart</div>
        <div class="display-field"><%: String.Format("{0:g}", Model.FailedPasswordAnswerAttemptWindowStart) %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Edit", "Edit", new { id=Model.Id }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

