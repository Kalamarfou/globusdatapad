<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<DAL.Venue>" %>

    <fieldset>
        <legend><%= WebApp.Content.i18n.Common.Fields %></legend>
        
        <div class="display-label"><%= DAL.Resources.Venue.Name %></div>
        <div class="display-field"><%: Model.Name %></div>
        
        <% Html.DisplayFor(m => m.Address, "AddressVisualization"); %>
        
    </fieldset>
    <p>

        <%: Html.ActionLink(WebApp.Content.i18n.Common.ButtonEdit, "Edit", new { id = Model.Id })%> |
        <%: Html.ActionLink(WebApp.Content.i18n.Common.BackToList, "Index")%>
    </p>


