<%@ Page Title="" Language="C#" MasterPageFile="~/form/reception.Master" AutoEventWireup="true" CodeBehind="purchase.aspx.cs" Inherits="HTRoomMgmtInfoSys.form.purchase" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<!-- Highlights - jumbotron -->
	<div class="jumbotron top-space">
		<div class="container">
			
			<h2 class="text-center thin">我的购物车</h2>
            <div class="row" style="border: solid;width:1080px;margin:0 auto;text-align:center;">
                
				<br />
                
				<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="400px" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting" PageSize="6" Width="600px" HorizontalAlign="Center" >
                    
                    <Columns>
                        <asp:BoundField DataField="c_id" HeaderText="商品编号" ReadOnly="True">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="50px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="c_name" HeaderText="商品名称" ReadOnly="True">
                        <ControlStyle Height="25px" Width="140px" />
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="c_price" HeaderText="售价">
                        <ControlStyle Height="25px" Width="70px" />
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="从购物车删除" ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" CssClass="button" Text="删除" OnClientClick="return confirm('确认要删除吗？')"></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                    <PagerTemplate>
                        <div style="text-align: center; color: #0094ff">
                            <asp:LinkButton ID="cmdFirstPage" runat="server" CommandArgument="First" CommandName="Page" Enabled="<%# ((GridView)Container.Parent.Parent).PageIndex!=0 %>">首页</asp:LinkButton>
                            <asp:LinkButton ID="cmdPreview" runat="server" CommandArgument="Prev" CommandName="Page" Enabled="<%# ((GridView)Container.Parent.Parent).PageIndex!=0 %>">前页</asp:LinkButton>
                            第<asp:Label ID="lblcurPage" runat="server" ForeColor="Blue" Text="<%# ((GridView)Container.Parent.Parent).PageIndex+1  %>"></asp:Label>
                            页/共 
                            <asp:Label ID="lblPageCount" runat="server" ForeColor="blue" Text="<%# ((GridView)Container.Parent.Parent).PageCount %>"></asp:Label>
                            页 
                            <asp:LinkButton ID="cmdNext" runat="server" CommandArgument="Next" CommandName="Page" Enabled="<%# ((GridView)Container.Parent.Parent).PageIndex!=((GridView)Container.Parent.Parent).PageCount-1 %>">后页</asp:LinkButton>
                            <asp:LinkButton ID="cmdLastPage" runat="server" CommandArgument="Last" CommandName="Page" Enabled="<%# ((GridView)Container.Parent.Parent).PageIndex!=((GridView)Container.Parent.Parent).PageCount-1 %>">尾页</asp:LinkButton>
            <%--<asp:TextBox ID="txtGoPage" runat="server" Text='<%# ((GridView)Container.Parent.Parent).PageIndex+1 %>' Width="32px"></asp:TextBox>页  
            <asp: Button ID="btn_jump" CssClass='button' class="button" runat="server" OnClick="Turn_Click" Text="转到" />--%>
                        </div>
                    </PagerTemplate>
                    <RowStyle ForeColor="#000066" HorizontalAlign="Center" VerticalAlign="Middle" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
                
			&nbsp;<br />
&nbsp;<asp:Label ID="Label1" runat="server" Text="总价：0元" Font-Size="16pt"></asp:Label>
                <br />
                <br />
                <asp:Button ID="Button2" CssClass="btn" runat="server" Height="40px" Width="155px" BackColor="#999999" OnClick="Button2_Click" Text="清空购物车" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
&nbsp;<asp:Button ID="Button1" CssClass="btn" runat="server" Height="40px" Text="结算" Width="155px" BackColor="#00CCFF" />
                <br />
                <br />
                
			</div> <!-- /row  -->
		
		</div>
	</div>
	<!-- /Highlights -->


</asp:Content>
