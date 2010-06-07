<%@ Page Title="WebApp.Content.i18n.BackOffice.Campuses.DetailsTitle" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<DAL.Campus>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%:WebApp.Content.i18n.BackOffice.Campuses.DetailsTitle %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:WebApp.Content.i18n.BackOffice.Campuses.DetailsMessage %><%:Model.Id %></h2>

    <fieldset>
        <legend><%:WebApp.Content.i18n.Common.Fields %></legend>
        
        <div class="display-label"><%:DAL.Resources.Campus.Name %></div>
        <div class="display-field"><%: Model.Name %></div>

        <%= Html.DisplayFor(m => m.Address, "AddressVisualization") %>
        
        <div class="display-label"><%:WebApp.Content.i18n.Common.CreatedAt %></div>
        <div class="display-field"><%: String.Format("{0:g}", Model.Common.Audit.CreatedAt)%></div>
        
        <div class="display-label"><%:WebApp.Content.i18n.Common.CreatedBy %></div>
        <div class="display-field"><%: Model.Common.Audit.CreatedBy%></div>
        
        <div class="display-label"><%:WebApp.Content.i18n.Common.ModifiedAt %></div>
        <div class="display-field"><%: String.Format("{0:g}", Model.Common.Audit.LastModifiedAt)%></div>
        
        <div class="display-label"><%:WebApp.Content.i18n.Common.ModifiedBy %></div>
        <div class="display-field"><%: Model.Common.Audit.LastModifiedBy%></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink(WebApp.Content.i18n.Common.Edit, "Edit", new { id=Model.Id }) %> |
        <%: Html.ActionLink(WebApp.Content.i18n.Common.BackToList, "Index") %>
    </p>

</asp:Content>

