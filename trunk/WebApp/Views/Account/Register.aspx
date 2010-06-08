<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<WebApp.Models.RegisterModel>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    <%:WebApp.Content.i18n.Account.Register.Register1 %>
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%:WebApp.Content.i18n.Account.Register.Title %></h2>
    <p>
        <%:WebApp.Content.i18n.Account.Register.CreateBelow %> 
    </p>
    <p>
        <%:WebApp.Content.i18n.Account.Register.Password1 %><%= Html.Encode(ViewData["PasswordLength"]) %> <%:WebApp.Content.i18n.Account.Register.Password2 %>
    </p>

    <% using (Html.BeginForm()) { %>
        <%= Html.ValidationSummary(true, WebApp.Content.i18n.Account.Register.Fail) %>
        <div>

            <fieldset>
                <legend><%:WebApp.Content.i18n.Account.Register.AccountInfo %></legend>
                
                <div class="editor-label">
                    <%= Html.LabelFor(m => m.FirstName) %>
                </div>
                <div class="editor-field">
                    <%= Html.TextBoxFor(m => m.FirstName)%>
                    <%= Html.ValidationMessageFor(m => m.FirstName)%>
                </div>

                <div class="editor-label">
                    <%= Html.LabelFor(m => m.LastName) %>
                </div>
                <div class="editor-field">
                    <%= Html.TextBoxFor(m => m.LastName)%>
                    <%= Html.ValidationMessageFor(m => m.LastName)%>
                
                <div class="editor-label">
                    <%= Html.LabelFor(m => m.UserName) %>
                </div>
                <div class="editor-field">
                    <%= Html.TextBoxFor(m => m.UserName) %>
                    <%= Html.ValidationMessageFor(m => m.UserName) %>
                </div>
                
                <div class="editor-label">
                    <%= Html.LabelFor(m => m.Email) %>
                </div>
                <div class="editor-field">
                    <%= Html.TextBoxFor(m => m.Email) %>
                    <%= Html.ValidationMessageFor(m => m.Email) %>
                </div>
                
                <div class="editor-label">
                    <%= Html.LabelFor(m => m.Password) %>
                </div>
                <div class="editor-field">
                    <%= Html.PasswordFor(m => m.Password) %>
                    <%= Html.ValidationMessageFor(m => m.Password) %>
                </div>
                
                <div class="editor-label">
                    <%= Html.LabelFor(m => m.ConfirmPassword) %>
                </div>
                <div class="editor-field">
                    <%= Html.PasswordFor(m => m.ConfirmPassword) %>
                    <%= Html.ValidationMessageFor(m => m.ConfirmPassword) %>
                </div>

                <div class="editor-label">
                    <%= Html.LabelFor(m => m.SecurityQuestion) %>
                </div>
                <div class="editor-field">
                    <%= Html.TextBoxFor(m => m.SecurityQuestion)%>
                    <%= Html.ValidationMessageFor(m => m.SecurityQuestion)%>
                </div>

                <div class="editor-label">
                    <%= Html.LabelFor(m => m.SecurityAnswer) %>
                </div>
                <div class="editor-field">
                    <%= Html.TextBoxFor(m => m.SecurityAnswer)%>
                    <%= Html.ValidationMessageFor(m => m.SecurityAnswer)%>
                </div>
                
                <p>
                    <input type="submit" value="<%:WebApp.Content.i18n.Account.Register.Register1 %>" />
                </p>
            </fieldset>

        </div>
    <% } %>
</asp:Content>
