<%@ Page Title="" Language="C#" MasterPageFile="~/Areas/BackOffice/Views/Shared/BackOffice.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<DAL.StudyPeriod>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	StudyPeriods
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>StudyPeriods</h2>

    <table>
        <tr>
            <th>
                Name
            </th>
            <th>
                StartDate
            </th>
            <th>
                EndDate
            </th>
        </tr>

    <% foreach (var item in Model) { %>
    
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

        <%: Html.DropDownList("AddSp", (IEnumerable<SelectListItem>)ViewData["sps"])%>

        <input type="submit" value="SUBBMIT" />

        <% } %>

        <b>AJOUTER LIEN RETOUR INDEX</b>

</asp:Content>

