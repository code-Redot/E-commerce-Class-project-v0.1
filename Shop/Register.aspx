<%@ Page Title="Get Enslaved" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Shop.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            text-align: right;
            width: 200px;
        }

        .auto-style2 {
            text-align: right;
            width: 200px;
            height: 27px;
        }

        .auto-style3 {
            height: 27px;
            width: 572px;
        }

        .auto-style4 {
            text-align: right;
            width: 200px;
            height: 31px;
        }

        .auto-style5 {
            height: 31px;
        }
        .auto-style6 {
            width: 572px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <header class="bg-dark py-5" id="Banner">
        <div class="container px-4 px-lg-5 my-2">
            <div class="text-center text-white">

                <h1 class="display-4 fw-bolder">Regester a new Account</h1>
                <p class="lead fw-normal text-white-50 mb-0">Welcome to "shopName"</p>
            </div>
        </div>
    </header>


    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

                <table class="w-100">
                    <tr>
                        <td class="auto-style1">Name:&nbsp; </td>
                        <td class="auto-style6">
                            <asp:TextBox ID="txt_Name" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFV_Name" runat="server" ControlToValidate="txt_Name" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">UserName:</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="txt_UserName" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFV_UName" runat="server" ControlToValidate="txt_UserName" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Email:</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="txt_Email" runat="server" CssClass="offset-sm-0"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFV_Email" runat="server" ControlToValidate="txt_Email" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="REV_Email" runat="server" ControlToValidate="txt_Email" ErrorMessage="Email format is not correct" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">Password:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txt_Password" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFV_Pwd" runat="server" ControlToValidate="txt_Password" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="REV_pwd" runat="server" ErrorMessage="Should contain at least one of ( aA~zZ, 0~9, $ ) out of 8 digits" ForeColor="Red" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[#$^+=!*()@%&amp;]).{8,}$" ControlToValidate="txt_Password"></asp:RegularExpressionValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Confirm passwor:</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="txt_CPassword" runat="server" TextMode="Password"></asp:TextBox>
                            <asp:CompareValidator ID="CV_CPwd" runat="server" ControlToCompare="txt_Password" ControlToValidate="txt_CPassword" ErrorMessage="Password and conformation does not match" ForeColor="Red"></asp:CompareValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Address:</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="txt_Address" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFV_Address" runat="server" ControlToValidate="txt_Address" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Payment Card Number:</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="txt_Payment" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RFV_payment" runat="server" ControlToValidate="txt_Payment" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style4">
                            &nbsp;</td>
                        <td class="auto-style6">
                            <asp:Button ID="btn_Register" runat="server" Text="Register" OnClick="Btn_Register_Click" />
                            <asp:Label ID="lbl_Status" runat="server"></asp:Label>
                        </td>
                    </tr>
                </table>

            </div>
        </div>
    </section>

</asp:Content>
