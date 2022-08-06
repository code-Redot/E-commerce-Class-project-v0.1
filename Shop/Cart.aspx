<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Shop.Cart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 913px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container" style="text-align: center">

        <div class="auto-style3" style="text-align: center">
            <table class="w-100">
                <tr>
                    <td class="auto-style1">
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Cart_ID" DataSourceID="SqlDataSource1">

                            <Columns>
                                <asp:BoundField DataField="Cart_ID" HeaderText="Cart_ID" InsertVisible="False" ReadOnly="True" SortExpression="Cart_ID" />
                                <asp:BoundField DataField="Item_ID" HeaderText="Item_ID" SortExpression="Item_ID" />
                                <asp:BoundField DataField="item_description" HeaderText="item_description" SortExpression="item_description" />
                                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
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


                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BD_Shop_Connection %>" SelectCommand="SELECT [Cart_ID], [Item_ID], [Price], [item_description] FROM [Cart] WHERE (([Account_ID] = @Account_ID) AND ([Cart_ID] = @Cart_ID))">
                            <SelectParameters>
                                <asp:SessionParameter Name="Account_ID" SessionField="Id" Type="Int32" />
                                <asp:SessionParameter Name="Cart_ID" SessionField="Cart_ID" Type="Int32" />
                            </SelectParameters>
                        </asp:SqlDataSource>


                    </td>
                    <td>
                        <asp:Button ID="Btn_Checkout" runat="server" OnClick="Button1_Click" Text="procced to checkout" />
                    </td>
                </tr>
            </table>

        </div>
    </div>

</asp:Content>
