<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<WebApp.Models.ChangePasswordModel>" %>

<asp:Content ID="changePasswordTitle" ContentPlaceHolderID="TitleContent" runat="server">
    <%:WebApp.Content.i18n.Account.ChangePassword.ChangePassword1 %>
</asp:Content>

<asp:Content ID="changePasswordContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%:WebApp.Content.i18n.Account.ChangePassword.ChangePassword1 %></h2>
    <p>
        <%:WebApp.Content.i18n.Account.ChangePassword.ChangeBelow %>
    </p>
    <p>
        <%:WebApp.Content.i18n.Account.ChangePassword.Password1 %> <%= Html.Encode(ViewData["PasswordLength"]) %> <%:WebApp.Content.i18n.Account.ChangePassword.Password2 %>
    </p>

    <% using (Html.BeginForm()) { %>
        <%= Html.ValidationSummary(true, WebApp.Content.i18n.Account.ChangePassword.Fail)%>
        <div>
            <fieldset>
                <legend>Account Information</legend>
                
                <div class="editor-label">
                    <%= Html.LabelFor(m => m.OldPassword) %>
                </div>
                <div class="editor-field">
                    <%= Html.PasswordFor(m => m.OldPassword) %>
                    <%= Html.ValidationMessageFor(m => m.OldPassword) %>
                </div>
                
                <div class="editor-label">
                    <%= Html.LabelFor(m => m.NewPassword) %>
                </div>
                <div class="editor-field">
                    <%= Html.PasswordFor(m => m.NewPassword) %>
                    <%= Html.ValidationMessageFor(m => m.NewPassword) %>
                </div>
                
                <div class="editor-label">
                    <%= Html.LabelFor(m => m.ConfirmPassword) %>
                </div>
                <div class="editor-field">
                    <%= Html.PasswordFor(m => m.ConfirmPassword) %>
                    <%= Html.ValidationMessageFor(m => m.ConfirmPassword) %>
                </div>
                
                <p>
                    <input type="submit" value="<%:WebApp.Content.i18n.Account.ChangePassword.ChangePassword1 %>" />
                </p>
            </fieldset>
        </div>
    <% } %>
</asp:Content>
