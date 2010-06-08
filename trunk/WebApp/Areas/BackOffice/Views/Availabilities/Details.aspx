<%@ Page Title="WebApp.Content.i18n.BackOffice.Availabilities.DetailsTitle" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<DAL.Availability>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%:WebApp.Content.i18n.BackOffice.Availabilities.DetailsTitle %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:WebApp.Content.i18n.BackOffice.Availabilities.DetailsTitle %></h2>

    <fieldset>
        <legend><%:WebApp.Content.i18n.Common.Fields %></legend>
        
        
        <div class="display-label"><%:DAL.Resources.Availability.StartDate %></div>
        <div class="display-field"><%: String.Format("{0:g}", Model.StartDate)%></div>
        
        <div class="display-label"><%:DAL.Resources.Availability.EndDate %></div>
        <div class="display-field"><%: String.Format("{0:g}", Model.EndDate)%></div>
        
        
    </fieldset>
    <p>

        <%: Html.ActionLink(WebApp.Content.i18n.Common.ButtonEdit, "Edit", new { id = Model.Id })%> |
        <%: Html.ActionLink(WebApp.Content.i18n.Common.BackToList, "Index")%>
    </p>

</asp:Content>

