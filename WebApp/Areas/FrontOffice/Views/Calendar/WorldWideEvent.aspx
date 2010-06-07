<%@ Page Title="WebApp.Content.i18n.FrontOffice.Calendar.WorldWideEventTitle" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DAL.WorldWideEvent>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%:WebApp.Content.i18n.FrontOffice.Calendar.WorldWideEventTitle%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2><%:WebApp.Content.i18n.FrontOffice.Calendar.WorldWideEvent %> <%: Model.Name %></h2>

    <p><%: Model.Description %></p>

    <br />

    <p><%:WebApp.Content.i18n.Common.From%> <%: String.Format("{0:g}", Model.StartDate) %> <%:WebApp.Content.i18n.Common.to%> <%: String.Format("{0:g}", Model.EndDate) %>.</p>

    <br />

    <p>
        <%: Html.ActionLink(WebApp.Content.i18n.Common.BackToList, "Index")%>
    </p>

</asp:Content>

