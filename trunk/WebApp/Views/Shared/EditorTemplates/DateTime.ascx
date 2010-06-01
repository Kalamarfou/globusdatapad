<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<System.DateTime?>" %>
<%=Html.TextBox("", (Model.HasValue ? Model.Value.ToString("dd/MM/yyyy hh:mm:ss") : string.Empty), new { @class = "dateTimePicker" }) %>
