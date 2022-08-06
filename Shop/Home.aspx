<%@ Page Title="Shop" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Shop.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--mew's pwd= Mew2mew@-->
    <!--maw's pwd= Maw2maw@-->
    <!-- Header-->
    <header class="bg-dark py-5" id="Banner">
        <div class="container px-4 px-lg-5 my-2">
            <div class="text-center text-white">

                <h1 class="display-4 fw-bolder">Shop in style</h1>
                <p class="lead fw-normal text-white-50 mb-0">And enjoy technology</p>
            </div>
        </div>
    </header>
    <!-- Section-->
    <section class="py-5">
        <div class="container px-4 px-lg-5 mt-5">
            <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                <!-- Item -->
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="\Resources\Apple-Logo.png" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Apple Iphone</h5>
                                <!-- Product price-->
                                $700 - $1300
                               
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                
                                <asp:Button ID="Btn_appl_redirect" runat="server" Text="View options" OnClick="Btn_appl_redirect_Click" />

                            </div>
                        </div>
                    </div>
                </div>
                <!-- End of Item -->
                <!-- Item -->
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="\Resources\Samsung-Logo.png" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Samsung Phones</h5>
                                <!-- Product price-->
                                $400 - $1800
                               
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">

                                <asp:Button ID="Btn_sams_redirect" runat="server" Text="View options" OnClick="Btn_sams_redirect_Click" />

                            </div>
                        </div>
                    </div>
                </div>
                <!-- End of Item -->
                <!-- Item -->
                <div class="col mb-5">
                    <div class="card h-100">
                        <!-- Product image-->
                        <img class="card-img-top" src="\Resources\Huawei-Logo.png" alt="..." />
                        <!-- Product details-->
                        <div class="card-body p-4">
                            <div class="text-center">
                                <!-- Product name-->
                                <h5 class="fw-bolder">Huawei Phones</h5>
                                <!-- Product price-->
                                $300 - $900
                               
                            </div>
                        </div>
                        <!-- Product actions-->
                        <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                            <div class="text-center">
                                
                                <asp:Button ID="Btn_hua_redirect" runat="server" Text="View options" OnClick="Btn_hua_redirect_Click" />

                            </div>
                        </div>
                    </div>
                </div>
                <!-- End of Item -->
            </div>
        </div>
    </section>

</asp:Content>

