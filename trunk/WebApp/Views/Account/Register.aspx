﻿<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<WebApp.Models.RegisterModel>" %>

<asp:Content ID="registerTitle" ContentPlaceHolderID="TitleContent" runat="server">
    Register
</asp:Content>

<asp:Content ID="registerContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Create a New Account</h2>
    <p>
        Use the form below to create a new account. 
    </p>
    <p>
        Passwords are required to be a minimum of <%= Html.Encode(ViewData["PasswordLength"]) %> characters in length.
    </p>

    <% using (Html.BeginForm()) { %>
        <%= Html.ValidationSummary(true, "Account creation was unsuccessful. Please correct the errors and try again.") %>
        <div>

            <fieldset>
                <legend>Account Information</legend>
                
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
                    <input type="submit" value="Register" />
                </p>
            </fieldset>

        </div>
    <% } %>
</asp:Content>