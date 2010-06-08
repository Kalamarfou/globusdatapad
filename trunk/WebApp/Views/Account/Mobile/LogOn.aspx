<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Mobile.Master" Inherits="System.Web.Mvc.ViewPage<WebApp.Models.LogOnModel>" %>

<asp:Content ID="loginTitle" ContentPlaceHolderID="TitleContent" runat="server">
    <%: WebApp.Content.i18n.Account.LogOn.LogOn1%>
</asp:Content>

<asp:Content ID="loginContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: WebApp.Content.i18n.Account.LogOn.LogOn1%></h2>
    <p>
        <%: WebApp.Content.i18n.Account.LogOn.Password1 %>
    </p>

    <% using (Html.BeginForm()) { %>
        <%= Html.ValidationSummary(true, WebApp.Content.i18n.Account.LogOn.Fail)%>
        <div>
            <fieldset>
                <legend><%: WebApp.Content.i18n.Account.LogOn.AccountInfo %></legend>
                
                <div class="editor-label">
                    <%= Html.LabelFor(m => m.UserName) %>
                </div>
                <div class="editor-field">
                    <%= Html.TextBoxFor(m => m.UserName) %>
                    <%= Html.ValidationMessageFor(m => m.UserName) %>
                </div>
                
                <div class="editor-label">
                    <%= Html.LabelFor(m => m.Password) %>
                </div>
                <div class="editor-field">
                    <%= Html.PasswordFor(m => m.Password) %>
                    <%= Html.ValidationMessageFor(m => m.Password) %>
                </div>
                
                <div class="editor-label">
                    <%= Html.CheckBoxFor(m => m.RememberMe) %>
                    <%= Html.LabelFor(m => m.RememberMe) %>
                </div>
                
                <p>
                    <input type="submit" value="<%: WebApp.Content.i18n.Account.LogOn.LogOn1 %>" />
                </p>
            </fieldset>
        </div>
    <% } %>
</asp:Content>
