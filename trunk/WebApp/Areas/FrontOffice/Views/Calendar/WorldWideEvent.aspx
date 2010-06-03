<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DAL.WorldWideEvent>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	WorldWideEvent
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>WorldWide Event: <%: Model.Name %></h2>

    <p><%: Model.Description %></p>

    <br />

    <p>From <%: String.Format("{0:g}", Model.StartDate) %> to <%: String.Format("{0:g}", Model.EndDate) %>.</p>

    <br />

    <p>
        <%: Html.ActionLink("Back to List", "Index") %>
    </p>

</asp:Content>

