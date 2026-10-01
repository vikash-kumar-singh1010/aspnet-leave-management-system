# Academic Calendar & Leave Management System

ASP.NET Web Forms practical project demonstrating **Rich Controls, Session and Cookies**.

## Repository Name

`academic-calendar-leave-management-webforms`

## Repository Description

`ASP.NET Web Forms Academic Calendar & Leave Management System using Calendar Rich Control, Session and Cookies.`

## Features

- ASP.NET Web Forms
- Calendar Rich Control
- Fully dynamic date selection
- Employee name entered by the user
- Leave type selection
- Reason input
- Remember Name using Cookie
- Session for submitted leave information
- Dynamic Leave Details Summary
- Simple black-and-white practical-style UI
- No database required

## Dynamic Behaviour

There is **no hard-coded employee name**.

The Employee Name field starts empty. Whatever the user enters is displayed dynamically in the summary after submitting.

The calendar starts on the current date. The user can click any date and the selected date is automatically displayed in the Leave Date field.

If `Remember my name` is checked, the name is saved in a browser cookie for 30 days and restored on the next visit.

## Practical Flow

1. Run the project.
2. Calendar opens on the current date/month.
3. Click any date.
4. Enter any employee name.
5. Select Leave Type.
6. Enter Reason.
7. Optionally select Remember my name.
8. Click Submit Leave.
9. Leave Details Summary appears dynamically.

## Session

The following values are stored in Session:

- EmployeeName
- LeaveDate
- LeaveType
- LeaveReason

## Cookie

Cookie name:

`LeaveEmployeeName`

The cookie is created only when `Remember my name` is checked.

## Requirements

- Visual Studio
- ASP.NET Web Forms
- .NET Framework 4.8

No database is required.
