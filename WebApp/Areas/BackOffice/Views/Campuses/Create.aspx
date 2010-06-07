<%@ Page Title="WebApp.Content.i18n.BackOffice.Campuses.CreateTitle" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<DAL.Campus>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%:WebApp.Content.i18n.BackOffice.Campuses.CreateTitle %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:WebApp.Content.i18n.BackOffice.Campuses.CreateTitle %></h2>

    <% Html.EnableClientValidation(); %>

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
            
            <%= Html.EditorFor(model => model.Address, "AddressCreation") %>

            <p>
                <input type="submit" value="<%:WebApp.Content.i18n.Common.ButtonCreate %>" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink(WebApp.Content.i18n.Common.BackToList, "Index")%>
    </div>

</asp:Content>

