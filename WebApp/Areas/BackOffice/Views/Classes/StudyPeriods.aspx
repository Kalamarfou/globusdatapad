<%@ Page Title="WebApp.Content.i18n.BackOffice.Classes.StudyPeriods" Language="C#"
    MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DAL.StudyPeriod>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    <%:WebApp.Content.i18n.BackOffice.Classes.StudyPeriods %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <%:WebApp.Content.i18n.BackOffice.Classes.StudyPeriods %></h2>
    <table>
        <tr>
            <th>
                <%:DAL.Resources.StudyPeriod.Name %>
            </th>
            <th>
                <%:DAL.Resources.StudyPeriod.StartDate %>
            </th>
            <th>
                <%:DAL.Resources.StudyPeriod.EndDate %>
            </th>
        </tr>
        <% foreach (var item in Model)
           { %>
        <tr>
            <td>
                <%: item.Name %>
            </td>
            <td>
                <%: String.Format("{0:g}", item.StartDate) %>
            </td>
            <td>
                <%: String.Format("{0:g}", item.EndDate) %>
            </td>
        </tr>
        <% } %>
    </table>
    <% Html.BeginForm();
       { %>
    <% if (((IEnumerable<SelectListItem>)ViewData["sps"]).Count() == 0)
       {
    %>
    <%:WebApp.Content.i18n.BackOffice.Classes.NoMoreStudyPeriods%>
    <%}
       else
       {
    %>
    <%: Html.DropDownList(WebApp.Content.i18n.BackOffice.Classes.AddSP, (IEnumerable<SelectListItem>)ViewData["sps"])%>
    <input type="submit" value="<%:WebApp.Content.i18n.Common.Submit %>" />
    <% } %>
    <% } %>
    <div>
        <%: Html.ActionLink(WebApp.Content.i18n.Common.BackToList, "Index")%>
    </div>
</asp:Content>
