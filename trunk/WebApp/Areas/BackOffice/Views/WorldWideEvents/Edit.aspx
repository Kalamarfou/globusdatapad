<%@ Page Title="WebApp.Content.i18n.BackOffice.WorldWideEvents.EditTitle" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<DAL.WorldWideEvent>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%:WebApp.Content.i18n.BackOffice.WorldWideEvents.EditTitle %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:WebApp.Content.i18n.BackOffice.WorldWideEvents.EditTitle %></h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend><%:WebApp.Content.i18n.Common.Fields %></legend>
            
            <%: Html.HiddenFor(model => model.Id) %>

            <%: Html.HiddenFor(model => model.Common.ConcurrencyToken) %>

            <div class="editor-label">
                <%: Html.LabelFor(model => model.Name) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.Name) %>
                <%: Html.ValidationMessageFor(model => model.Name) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.Description) %>
            </div>
            <div class="editor-field">
                <%: Html.TextAreaFor(model => model.Description) %>
                <%: Html.ValidationMessageFor(model => model.Description) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.StartDate) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.StartDate) %>
                <%: Html.ValidationMessageFor(model => model.StartDate) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.EndDate) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.EndDate) %>
                <%: Html.ValidationMessageFor(model => model.EndDate) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.IsMandatory) %>
            </div>
            <div class="editor-field">
                <%: Html.CheckBoxFor(model => model.IsMandatory) %>
            </div>
            
            <p>
                <input type="submit" value="<%:WebApp.Content.i18n.Common.Save %>" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink(WebApp.Content.i18n.Common.BackToList, "Index") %>
    </div>

</asp:Content>

