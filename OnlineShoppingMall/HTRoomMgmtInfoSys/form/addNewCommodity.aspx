<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="addNewCommodity.aspx.cs" Inherits="HTRoomMgmtInfoSys.form.addNewRoom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="CreateNewOrder" class="layui-form" style="width: 300px;margin: 0 auto;">
        <div style="width:200px;height:50px; margin:0 auto;padding-left:110px;">
            <h1>添加新商品</h1>
        </div>
        <div class="layui-form-item">
		    <label class="layui-form-label">商品名称</label>
            <div class="layui-input-block">
                <asp:TextBox ID="Tb_name" class="layui-input" placeholder="必填,不可重复" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="layui-form-item">
		    <label class="layui-form-label">商品类别</label>
            <div class="layui-input-block">
                <asp:TextBox ID="Tb_type" class="layui-input" placeholder="必填" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="layui-form-item">
		    <label class="layui-form-label">零售价</label>
            <div class="layui-input-block">
                <asp:TextBox ID="Tb_price" class="layui-input" placeholder="必填" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="layui-form-item">
		    <label class="layui-form-label">产地</label>
            <div class="layui-input-block">
                <asp:TextBox ID="Tb_origin" class="layui-input" placeholder="必填" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">库存</label>
            <div class="layui-input-block">
                <asp:TextBox ID="Tb_inventory" name="OstadyTime" class="layui-input" placeholder="必填" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
              <asp:Button ID="Btn_submit" class="layui-btn" runat="server" Text="完成" OnClick="Btn_submit_Click" />
              <button type="reset" class="layui-btn layui-btn-primary">重置</button>
            </div>
        </div>
    </div>
</asp:Content>
