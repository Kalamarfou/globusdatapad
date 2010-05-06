<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<DAL.Address>" %>

<div class="adr">
 <div class="street-address"><%= Html.Encode(Model.Street) %></div>
 <span class="locality"><%= Html.Encode(Model.City) %></span>,
 <span class="postal-code"><%= Html.Encode(Model.PostalCode) %></span>
 <div class="country-name"><%= Html.Encode(Model.Country) %></div>
</div>
