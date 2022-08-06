<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="checkout.aspx.cs" Inherits="Shop.checkout" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 494px;
        }

        .auto-style2 {
            width: 200px;
            text-align: right;
        }

        .auto-style3 {
            width: 200px;
            text-align: right;
            height: 163px;
        }

        .auto-style4 {
            width: 494px;
            height: 163px;
        }

        .auto-style5 {
            height: 163px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <table class="w-100">
        <tr>
            <td class="auto-style3">Account Info:</td>
            <td class="auto-style4">

                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">

                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#FFC107" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                    <Columns>
                        <asp:BoundField DataField="Name" HeaderText="Name" SortExpression="Name" />
                        <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="Address" HeaderText="Address" SortExpression="Address" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Shop_Connection %>" SelectCommand="SELECT [Name], [UserName], [Email], [Address] FROM [Account] WHERE ([Id] = @Id)">
                    <SelectParameters>
                        <asp:SessionParameter DefaultValue="" Name="Id" SessionField="Id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td class="auto-style5"></td>
        </tr>
        <tr>
            <td class="auto-style2">Cart Details:</td>
            <td class="auto-style1">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">

                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#FFC107" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                    <Columns>
                        <asp:BoundField DataField="Cart_ID" HeaderText="Cart_ID" SortExpression="Cart_ID" />
                        <asp:BoundField DataField="Item_ID" HeaderText="Item_ID" SortExpression="Item_ID" />
                        <asp:BoundField DataField="item_description" HeaderText="item_description" SortExpression="item_description" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Shop_Connection %>" SelectCommand="SELECT [Cart_ID], [Item_ID], [item_description], [Price] FROM [Cart] WHERE (([Cart_ID] = @Cart_ID) AND ([Account_ID] = @Account_ID))">
                    <SelectParameters>
                        <asp:SessionParameter Name="Cart_ID" SessionField="Cart_ID" Type="Int32" />
                        <asp:SessionParameter Name="Account_ID" SessionField="Id" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
            <td>
                <asp:Button ID="Btn_Order" runat="server" OnClick="Btn_Order_Click" Text="Place Order" />
            </td>
        </tr>
    </table>



</asp:Content>
