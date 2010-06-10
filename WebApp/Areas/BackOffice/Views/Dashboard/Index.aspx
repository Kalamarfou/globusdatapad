<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    <p>Hello <%: User.Identity.Name %>! You are :</p>
    <ul>
    <% foreach (string r in Roles.GetRolesForUser())
       { %>
        <li><%: r%></li>
    <% } %>
    </ul>

</asp:Content>
