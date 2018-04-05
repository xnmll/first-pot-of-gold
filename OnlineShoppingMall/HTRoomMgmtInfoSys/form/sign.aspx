<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="sign.aspx.cs" Inherits="HTRoomMgmtInfoSys.form.sign" %>

<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"    content="width=device-width, initial-scale=1.0">
	<meta name="description" content="">
	<meta name="author"      content="Sergey Pozhilov (GetTemplate.com)">
	
	<title>体育用品在线商城</title>

    <link rel="stylesheet" href="/layui/css/layui.css" />
    <link rel="stylesheet" href="/css/button.css" />

	<link rel="shortcut icon" href="assets/images/gt_favicon.png">
	
	<link rel="stylesheet" media="screen" href="http://fonts.googleapis.com/css?family=Open+Sans:300,400,700">
	<link rel="stylesheet" href="assets/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/css/font-awesome.min.css">

	<!-- Custom styles for our template -->
	<link rel="stylesheet" href="assets/css/bootstrap-theme.css" media="screen" >
	<link rel="stylesheet" href="assets/css/main.css">

</head>
<body class="home">
    <form id="form1" runat="server">

    <!-- container -->
	<div class="container">

		<div class="row">
			
			<!-- Article main content -->
			<article class="col-xs-12 maincontent">
				<header class="page-header">
					<h1 class="page-title">登陆</h1>
				</header>
				
				<div class="col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
					<div class="panel panel-default">
						<div class="panel-body">
							<h3 class="thin text-center">登陆到你的账户</h3>
							<p class="text-center text-muted">欢迎使用我们的服务，我们将竭诚为您提供最好的上网体验 <a href="login.aspx">（管理员登陆入口）</a></p>
							<hr>
							
							
								<div class="top-margin">
									<label>用户名 <span class="text-danger">*</span></label>
									<asp:TextBox class="form-control" ID="Tb_name" runat="server"></asp:TextBox>
								</div>
								<div class="top-margin">
									<label>密码 <span class="text-danger">*</span></label>
									<asp:TextBox class="form-control" TextMode="Password" ID="Tb_passWord" runat="server"></asp:TextBox>
								</div>

								<hr>

								<div class="row">
									<div class="col-lg-8">
										<b><a href="register.aspx">注册账户</a></b>
									</div>
									<div class="col-lg-4 text-right">
										<asp:Button ID="btn_signin" class="btn btn-action" runat="server" Text="登陆" OnClick="btn_signin_Click" />
									</div>
								</div>
							
						</div>
					</div>

				</div>
				
			</article>
			<!-- /Article -->

		</div>
	</div>	<!-- /container -->
<!-- Social links. @TODO: replace by link/instructions in template -->
	<section id="social">
		<div class="container">
			<div class="wrapper clearfix">
				<!-- AddThis Button BEGIN -->
				<div class="addthis_toolbox addthis_default_style">
				<a class="addthis_button_facebook_like" ></a>
				<a class="addthis_button_tweet"></a>
				<a class="addthis_button_linkedin_counter"></a>
				<a class="addthis_button_google_plusone"></a>
				</div>
				<!-- AddThis Button END -->
			</div>
		</div>
	</section>
	<!-- /social links -->


	<footer id="footer" class="top-space">
		<div class="col-md-6 widget">
			<div class="widget-body">
				<p class="text-right">
					Copyright &copy; 2018, Your name. Designed by <a href="http://xnmll.cn/" rel="designer">XXXXXXXXX</a> 
				</p>
			</div>
		</div>
	</footer>
    </form>
</body>
</html>
