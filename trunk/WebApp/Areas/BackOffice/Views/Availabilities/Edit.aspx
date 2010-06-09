<%@ Page Title="WebApp.Content.i18n.BackOffice.Availabilities.EditTitle" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<DAL.Availability>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%:WebApp.Content.i18n.BackOffice.Availabilities.EditTitle %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:WebApp.Content.i18n.BackOffice.Availabilities.EditTitle %></h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend><%:WebApp.Content.i18n.Common.Fields %></legend>
            
                <%: Html.HiddenFor(model => model.Id) %>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.StartDate) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.StartDate, String.Format("{0:g}", Model.StartDate))%>
                <%: Html.ValidationMessageFor(model => model.StartDate) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.EndDate) %>
            </div>
            <div class="editor-field">
                <%: Html.EditorFor(model => model.EndDate, String.Format("{0:g}", Model.EndDate))%>
                <%: Html.ValidationMessageFor(model => model.EndDate) %>
            </div>
            
            
            <p>
                <input type="submit" value="<%:WebApp.Content.i18n.Common.Save%>" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink(WebApp.Content.i18n.Common.BackToList, "Index")%>
    </div>

</asp:Content>

