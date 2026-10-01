using System;
using System.Web.UI;

namespace LeaveManagementWebForms
{
    public partial class Leave : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Completely dynamic: open on today's date.
                DateTime today = DateTime.Today;

                calLeave.VisibleDate = today;
                calLeave.SelectedDate = today;
                txtLeaveDate.Text = today.ToString("dd-MMM-yyyy");

                // No default/hard-coded employee name.
                txtEmployeeName.Text = "";

                // Restore name only if the user previously selected Remember Name.
                if (Request.Cookies["LeaveEmployeeName"] != null)
                {
                    string rememberedName = Server.UrlDecode(
                        Request.Cookies["LeaveEmployeeName"].Value);

                    if (!string.IsNullOrWhiteSpace(rememberedName))
                    {
                        txtEmployeeName.Text = rememberedName;
                        chkRemember.Checked = true;
                    }
                }
            }
        }

        protected void calLeave_SelectionChanged(object sender, EventArgs e)
        {
            DateTime selectedDate = calLeave.SelectedDate;

            txtLeaveDate.Text = selectedDate.ToString("dd-MMM-yyyy");

            pnlSummary.Visible = false;
            lblMessage.Text = "";
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string employeeName = txtEmployeeName.Text.Trim();
            string leaveType = ddlLeaveType.SelectedValue;
            string reason = txtReason.Text.Trim();

            if (string.IsNullOrWhiteSpace(employeeName))
            {
                ShowMessage("Please enter employee name.");
                return;
            }

            if (calLeave.SelectedDate == DateTime.MinValue)
            {
                ShowMessage("Please select a leave date.");
                return;
            }

            if (string.IsNullOrWhiteSpace(leaveType))
            {
                ShowMessage("Please select leave type.");
                return;
            }

            if (string.IsNullOrWhiteSpace(reason))
            {
                ShowMessage("Please enter reason.");
                return;
            }

            DateTime selectedDate = calLeave.SelectedDate;

            // Store submitted leave information in Session.
            Session["EmployeeName"] = employeeName;
            Session["LeaveDate"] = selectedDate;
            Session["LeaveType"] = leaveType;
            Session["LeaveReason"] = reason;

            // Remember employee name using Cookie only when requested.
            if (chkRemember.Checked)
            {
                Response.Cookies["LeaveEmployeeName"].Value =
                    Server.UrlEncode(employeeName);

                Response.Cookies["LeaveEmployeeName"].Expires =
                    DateTime.Now.AddDays(30);
            }
            else if (Request.Cookies["LeaveEmployeeName"] != null)
            {
                Response.Cookies["LeaveEmployeeName"].Expires =
                    DateTime.Now.AddDays(-1);
            }

            // Dynamically display submitted information.
            lblSummaryName.Text = employeeName;
            lblSummaryDate.Text = selectedDate.ToString("dd-MMM-yyyy")
                + " (" + selectedDate.ToString("dddd") + ")";
            lblSummaryType.Text = leaveType;
            lblSummaryReason.Text = reason;

            pnlSummary.Visible = true;
            lblMessage.Text = "";
        }

        private void ShowMessage(string message)
        {
            lblMessage.Text = message;
            pnlSummary.Visible = false;
        }
    }
}
