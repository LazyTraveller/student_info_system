<%@ tag language="java" pageEncoding="UTF-8" %>
<%@ tag body-content="scriptless" trimDirectiveWhitespaces="true" %>
<!--该模板定义了页面的四个参数,即页面中的可变部分 -->
<!--参数1 html页面的标题title,参数类型为字符串-->
<%@ attribute name="htmlTitle" type="java.lang.String" rtexprvalue="true"
              required="true" %>
<!--参数2 主页面标题bodyTitle,参数类型为字符串-->
<%@ attribute name="bodyTitle" type="java.lang.String" rtexprvalue="true"
              required="true" %>
<!--参数2 主页面标题bodyTitle,参数类型为区域代码段-->
<%@ attribute name="headContent" fragment="true" required="false" %>
<!--参数2 主页面标题bodyTitle,参数类型为区域代码段-->
<%@ attribute name="sideBar" fragment="true" required="true" %>
<%@ attribute name="bodyScript" fragment="true" required="false" %>
<!--包含的基本页面-->
<%@ include file="/WEB-INF/jsp/view/base.jspf" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>莲峰后勤 :: ${htmlTitle}</title>
    <!-- Bootstrap 核心 CSS 文件 -->
    <%--<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.1.0/css/bootstrap.min.css">--%>

    <link rel="stylesheet"
          href="${cx}/resource/static/assets/bootstrap/3.3.7/css/bootstrap.min.css">
    <!-- font-awesome -->
    <link rel="stylesheet"
          href="${cx}/resource/static/assets/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- bootstrap table-->
    <link rel="stylesheet" href="${cx}/resource/static/assets/bootstrap-table/1.12.1/bootstrap-table.min.css">

    <!-- metis Menu-->
    <link rel="stylesheet"
          href="${cx}/resource/static/assets/metismenu/3.0.3/metisMenu.min.css">
    <link rel="stylesheet"
          href="${cx}/resource/static/assets/metismenu/3.0.3/css/mm-vertical.css">
    <%--<link rel="stylesheet"  href="${cx}/resource/static/assets/metismenu/3.0.3/prism.css">--%>
    <%--<link rel="stylesheet"--%>
    <%--href="${cx}/resource/static/assets/metismenu/3.0.3/animate.css">--%>

    <link rel="shortcut icon" href="${cx}/resource/static/img/favico.ico"/>
    <link rel="bookmark" href="${cx}/resource/static/img/favico.ico"/>


    <!-- 站点 自定义 样式 -->
    <link rel="stylesheet" href="${cx}/resource/static/css/site.css">
    <!--jsp:invoke 表示此处插入具体页面的头部内容-->
    <jsp:invoke fragment="headContent"/>
</head>

<body>
<%--<div id="app">--%>
    <%--<i-button @click="show">Click me!</i-button>--%>
    <%--<Modal :visible.sync="visible" title="Welcome">欢迎使用 iView</Modal>--%>
<%--</div>--%>

<!-- 顶部导航栏 -->
<header class="navbar navbar-inverse">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#" style="font-size: 25px;text-align: center;text-shadow: black">
                <span class="glyphicon glyphicon-leaf"></span>
                莲峰后勤学生信息管理系统
            </a>
        </div>
        <ul class="nav navbar-nav navbar-right col-sm-offset-6">
            <li><a href=""><span class="glyphicon glyphicon-user"></span>用户名
            </a></li>
            <li><a href="${cx}/logout"><span
                    class="glyphicon glyphicon-log-out"></span>注销</a></li>
        </ul>
    </div>
</header>

<!-- 主体内容 -->
<section class="container-fluid">
    <!-- 侧边栏 菜单 -->
    <jsp:invoke fragment="sideBar"/>
    <!-- 页面主体 -->
    <div id="content" class="col-sm-10">

        <div class="page-header">
            <h4><span class="glyphicon glyphicon-home"></span> 主页 <span
                    class="icon-home fa fa-angle-double-right"></span>
                ${bodyTitle}</h4>
        </div><!-- /.page-header -->

        <div class="page-content">
            <%--页面主体内容--%>
            <jsp:doBody/>
        </div>
    </div>
</section>
<%--<%@ include file="/WEB-INF/jsp/view/footer.jsp" %>--%>
<!-- jQuery文件。务必在bootstrap.min.js 之前引入 -->
<script src="${cx}/resource/static/assets/jquery/jquery-2.1.4.min.js"></script>
<!-- Bootstrap 核心 JavaScript 文件 -->
<script src="${cx}/resource/static/assets/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- metisMenu -->
<script src="${cx}/resource/static/assets/metismenu/3.0.3/metisMenu.min.js"></script>
<!-- 站点 自定义 函数库 -->
<script src="${cx}/resource/static/js/site.js"></script>

<!-- 页面 自定义 JS -->
<script>

    // new Vue({
    //     el: '#app',
    //     data: {
    //         visible: false
    //     },
    //     methods: {
    //         show: function () {
    //             this.visible = true;
    //         }
    //     }
    // })

    <%--详细样例需要参考metisMenu的demo--%>
    $(function () {
        $('#menu').metisMenu();

        //根据页面传进来的ItemId设置菜单状态
        // var url = window.location;
        //获取Id对应的菜单
        console.log("ItemId=" + ItemId);
        var element = $('#'+ItemId);

        console.log(element.html());

        if(element.is(':empty')){
            return;
        }

        //如果以0结尾，对应菜单项标题菜单
        if(ItemId.charAt(ItemId.length-1)=='0'){
            element.addClass('menuItemColor');
            element.css('color', 'white');
            //展开菜单
            element.parent().addClass("mm-active");
            element.next().addClass("mm-show");
            return;
        }
        //处理非第一个节点
        //获取<a></a>当前菜单项对应的父元素
        var currentItemLi =element.parent();
        //设置li的样式,高亮当前选项
        currentItemLi.addClass('active');
        //获取上一级ul元素
        var parentItemUl = currentItemLi.parent();
        //展开菜单
        parentItemUl.addClass("mm-show");
        var parentItemLi = parentItemUl.parent();
        // console.log("元素的html内容:"+parentItemLi.html());
        //设置父菜单项为active 状态
        parentItemLi.addClass("mm-active");
    });
    //根据传进去的参数设置菜单的状态
</script>

</body>
</html>
