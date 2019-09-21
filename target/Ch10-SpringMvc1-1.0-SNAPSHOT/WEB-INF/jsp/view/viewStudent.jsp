
<template:user_backend htmlTitle="${student.name}"
                       bodyTitle="学生信息详情">


    <div class="panel panel-default">
        <div class="panel-heading">
            <strong>当前管理员:</strong>  ${student.admin.adminname}
        </div>

        <div class="panel-heading">
            <strong>工号#</strong>  ${student.admin.adminId}
        </div>
        <div class="panel-heading">
            <strong>姓名:</strong>  ${student.name}
        </div>
        <div class="panel-heading">
            <strong>性别:</strong>  ${student.sex}
        </div>

        <div class="panel-heading">
            <strong>状态:</strong>  <c:if test="${student.status eq 0}">未审核</c:if>
            <c:if test="${student.status eq 1}">审核通过</c:if>
        </div>
        <div class="panel-heading">
            <strong>电话:</strong>  ${student.cellphone}
        </div>
        <div class="panel-heading">
            <strong>家庭地址:</strong> ${student.address}
        </div>

        <div class="panel-heading">
            <c:if test="${student.attachments.size() > 0}">
                <c:forEach items="${student.attachments}" varStatus="v"
                           var="attachment">
                    <li>
                        附件${v.count}:
                        文件名: ${attachment.fileName} <br>
                        下载地址:<a href="${cx}${attachment.fileUrl }" class="btn btn-default btn-sm" role="button">下载</a><br>
                        附件类型:${attachment.mimeType}<br>
                    </li>
                </c:forEach>
            </c:if>
        </div>
        <div class="panel-heading">
            <strong>创建时间:</strong> <fmt:formatDate value="${student.dateCreated}"
                                                   pattern="yyyy年MM月dd日 E hh时mm分ss秒"/>
        </div>

    </div>

    <a href="${cx}/student/"  class="btn btn-primary btn-lg" role="button">返回票据列表 </a>

    <script>
        //设置页面对应的菜单选项
        var ItemId ="Item1_0";
    </script>
</template:user_backend>
