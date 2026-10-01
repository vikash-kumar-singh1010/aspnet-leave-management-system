<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Leave.aspx.cs" Inherits="LeaveManagementWebForms.Leave" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Leave Application</title>
    <style>
        body{font-family:"Times New Roman",Times,serif;margin:0;padding:20px 30px;background:#fff;color:#000}
        h1{font-size:42px;margin:0 0 20px}
        .calendar-container{width:680px;margin:0 auto 20px}
        .calendar{width:100%;border-collapse:collapse;font-size:22px;text-align:center}
        .calendar th,.calendar td{border:1px solid #bcbcbc;height:48px;padding:5px}
        .calendar th{background:#eee;font-weight:bold}
        .calendar a{color:#000;text-decoration:none;display:block;padding:8px}
        .selected-date{background:#eee;font-weight:bold}
        .form-container{width:100%;max-width:1000px;margin-top:20px}
        .form-row{display:flex;align-items:center;margin-bottom:14px}
        .form-label{width:320px;font-size:25px;font-weight:bold}
        .form-control{width:680px;height:38px;font-family:"Times New Roman",Times,serif;font-size:21px;border:1px solid #888;padding:3px 8px;box-sizing:border-box}
        select.form-control{width:320px}
        textarea.form-control{height:110px;resize:none}
        .remember-row{display:flex;align-items:center;margin-top:5px}
        .remember-label{width:320px;font-size:25px;font-weight:bold}
        .remember-text{font-size:22px}
        .remember-text input{width:20px;height:20px;vertical-align:middle;margin-right:8px}
        .button-container{text-align:center;width:1000px;margin-top:15px}
        .submit-button{font-family:"Times New Roman",Times,serif;font-size:22px;padding:8px 30px;background:#eee;border:1px solid #777;cursor:pointer}
        .message{display:block;font-size:20px;margin-top:10px}
        .summary{width:100%;margin-top:15px;border:1px solid #777;border-collapse:collapse;font-size:21px}
        .summary caption{text-align:left;font-size:26px;font-weight:bold;padding:5px 10px;border:1px solid #777;border-bottom:none}
        .summary td{border:1px solid #999;padding:7px 15px}
        .summary td:first-child{width:300px;font-weight:bold}
    </style>
</head>
<body>
<form id="form1" runat="server">
    <h1>Leave Application</h1>

    <div class="calendar-container">
        <asp:Calendar ID="calLeave" runat="server"
            CssClass="calendar"
            OnSelectionChanged="calLeave_SelectionChanged"
            ShowTitle="true"
            SelectionMode="Day">
            <TitleStyle BackColor="#eeeeee" Font-Bold="true" Font-Size="28px" HorizontalAlign="Center" />
            <DayHeaderStyle BackColor="#eeeeee" Font-Bold="true" />
            <SelectedDayStyle CssClass="selected-date" Font-Bold="true" BackColor="#eeeeee" />
            <TodayDayStyle BackColor="White" />
            <OtherMonthDayStyle ForeColor="#555555" />
        </asp:Calendar>
    </div>

    <div class="form-container">
        <div class="form-row">
            <div class="form-label">Employee Name:</div>
            <asp:TextBox ID="txtEmployeeName" runat="server" CssClass="form-control" />
        </div>

        <div class="form-row">
            <div class="form-label">Leave Date:</div>
            <asp:TextBox ID="txtLeaveDate" runat="server" CssClass="form-control" ReadOnly="true" />
        </div>

        <div class="form-row">
            <div class="form-label">Leave Type:</div>
            <asp:DropDownList ID="ddlLeaveType" runat="server" CssClass="form-control">
                <asp:ListItem Text="Select Leave Type" Value="" />
                <asp:ListItem Text="Casual Leave" Value="Casual Leave" />
                <asp:ListItem Text="Sick Leave" Value="Sick Leave" />
                <asp:ListItem Text="Earned Leave" Value="Earned Leave" />
                <asp:ListItem Text="Emergency Leave" Value="Emergency Leave" />
            </asp:DropDownList>
        </div>

        <div class="form-row">
            <div class="form-label">Reason:</div>
            <asp:TextBox ID="txtReason" runat="server" CssClass="form-control" TextMode="MultiLine" />
        </div>

        <div class="remember-row">
            <div class="remember-label">Remember Name:</div>
            <div class="remember-text">
                <asp:CheckBox ID="chkRemember" runat="server" Text="Remember my name" />
            </div>
        </div>

        <div class="button-container">
            <asp:Button ID="btnSubmit" runat="server" Text="Submit Leave"
                CssClass="submit-button" OnClick="btnSubmit_Click" />
        </div>

        <asp:Label ID="lblMessage" runat="server" CssClass="message" />

        <asp:Panel ID="pnlSummary" runat="server" Visible="false">
            <table class="summary">
                <caption>Leave Details Summary</caption>
                <tr><td>Employee Name</td><td><asp:Label ID="lblSummaryName" runat="server" /></td></tr>
                <tr><td>Leave Date</td><td><asp:Label ID="lblSummaryDate" runat="server" /></td></tr>
                <tr><td>Leave Type</td><td><asp:Label ID="lblSummaryType" runat="server" /></td></tr>
                <tr><td>Reason</td><td><asp:Label ID="lblSummaryReason" runat="server" /></td></tr>
            </table>
        </asp:Panel>
    </div>
</form>
</body>
</html>
