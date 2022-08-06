<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Samsung_products.aspx.cs" Inherits="Shop.Samsung_products" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 218px;
        }

        .auto-style2 {
            width: 700px;
        }

        .auto-style3 {
            width: 100%;
            max-width: 1320px;
            margin-left: auto;
            margin-right: auto;
            margin-top: 50px;
            padding-left: var(--bs-gutter-x, .75rem);
            padding-right: var(--bs-gutter-x, .75rem);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="text-align: center">


        <br />
        <table class="w-100">
            <tr>
                <td class="auto-style1">

                    <asp:Image ID="Preview" runat="server" ImageUrl="" Height="50%" ImageAlign="Middle" Width="100px" />


                </td>
                <td class="auto-style2">
                    <asp:Label ID="lbl_id" runat="server" Visible="False"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="Btn_Add" runat="server" Text="Add to cart" OnClick="Btn_Add_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="lbl_DescriptionTag" runat="server"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:Label ID="lbl_Description" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="lbl_currency" runat="server"></asp:Label>
                    <asp:Label ID="lbl_price" runat="server"></asp:Label>
                </td>
            </tr>
        </table>


        <div class="auto-style3" style="text-align: center">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="table" CellPadding="4" ForeColor="Black" GridLines="Horizontal" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px">

                <Columns>
                    <asp:BoundField DataField="Manufacturer" HeaderText="Manufacturer" SortExpression="Manufacturer" />
                    <asp:BoundField DataField="Model" HeaderText="Model" SortExpression="Model" />
                    <asp:BoundField DataField="color" HeaderText="color" SortExpression="color" />
                    <asp:BoundField DataField="capacity" HeaderText="capacity" SortExpression="capacity" />
                    <asp:BoundField DataField="description_short" HeaderText="description_short" SortExpression="description_short" />
                    <asp:BoundField DataField="quantity" HeaderText="quantity" SortExpression="quantity" />

                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LBtn_view" runat="server" CommandArgument='<%# Eval("Id") %>' OnClick="LBtn_view_Click">View</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                <SelectedRowStyle BackColor="#FFC107" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>

        </div>
    </div>
    <asp:SqlDataSource ID="table" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Shop_Connection %>" SelectCommand="SELECT [Manufacturer], [Id], [Model], [color], [capacity], [description_short], [quantity], [Price] FROM [Products] WHERE ([Manufacturer] = @Manufacturer) ORDER BY [Model] DESC">
        <SelectParameters>
            <asp:Parameter DefaultValue="Samsung" Name="Manufacturer" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>

</asp:Content>
