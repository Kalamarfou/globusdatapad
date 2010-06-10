<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<div class="logonControl">
<%
    if (Request.IsAuthenticated) {
%>
        <%: WebApp.Content.i18n.LogOnUserControl.Welcome %> <b><%= Html.Encode(Page.User.Identity.Name) %></b>!
        [ <%= Html.ActionLink(WebApp.Content.i18n.LogOnUserControl.LogOff, "LogOff", "Account", new { Area = "" }, null)%> ]
<%
    }
    else {
%> 
        [ <%= Html.ActionLink(WebApp.Content.i18n.LogOnUserControl.LogOn, "LogOn", "Account", new { Area = "" }, null)%> ]
<%
    }
%>
</div>
