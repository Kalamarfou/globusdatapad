<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<DAL.Venue>" %>

    <fieldset>
        <legend>Fields</legend>
        
        <div class="display-label">Name</div>
        <div class="display-field"><%: Model.Name %></div>
        
        <% Html.DisplayFor(m => m.Address, "AddressVisualization"); %>
        
    </fieldset>
    <p>

        <%: Html.ActionLink("Edit", "Edit", new { id=Model.Id }) %> |
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>


