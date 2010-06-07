<%@ Page Title="WebApp.Content.i18n.FrontOffice.MyEvents.DeleteTitle" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DAL.Event>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%:WebApp.Content.i18n.FrontOffice.MyEvents.DeleteTitle %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:WebApp.Content.i18n.FrontOffice.MyEvents.DeleteTitle %></h2>

    <h3><%: WebApp.Content.i18n.Common.DeleteAreYouSure %></h3>
    <fieldset>
        <legend><%:WebApp.Content.i18n.Common.Fields %></legend>
        
        
        <div class="display-label"><%:DAL.Resources.Event.Name %></div>
        <div class="display-field"><%: Model.Name %></div>
        
        <div class="display-label"><%:DAL.Resources.Event.Description %></div>
        <div class="display-field"><%: Model.Description %></div>
        
        <div class="display-label"><%:DAL.Resources.Event.StartDate %></div>
        <div class="display-field"><%: String.Format("{0:g}", Model.StartDate) %></div>
        
        <div class="display-label"><%:DAL.Resources.Event.EndDate %></div>
        <div class="display-field"><%: String.Format("{0:g}", Model.EndDate) %></div>
        
        
    </fieldset>
    <% using (Html.BeginForm()) { %>
        <p>
		    <input type="submit" value="<%: WebApp.Content.i18n.Common.ButtonDelete %>" /> 
        </p>
    <% } %>

</asp:Content>

