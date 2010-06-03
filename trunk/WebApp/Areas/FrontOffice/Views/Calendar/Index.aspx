<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	Index
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h2>Index</h2>

    

<link href="<%= Url.Content("~/Content/ui-lightness/jquery-ui-1.8.1.custom.css") %>" rel="stylesheet" type="text/css" />
<link href="<%= Url.Content("~/Scripts/fullcalendar/fullcalendar.css") %>" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery-1.4.1.min.js") %>">
</script>

<script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery-ui-1.8.1.custom.min.js") %>">
</script>

<script type="text/javascript" src="<%= Url.Content("~/Scripts/fullcalendar/fullcalendar.min.js") %>">
</script>

<div id="calendar"></div>

<script type="text/javascript">
    $(document).ready(function () {
        $('#calendar').fullCalendar({
            theme: true,
            header: {
                left: 'prev,next today',
                center: 'title',
                right: 'month,agendaWeek,agendaDay'
            },
            editable: false
        });

        $('#calendar').fullCalendar('addEventSource', "/FrontOffice/CalendarApi/GetWorldWideEvents/");

    }); 
</script>

</asp:Content>
