<%@ Page Title="" Language="C#" MasterPageFile="~/index.Master" AutoEventWireup="true" CodeBehind="addNewUser.aspx.cs" Inherits="HTRoomMgmtInfoSys.form.addNewUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="CreateNewOrder" class="layui-form" style="width: 300px;margin: 0 auto;">
        <div style="width:200px;height:50px; margin:0 auto;padding-left:110px;">
            <h1>添加新用户</h1>
        </div>
        <div class="layui-form-item">
		    <label class="layui-form-label">用户名</label>
            <div class="layui-input-block">
                <asp:TextBox ID="Tb_name" class="layui-input" placeholder="必填,不可重复" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="layui-form-item">
		    <label class="layui-form-label">密码</label>
            <div class="layui-input-block">
                <asp:TextBox ID="Tb_pwd" class="layui-input" placeholder="必填" runat="server"></asp:TextBox>
            </div>
        </div>
        <div class="layui-form-item">
		    <label class="layui-form-label">手机号</label>
            <div class="layui-input-block">
                <asp:TextBox ID="Tb_phone" class="layui-input" placeholder="必填" runat="server"></asp:TextBox>
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
