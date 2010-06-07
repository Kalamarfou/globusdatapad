<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<DAL.Address>" %>

        <fieldset>
            <legend><%= WebApp.Content.i18n.BackOffice.EditorTemplates.AddressEdition.AddressName %></legend>
            
            <%: Html.HiddenFor(model => model.Id) %>

            <%: Html.HiddenFor(model => model.Common.ConcurrencyToken) %>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Street) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Street) %>
                <%: Html.ValidationMessageFor(model => model.Street) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.PostalCode) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.PostalCode) %>
                <%: Html.ValidationMessageFor(model => model.PostalCode) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.City) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.City) %>
                <%: Html.ValidationMessageFor(model => model.City) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Country) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Country) %>
                <%: Html.ValidationMessageFor(model => model.Country) %>
            </div>
        </fieldset>
