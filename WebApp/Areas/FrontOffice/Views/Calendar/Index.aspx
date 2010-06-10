<%@ Page Title="WebApp.Content.i18n.FrontOffice.Calendar.CalendarTitle" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
	<%:WebApp.Content.i18n.FrontOffice.Calendar.CalendarTitle %>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <form id="form1" runat="server" title="Show WorldWideEvent">

    <h2><%:WebApp.Content.i18n.FrontOffice.Calendar.CalendarTitle %>
        
    </h2>

    <div id="calendarContainer" align="center">
    

<link href="<%= Url.Content("~/Content/ui-lightness/jquery-ui-1.8.1.custom.css") %>" rel="stylesheet" type="text/css" />
<link href="<%= Url.Content("~/Scripts/fullcalendar/fullcalendar.css") %>" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery-1.4.1.min.js") %>">
</script>

<script type="text/javascript" src="<%= Url.Content("~/Scripts/jquery-ui-1.8.1.custom.min.js") %>">
</script>

<script type="text/javascript" src="<%= Url.Content("~/Scripts/fullcalendar/fullcalendar.min.js") %>">
</script>

<div>
<table cellspacing="20px">
<tr>
<td><label for="wwe_checkbox">Show world wide event</label><input type="checkbox" name="wwe_checkbox" id="wwe_checkbox" value="" checked="true" /></td>
<td> <label for="userEvent_checkbox">Show user event</label><input type="checkbox" name="userEvent_checkbox" id="userEvent_checkbox" value="" checked="true"/> </td>
<td><label for="campusEvent_checkbox">Show campus event</label><input type="checkbox" name="campusEvent_checkbox" id="campusEvent_checkbox" value="" checked="true"/> </td>
<td> <label for="classEvent_checkbox">Show class event</label><input type="checkbox" name="classEvent_checkbox" id="classEvent_checkbox" value="" checked="true"/> </td>
</tr>
</table>

<script type="text/javascript">

    $(document).ready(function () {

        $("#wwe_checkbox").click(function () {

            if ($("#wwe_checkbox").attr('checked')) {
                $('#calendar').fullCalendar('addEventSource', "/FrontOffice/CalendarApi/WorldWideEvents/");
                $('#calendar').fullCalendar('removeEventSource', "/FrontOffice/CalendarApi/MandatoryWorldWideEvents/");
            }
            else {
                $('#calendar').fullCalendar('addEventSource', "/FrontOffice/CalendarApi/MandatoryWorldWideEvents/");
                $('#calendar').fullCalendar('removeEventSource', "/FrontOffice/CalendarApi/WorldWideEvents/");
            }
        });

        $("#userEvent_checkbox").click(function () {

            if ($("#wwe_checkbox").attr('checked')) {
                $('#calendar').fullCalendar('addEventSource', "/FrontOffice/CalendarApi/UserEvents/");
            }
            else {
                $('#calendar').fullCalendar('removeEventSource', "/FrontOffice/CalendarApi/UserEvents/");
            }
        });

        $("#campusEvent_checkbox").click(function () {

            if ($("#campusEvent_checkbox").attr('checked')) {
                $('#calendar').fullCalendar('addEventSource', "/FrontOffice/CalendarApi/CampusEvents/");
                $('#calendar').fullCalendar('removeEventSource', "/FrontOffice/CalendarApi/MandatoryCampusEvents/");
            }
            else {
                $('#calendar').fullCalendar('addEventSource', "/FrontOffice/CalendarApi/MandatoryCampusEvents/");
                $('#calendar').fullCalendar('removeEventSource', "/FrontOffice/CalendarApi/CampusEvents/");
            }
        });

        $("#classEvent_checkbox").click(function () {

            if ($("#wwe_checkbox").attr('checked')) {
                $('#calendar').fullCalendar('addEventSource', "/FrontOffice/CalendarApi/ClassEvents/");
                $('#calendar').fullCalendar('removeEventSource', "/FrontOffice/CalendarApi/MandatoryClassEvents/");
            }
            else {
                $('#calendar').fullCalendar('addEventSource', "/FrontOffice/CalendarApi/MandatoryClassEvents/");
                $('#calendar').fullCalendar('removeEventSource', "/FrontOffice/CalendarApi/ClassEvents/");
            }
        });

    });
</script>
</div>

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

        $('#calendar').fullCalendar('addEventSource', "/FrontOffice/CalendarApi/WorldWideEvents/");
        $('#calendar').fullCalendar('addEventSource', "/FrontOffice/CalendarApi/UserEvents/");
        $('#calendar').fullCalendar('addEventSource', "/FrontOffice/CalendarApi/CampusEvents/");
        $('#calendar').fullCalendar('addEventSource', "/FrontOffice/CalendarApi/ClassEvents/");

    }); 
</script>

</div>

    </form>

</asp:Content>
