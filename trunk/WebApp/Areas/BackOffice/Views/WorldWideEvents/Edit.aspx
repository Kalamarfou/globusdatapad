<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<DAL.WorldWideEvent>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Edit
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Edit</h2>

    <% using (Html.BeginForm()) {%>
        <%: Html.ValidationSummary(true) %>
        
        <fieldset>
            <legend>Fields</legend>
            
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
                <%: Html.TextBoxFor(model => model.Description) %>
                <%: Html.ValidationMessageFor(model => model.Description) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.StartDate) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.StartDate, String.Format("{0:g}", Model.StartDate)) %>
                <%: Html.ValidationMessageFor(model => model.StartDate) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.EndDate) %>
            </div>
            <div class="editor-field">
                <%: Html.TextBoxFor(model => model.EndDate, String.Format("{0:g}", Model.EndDate)) %>
                <%: Html.ValidationMessageFor(model => model.EndDate) %>
            </div>
            
            <div class="editor-label">
                <%: Html.LabelFor(model => model.IsMandatory) %>
            </div>
            <div class="editor-field">
                <%: Html.CheckBoxFor(model => model.IsMandatory) %>
            </div>
            
            <p>
                <input type="submit" value="Save" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink("Back to List", "Index") %>
    </div>

</asp:Content>

