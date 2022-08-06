<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="renewpass.aspx.cs" Inherits="Shop.renewpass" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 289px;
            text-align: right;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <br />
    <table class="w-100">
        <tr>
            <td class="auto-style1">Enter new password:</td>
            <td>
                <asp:TextBox ID="txt_pwd" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFV_Pwd" runat="server" ControlToValidate="txt_pwd" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="REV_pwd" runat="server" ErrorMessage="Should contain at least one of ( aA~zZ, 0~9, $ ) out of 8 digits" ForeColor="Red" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$^+=!*()@%&amp;]).{8,}$" ControlToValidate="txt_pwd"></asp:RegularExpressionValidator>
                        </td>
        </tr>
        <tr>
            <td class="auto-style1">Re-enter the new password:</td>
            <td>
                <asp:TextBox ID="txt_repwd" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:CompareValidator ID="CV_CPwd" runat="server" ControlToCompare="txt_pwd" ControlToValidate="txt_repwd" ErrorMessage="Password and conformation does not match" ForeColor="Red"></asp:CompareValidator>
                        </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <asp:Label ID="lbl_id" runat="server" Visible="False"></asp:Label>
            </td>
            <td>
                <asp:Button ID="Btn_submitPwd" runat="server" OnClick="Btn_submitPwd_Click" Text="Submit" />
            </td>
        </tr>
    </table>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
</asp:Content>
