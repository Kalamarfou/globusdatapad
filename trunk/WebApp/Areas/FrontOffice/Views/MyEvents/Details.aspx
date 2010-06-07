<%@ Page Title="WebApp.Content.i18n.FrontOffice.MyEvents.DetailsTitle" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DAL.Event>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%:WebApp.Content.i18n.FrontOffice.MyEvents.DetailsTitle %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:WebApp.Content.i18n.FrontOffice.MyEvents.DetailsTitle %></h2>

    <fieldset>
        <legend><%:WebApp.Content.i18n.Common.Fields %></legend>
        
        <div class="display-label"><%:WebApp.Content.i18n.FrontOffice.MyEvents.Name %></div>
        <div class="display-field"><%: Model.Name %></div>
        <br />
        <div class="display-label"><%:WebApp.Content.i18n.FrontOffice.MyEvents.Description %></div>
        <div class="display-field"><%: Model.Description %></div>
        <br />
        <div class="display-label"><%:WebApp.Content.i18n.FrontOffice.MyEvents.StartDate %></div>
        <div class="display-field"><%: String.Format("{0:g}", Model.StartDate) %></div>
        <br />
        <div class="display-label"><%:WebApp.Content.i18n.FrontOffice.MyEvents.EndDate %></div>
        <div class="display-field"><%: String.Format("{0:g}", Model.EndDate) %></div>
        
        
    </fieldset>
    <p>

        <%: Html.ActionLink(WebApp.Content.i18n.Common.Edit, "Edit", new { id = Model.Id })%>
    </p>

</asp:Content>

