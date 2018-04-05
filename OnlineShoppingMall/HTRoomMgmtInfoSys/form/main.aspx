<%@ Page Title="" Language="C#" MasterPageFile="~/form/reception.Master" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="HTRoomMgmtInfoSys.form.main" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- Highlights - jumbotron -->
	<div class="jumbotron top-space">
		<div class="container">
			
			<h2 class="text-center thin">商品详情介绍：</h2>
            <div class="row" style="border: solid;width:1080px;margin:0 auto;text-align:center;">
                <div style="width:800px;height:50px;margin:0 auto;text-align:center;">
                <br />
                商品名称： <asp:TextBox ID="Tb_name" runat="server"></asp:TextBox>
                <asp:Button ID="Btn_seach" CssClass="layui-btn layui-btn-sm layui-btn-radius" runat="server" Text="搜索" OnClick="Btn_seach_Click" />
                </div>
				<br />
				<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="400px" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDeleting="GridView1_RowDeleting" PageSize="6" Width="1000px" HorizontalAlign="Center" >
                    
                    <Columns>
                        <asp:BoundField DataField="c_id" HeaderText="商品编号" ReadOnly="True">
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="80px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="c_name" HeaderText="商品名称" ReadOnly="True">
                        <ControlStyle Height="25px" Width="140px" />
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="220px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="c_price" HeaderText="售价">
                        <ControlStyle Height="25px" Width="70px" />
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="c_origin" HeaderText="产地">
                        <ControlStyle Height="25px" Width="200px" />
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="280px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="c_inventory" HeaderText="库存">
                        <ControlStyle Height="25px" Width="70px" />
                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="120px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="加入购物车" ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton3" runat="server" CausesValidation="False" CommandName="Delete" CssClass="button" Text="添加"></asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" Width="180px" />
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
                    <RowStyle ForeColor="#000066" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />
                </asp:GridView>
                
			    <br />
                
			</div> <!-- /row  -->
		
		</div>
	</div>
	<!-- /Highlights -->

</asp:Content>
