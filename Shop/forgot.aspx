<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="forgot.aspx.cs" Inherits="Shop.forgot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 295px;
            text-align: right;
        }
        .auto-style2 {
            margin-left: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <table class="w-100">
        <tr>
            <td class="auto-style1">Name:</td>
            <td>
                <asp:TextBox ID="txt_Name" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Username:</td>
            <td>
                <asp:TextBox ID="txt_UName" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">Email:</td>
            <td>
                <asp:TextBox ID="txt_Email" runat="server"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="auto-style1">&nbsp;</td>
            <td class="auto-style2">
                <asp:Button ID="Btn_renew" runat="server" OnClick="Btn_renew_Click" Text="procced to renew" />
                <asp:Label ID="lbl_Status" runat="server"></asp:Label>
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
            </td>
        </tr>
    </table>
</asp:Content>
