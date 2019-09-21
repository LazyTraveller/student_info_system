
<template:user_backend htmlTitle="${ticket.subject}"
                       bodyTitle="学生信息详情">


    <div class="panel panel-default">
        <div class="panel-heading">
            <strong>当前管理员:</strong>  ${ticket.user.username}
        </div>

        <div class="panel-heading">
            <strong>工号#</strong>  ${ticket.user.userId}
        </div>
        <div class="panel-heading">
            <strong>姓名:</strong>  ${ticket.subject}
        </div>
        <div class="panel-heading">
            <strong>性别:</strong>  ${ticket.type}
        </div>

        <div class="panel-heading">
            <strong>状态:</strong>  <c:if test="${ticket.status eq 0}">未审核</c:if>
            <c:if test="${ticket.status eq 1}">审核通过</c:if>
        </div>
        <div class="panel-heading">
            <strong>电话:</strong>  ${ticket.money}
        </div>
        <div class="panel-heading">
            <strong>家庭地址:</strong> ${ticket.body}
        </div>

        <div class="panel-heading">
            <c:if test="${ticket.attachments.size() > 0}">
                <c:forEach items="${ticket.attachments}" varStatus="v"
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
            <strong>创建时间:</strong> <fmt:formatDate value="${ticket.dateCreated}"
                                                   pattern="yyyy年MM月dd日 E hh时mm分ss秒"/>
        </div>

    </div>

    <a href="${cx}/tickets/"  class="btn btn-primary btn-lg" role="button">返回票据列表 </a>

    <script>
        //设置页面对应的菜单选项
        var ItemId ="Item1_0";
    </script>
</template:user_backend>
