<%@ Page Title="WebApp.Content.i18n.BackOffice.Venues.DeleteTitle" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<DAL.Venue>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%:WebApp.Content.i18n.BackOffice.Venues.DeleteTitle %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:WebApp.Content.i18n.BackOffice.Venues.DeleteTitle %></h2>

    <h3><%:WebApp.Content.i18n.Common.DeleteAreYouSure %></h3>
    <fieldset>
        <legend><%:WebApp.Content.i18n.Common.Fields %></legend>


        <div class="display-label"><%:DAL.Resources.Venue.Name %></div>
        <div class="display-field"><%: Model.Name %></div>
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="<%:WebApp.Content.i18n.Common.ButtonDelete %>" /> |
		    <%: Html.ActionLink(WebApp.Content.i18n.Common.BackToList, "Index") %>
        </p>
    <% } %>

</asp:Content>

