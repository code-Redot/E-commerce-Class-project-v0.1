<%@ Page Title="Login Portal" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Signing.aspx.cs" Inherits="Shop.Signing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        .auto-style1 {
            width: 291px;
            text-align: right;
        }
        .auto-style2 {
            width: 313px;
        }
    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <header class="bg-dark py-5" id="Banner">
        <div class="container px-4 px-lg-5 my-2">
            <div class="text-center text-white">

                <h1 class="display-4 fw-bolder">LogIn Portal</h1>
                <p class="lead fw-normal text-white-50 mb-0">Welcome Back to "ShopName"</p>
            </div>
        </div>
    </header>


    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">

                <table class="w-100">
                    <tr>
                        <td class="auto-style1">UserName:</td>
                        <td class="auto-style2"><asp:TextBox ID="txt_UserName" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:Label ID="lbl_Status" runat="server"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1">Password:</td>
                        <td class="auto-style2"><asp:TextBox ID="txt_Password" runat="server" TextMode="Password"></asp:TextBox>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td class="auto-style1">&nbsp;</td>
                        <td class="auto-style2">
                            <asp:Button ID="Btn_Login" runat="server" Text="Login" OnClick="Btn_Login_Click" />
                        </td>
                        <td>
                            <asp:Button ID="Btn_Forgot" runat="server" Text="Forgot my credentials" OnClick="Btn_Forgot_Click" />
                            <asp:Button ID="Btn_RegisterPortal" runat="server" OnClick="Btn_Register_Click" Text="Register" />
                        </td>
                    </tr>
                    </table>

            </div>
        </div>
    </section>


</asp:Content>