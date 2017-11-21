<%@ page contentType="text/html;charset=UTF-8" language="java"
	isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<%@ include file="common/head.jsp"%>
<link href="../css/self.css" rel="stylesheet">
<script src="../js/biaoqian.js"></script>
<script src="../js/index.js"></script>
<title>We Play</title>

    <%@ include file="common/head.jsp" %>
    <link href="../csss/self.css" rel="stylesheet">
    <script src="../jss/biaoqian.js"></script>
    <script src="../jss/index.js"></script>
    <title>We Play</title>
</head>

<body>
	<%@ include file="common/top.jsp"%>
      
	<div class="container">
		<div class="row">
			<div class="col-xs-2 col-sm-2 col-md-2">
				<div class="gutter_header">
					<ul class="list-group" id="leixing">
                     <li> <a href="http://localhost:8080/Stream/jsp/search2.html">全部类型</a></li>

					</ul>
				</div>
			</div>
			<div class="col-xs-10 col-sm-10 col-md-10">
				<div class="row">
					<div class="tit tit_0">精 选 和 推 荐</div>
				</div>
				<div class="row">
					<div id="carousel-example-generic" class="carousel slide"
						data-ride="carousel">
						<c:forEach items="${gamelist}" var="g">

							<ol class="carousel-indicators">

								<li data-target="#carousel-example-generic"
									data-slide-to="${g.id}" class="active"></li>
								<li data-target="#carousel-example-generic"
									data-slide-to="${g.id}"></li>
								<li data-target="#carousel-example-generic"
									data-slide-to="${g.id}"></li>
								<li data-target="#carousel-example-generic"
									data-slide-to="${g.id}"></li>
								<li data-target="#carousel-example-generic"
									data-slide-to="${g.id}"></li>
								<li data-target="#carousel-example-generic"
									data-slide-to="${g.id}"></li>

							</ol>

						</c:forEach>

						<div class="carousel-inner" role="listbox">

							<div class="item active">
								<div class="item_0">
									<a id="gameurl_0"><img class="imgwh" id="gameimg_0"
										src="../image/index/1.jpg"></a>
								</div>
								<div class="item_0" id="gamename_0">
									<div class="shoujia shoujia1" id="gameprice_0"></div>
								</div>
							</div>
							<c:forEach items="${gamelist}" var="g" varStatus="i">
								<div class="item ">
									<div class="item_${i.index }">
										<a id="gameurl_${i.index }" ><img class="imgwh"
											id="gameimg_${i.index }" src="${g.img}">
											
											</a>
									</div>
									<div class="item_${i.index }" id="gamename_${i.index }">
										<div class="shoujia" id="gameprice_${i.index }"></div>
									</div>
								</div>
							</c:forEach>






						</div>

						<a class="left carousel-control" href="#carousel-example-generic"
							role="button" data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> <a class="right carousel-control"
							href="#carousel-example-generic" role="button" data-slide="next">
							<span class="glyphicon glyphicon-chevron-right"
							aria-hidden="true"></span> <span class="sr-only">Next</span>
						</a>
					</div>
				</div>



				<div class="row">
					<div class="tit tit_1">免 费 游 戏</div>
				</div>
				<div class="row">
					<div id="carousel_1" class="carousel slide" data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carousel_1" data-slide-to="0" class="active"></li>
							<li data-target="#carousel_1" data-slide-to="1"></li>
						</ol>


						<div class="carousel-inner" role="listbox">


							<div class="item active" id="freegames_0">
								<img alt="" src="../image/index/3.jpg" />
							</div>


							<div class="item" id="freegames_1">
								<img alt="" src="../image/index/5.jpg">
							</div>
						</div>




						<a class="left carousel-control" href="#carousel_1" role="button"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							<span class="sr-only">Previous</span>
						</a> <a class="right carousel-control" href="#carousel_1"
							role="button" data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
				<div class="row">
					<div class="tit tit_1">休 闲 一 下</div>
				</div>

				<%-- 	<div class="all_bg">
					<div id="allcanvas">
						<img src="../image/fish/play.png" id="playbtn" onclick="game()">
						<canvas id="canvas1" width="800" height="600"></canvas>
						<canvas id="canvas2" width="800" height="600"></canvas>
					</div>
				</div> --%>
				<video width="800" height="600" controls="controls"
					autoplay="autoplay">
					<source src="${pageContext.request.contextPath}/radio/3.mp4"  type="video/mp4">
				</video>


				<div class="row zx">
					<div class="col-md-8">
						<ul id="myTab" class="nav nav-tabs">
							<li role="presentation"><a href="#home" data-toggle="tab">新品与热门商品</a></li>
							<li role="presentation"><a href="#jijiang" data-toggle="tab">即将推出</a></li>
						</ul>
						
						
						<div id="myTabContent" class="tab-content";>
						
						
						</div>
					</div>
					<!-- <div class="col-md-4 spadding">
						<div id="divHover"></div>
					</div> -->
				</div>
			</div>
		</div>
	</div>
	<%@ include file="common/bottom.jsp"%>
	<%@ include file="fishjs.jsp"%>
</body>
</html>