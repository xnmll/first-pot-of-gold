﻿<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="confirmOrder.aspx.cs" Inherits="HTRoomMgmtInfoSys.form.confirmOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Panel ID="Panel1" ScrollBars="Horizontal" runat="server" Width="1130px"  BorderColor="#666699" BorderStyle="Solid">
    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" Height="400px" Width="1600px" OnPageIndexChanging="GridView1_PageIndexChanging1" PageSize="6" AllowPaging="True" AutoGenerateColumns="False" OnSelectedIndexChanging="GridView1_SelectedIndexChanging">
    <Columns>
        <asp:TemplateField HeaderText="确认订单" ShowHeader="False">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="layui-btn layui-btn-xs layui-btn-normal" CausesValidation="False" CommandName="Select" Text="确认订单"></asp:LinkButton>
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:TemplateField>
        <asp:BoundField DataField="Ocondition" HeaderText="订单状态">
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
        <asp:BoundField DataField="Oid" HeaderText="订单编号" >
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
        <asp:BoundField DataField="OcreateTime" DataFormatString="{0:yyyy-MM-dd HH:mm:ss }" HeaderText="创建时间" >
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
        <asp:BoundField DataField="Oorigin" HeaderText="订单来源" >
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
        <asp:BoundField DataField="Oroom" HeaderText="房间号" >
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
        <asp:BoundField DataField="Opeople" HeaderText="入住人数" >
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
        <asp:BoundField DataField="CidNumber" HeaderText="身份证号" >
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
        <asp:BoundField DataField="Cname" HeaderText="姓名" >
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
        <asp:BoundField DataField="Csex" HeaderText="性别">
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
        <asp:BoundField DataField="Cphone" HeaderText="电话">
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
        <asp:BoundField DataField="Odays" HeaderText="入住天数">
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
        <asp:BoundField DataField="OstayTime" DataFormatString="{0:yyyy-MM-dd HH:mm:ss }" HeaderText="到店日期">
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
        <asp:BoundField DataField="OleaveTime" DataFormatString="{0:yyyy-MM-dd HH:mm:ss }" HeaderText="离店日期">
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
        <asp:BoundField DataField="Uname" HeaderText="操作员">
        <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
        </asp:BoundField>
    </Columns>
    <FooterStyle BackColor="White" ForeColor="#000066" />
    <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
    <RowStyle ForeColor="#000066" />
    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
    <SortedAscendingCellStyle BackColor="#F1F1F1" />
    <SortedAscendingHeaderStyle BackColor="#007DBB" />
    <SortedDescendingCellStyle BackColor="#CAC9C9" />
    <SortedDescendingHeaderStyle BackColor="#00547E" />
        <PagerTemplate>  
            <div style="text-align: center; color: #0094ff">  
            <asp:LinkButton ID="cmdFirstPage" runat="server" CommandName="Page" CommandArgument="First" Enabled="<%# ((GridView)Container.Parent.Parent).PageIndex!=0 %>">首页</asp:LinkButton>  
            <asp:LinkButton ID="cmdPreview" runat="server" CommandArgument="Prev" CommandName="Page" Enabled="<%# ((GridView)Container.Parent.Parent).PageIndex!=0 %>">前页</asp:LinkButton>  
            第<asp:Label ID="lblcurPage" ForeColor="Blue" runat="server" Text='<%# ((GridView)Container.Parent.Parent).PageIndex+1  %>'></asp:Label>页/共  
            <asp:Label ID="lblPageCount" ForeColor="blue" runat="server" Text='<%# ((GridView)Container.Parent.Parent).PageCount %>'></asp:Label>页  
            <asp:LinkButton ID="cmdNext" runat="server" CommandName="Page" CommandArgument="Next" Enabled="<%# ((GridView)Container.Parent.Parent).PageIndex!=((GridView)Container.Parent.Parent).PageCount-1 %>">后页</asp:LinkButton>  
            <asp:LinkButton ID="cmdLastPage" runat="server"  CommandArgument="Last" CommandName="Page" Enabled="<%# ((GridView)Container.Parent.Parent).PageIndex!=((GridView)Container.Parent.Parent).PageCount-1 %>">尾页</asp:LinkButton>  
            <%--<asp:TextBox ID="txtGoPage" runat="server" Text='<%# ((GridView)Container.Parent.Parent).PageIndex+1 %>' Width="32px"></asp:TextBox>页  
            <asp: Button ID="btn_jump" CssClass='button' class="button" runat="server" OnClick="Turn_Click" Text="转到" />--%></div>  
        </PagerTemplate>
    </asp:GridView>  
    </asp:Panel>
</asp:Content>
