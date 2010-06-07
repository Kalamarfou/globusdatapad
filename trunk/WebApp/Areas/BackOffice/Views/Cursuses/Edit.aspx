<%@ Page Title="WebApp.Content.i18n.BackOffice.Cursuses.EditTitle" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<DAL.Cursus>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%:WebApp.Content.i18n.BackOffice.Cursuses.EditTitle %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:WebApp.Content.i18n.BackOffice.Cursuses.EditTitle %></h2>

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
            
            <p>
                <input type="submit" value="<%:WebApp.Content.i18n.Common.Save%>" />
            </p>
        </fieldset>

    <% } %>

    <div>
        <%: Html.ActionLink(WebApp.Content.i18n.Common.BackToList, "Index")%>
    </div>

</asp:Content>

