<template:user_backend htmlTitle="查询学生信息"
                           bodyTitle="查询学生信息">

        <form method="GET" id="searchform" action="${cx}/student/select" style="text-align: center">
            <fieldset class="search">
                <input type="text" class="box" name="name" placeholder="请输入名字。。。"/>
                <button class="btn" title="Submit Search">Search</button>${msg}
            </fieldset>
        </form>

    <div class="panel panel-default">
        <div class="panel-heading">

       <c:forEach var="i" begin="0" end="${resultstudent.size()}">
           <div class="panel-heading">
           姓名：${resultstudent[i].name}
           性别：${resultstudent[i].sex}
           地址：${resultstudent[i].address}
           电话号码：${resultstudent[i].cellphone}
           学生ID:${resultstudent[i].studentId}
           <%--操作员：${resultstudent[i].admin.adminname}--%>
           创建时间：<fmt:formatDate value="${resultstudent[i].dateCreated}"
                                pattern="yyyy年MM月dd日 E hh时mm分ss秒"/>
           状态：<c:if test="${resultstudent[i].status eq 0}">未审核</c:if>
           <c:if test="${resultstudent[i].status eq 1}">审核通过</c:if>
           </div>
       </c:forEach>
        </div>
    </div>

    <script>
        //设置页面对应的菜单选项
        var ItemId ="Item1_0";
    </script>
</template:user_backend>
