<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<DAL.Campus>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Details
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Details about Campus #<%:Model.CampusID %></h2>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">Name</div>
        <div class="display-field"><%: Model.Name %></div>

        <%= Html.DisplayFor(m => m.Address, "AddressVisualization") %>
        
        <div class="display-label">CreatedAt</div>
        <div class="display-field"><%: String.Format("{0:g}", Model.CreatedAt) %></div>
        
        <div class="display-label">CreatedBy</div>
        <div class="display-field"><%: Model.CreatedBy %></div>
        
        <div class="display-label">ModifiedAt</div>
        <div class="display-field"><%: String.Format("{0:g}", Model.ModifiedAt) %></div>
        
        <div class="display-label">ModifiedBy</div>
        <div class="display-field"><%: Model.ModifiedBy %></div>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Edit", "Edit", new { id=Model.CampusID }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

