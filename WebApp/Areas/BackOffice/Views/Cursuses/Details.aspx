<%@ Page Title="WebApp.Content.i18n.BackOffice.Cursuses.DetailsTitle" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<DAL.Cursus>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%:WebApp.Content.i18n.BackOffice.Cursuses.DetailsTitle %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:WebApp.Content.i18n.BackOffice.Cursuses.DetailsTitle %></h2>

    <fieldset>
        <legend><%:WebApp.Content.i18n.Common.Fields %></legend>
        
        <div class="display-label"><%:WebApp.Content.i18n.BackOffice.Cursuses.CursusId%></div>
        <div class="display-field"><%: Model.Id %></div>
        
        <div class="display-label"><%:DAL.Resources.Cursus.Name%></div>
        <div class="display-field"><%: Model.Name %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink(WebApp.Content.i18n.Common.ButtonEdit, "Edit", new { id=Model.Id }) %> |
        <%: Html.ActionLink(WebApp.Content.i18n.Common.BackToList, "Index") %>
    </p>

</asp:Content>

