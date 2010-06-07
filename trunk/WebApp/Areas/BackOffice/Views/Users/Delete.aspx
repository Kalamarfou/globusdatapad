<%@ Page Title="WebApp.Content.i18n.BackOffice.Users.DeleteTitle" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<DAL.User>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%:WebApp.Content.i18n.BackOffice.Users.DeleteTitle  %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:WebApp.Content.i18n.BackOffice.Users.DeleteTitle  %></h2>

    <h3><%:WebApp.Content.i18n.Common.DeleteAreYouSure %></h3>
    <fieldset>
        <legend><%:WebApp.Content.i18n.Common.Fields %></legend>
        
        <div class="display-label"><%:DAL.Resources.User.Username %></div>
        <div class="display-field"><%: Model.Username %></div>
        
        <div class="display-label"><%:DAL.Resources.User.FirstName %></div>
        <div class="display-field"><%: Model.FirstName %></div>
        
        <div class="display-label"><%:DAL.Resources.User.LastName %></div>
        <div class="display-field"><%: Model.LastName %></div>
        
        <div class="display-label"><%:DAL.Resources.User.Email %></div>
        <div class="display-field"><%: Model.Email %></div>
        
        <div class="display-label"><%:DAL.Resources.User.Title %></div>
        <div class="display-field"><%: Model.Title %></div>
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="<%:WebApp.Content.i18n.Common.ButtonDelete %>" /> |
		    <%: Html.ActionLink(WebApp.Content.i18n.Common.BackToList, "Index")%>
        </p>
    <% } %>

</asp:Content>

