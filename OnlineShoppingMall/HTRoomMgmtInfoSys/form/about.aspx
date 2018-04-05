<%@ Page Title="" Language="C#" MasterPageFile="~/form/reception.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="HTRoomMgmtInfoSys.form.about" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!-- container -->
	<div class="container" style="margin-top:100px;">

		<ol class="breadcrumb">
			<li><a href="index.html">主页</a></li>
			<li class="active">体育知识</li>
		</ol>

		<div class="row">
			
			<!-- Article main content -->
			<article class="col-sm-8 maincontent">
				<header class="page-header">
					<h1 class="page-title">你知道吗？？</h1>
				</header>
				<h3>剧烈运动时和运动后不可大量饮水</h3>
				<p><img src="assets/images/mac.jpg" alt="" class="img-rounded pull-right" width="300" > 剧烈运动时，体内盐分随大量的汗液排出体外，饮水过多会使血液的渗透压降低，破坏体内水盐代谢平衡，影响人体正常生理功能，甚至还会发生肌肉痉挛现象。由于运动时，需要增加心跳、呼吸的频率来增加血液和氧气，以满足运动需要。而大量饮水会使胃部膨胀充盈，妨碍膈肌活动，影响呼吸;血液的循环流量增加，加重了心脏负担，不仅不利于运动，还会伤害心脏。
				</p>
				<p>此外，大量饮水会使胃酸浓度降低，影响食物消化。长期大量运动后饮水容易得胃病。</p>
				<h3>进餐后不宜运动</h3>
				<p>进餐后需要较多的血液流到胃肠道，帮助食物消化与养分吸收，如果这时参加运动就会造成血液流向四肢，妨碍胃肠的消化，时间一长就会导致疾病。体弱者进餐后血压还会降低，称为餐后低血压，外出活动容易跌倒。长期餐后运动容易得盲肠炎。饮酒后不可进行游泳等运动项目。</p>
				<h3>在不适当的地点运动会带来伤害</h3>
				<p>由于运动的基本功能是通过呼吸从外界摄入大量新鲜氧气，以满足健康的需求，故运动前一定要选择好地点，以平坦开阔，空气新鲜的公园、河滩、体育场等处最佳。</p>
				<h3>不要在情绪不好的时候运动</h3>
				<p>运动不仅是身体的锻炼，也是心理的锻炼。当你生气、悲伤时，不要到运动场上去发泄。运动医学专家的解释是：人的情绪直接影响着身体的生理机能，而情绪的变化又产生于大脑深部，并扩散到全身，在心脏及其他器官上留下痕迹，这种痕迹将影响人体机能的健康。
				
			</article>
			<!-- /Article -->
			
			<!-- Sidebar -->
			<aside class="col-sm-4 sidebar sidebar-right">

				<div class="widget">
					<h4>其他知识</h4>
					<ul class="list-unstyled list-spaces">
						<li><a href="">知识1标题</a><br><span class="small text-muted">摘要XXXXXXXXXXXXXXXXXXXXX</span></li>
						<li><a href="">知识2标题</a><br><span class="small text-muted">摘要XXXXXXXXXXXXXXXXXXXXX</span></li>
						<li><a href="">知识3标题</a><br><span class="small text-muted">摘要XXXXXXXXXXXXXXXXXXXXX</span></li>
						<li><a href="">知识4标题</a><br><span class="small text-muted">摘要XXXXXXXXXXXXXXXXXXXXX</span></li>
						<li><a href="">知识5标题</a><br><span class="small text-muted">摘要XXXXXXXXXXXXXXXXXXXXX</span></li>
					</ul>
				</div>

			</aside>
			<!-- /Sidebar -->

		</div>
	</div>	<!-- /container -->
</asp:Content>
