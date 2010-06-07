<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<DAL.WorldWideEvent>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%:WebApp.Content.i18n.BackOffice.WorldWideEvents.DetailsTitle %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:WebApp.Content.i18n.BackOffice.WorldWideEvents.DetailsTitle%></h2>

    <fieldset>
        <legend><%:WebApp.Content.i18n.Common.Fields %></legend>
        
        <div class="display-label"><%:DAL.Resources.Event.Name%></div>
        <div class="display-field"><%: Model.Name %></div>
        
        <div class="display-label"><%:DAL.Resources.Event.Description%></div>
        <div class="display-field"><%: Model.Description %></div>
        
        <div class="display-label"><%:DAL.Resources.Event.StartDate%></div>
        <div class="display-field"><%: String.Format("{0:g}", Model.StartDate) %></div>
        
        <div class="display-label"><%:DAL.Resources.Event.EndDate%></div>
        <div class="display-field"><%: String.Format("{0:g}", Model.EndDate) %></div>
        
        <div class="display-label"><%:WebApp.Content.i18n.BackOffice.WorldWideEvents.IsMandatory%></div>
        <div class="display-field"><%: Model.IsMandatory %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink(WebApp.Content.i18n.Common.ButtonEdit, "Edit", new { id = Model.Id })%> |
        <%: Html.ActionLink(WebApp.Content.i18n.Common.BackToList, "Index")%>
    </p>

</asp:Content>

