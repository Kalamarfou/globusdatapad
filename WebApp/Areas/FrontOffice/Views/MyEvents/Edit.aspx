<%@ Page Title="WebApp.Content.i18n.FrontOffice.MyEvents.EditTitle" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DAL.Event>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%:WebApp.Content.i18n.FrontOffice.MyEvents.EditTitle %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:WebApp.Content.i18n.FrontOffice.MyEvents.EditTitle %></h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend><%:WebApp.Content.i18n.Common.Fields %></legend>
            
            
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
                <%: Html.TextBoxFor(model => model.Description) %>
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
            
            <p>
                <input type="submit" value="<%: WebApp.Content.i18n.Common.Save %>" />
            </p>
        </fieldset>

    <% } %>


</asp:Content>

