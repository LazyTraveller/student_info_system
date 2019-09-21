<template:user_backend htmlTitle="学生信息列表" bodyTitle="查看学生信息">
    <c:choose>
        <c:when test="${ticketList.size()==0}">
            <h3>目前系统没有任何学生信息</h3>
        </c:when>
        <c:otherwise>
            <strong>学生总数:${ticketList.size()}</strong>
        </c:otherwise>
    </c:choose>

    <div class="panel panel-default ">
        <!-- Default panel contents -->
        <div class="panel-heading clearfix">
            <div class="pull-right">
                <div class="btn-group">
                    <button type="button" class="btn btn-default dropdown-toggle active" data-toggle="dropdown">
                        每页记录数 <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="#">20</a></li>
                        <li><a href="#">30</a></li>
                        <li class="divider"></li>
                        <li><a href="#">50</a></li>
                    </ul>
                </div>
                <div class="btn-group">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        用户名排序 <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu pull-right" role="menu">
                        <li><a href="#">升排序</a></li>
                        <li><a href="#">类型排序</a></li>
                        <li class="divider"></li>
                        <li><a href="#">Reset</a></li>
                    </ul>
                </div>
            </div>
            <div class="pull-left">
                <button class="btn btn-success" data-backdrop="static">新建</button>
                <button class="btn btn-danger">删除</button>
            </div>
        </div>


        <table id="List" class="table table-bordered table-hover cc">
            <thead>
            <tr class="">
                <td class="text-center">
                    <input type="checkbox"></td>
                <th>序号</th>
                <th>票据ID号</th>
                <th>主题</th>
                <th>客户姓名</th>
                <th>票据类型</th>
                <th>金额</th>
                <th>状态</th>
                <th class="col-lg-3">操作</th>
            </tr>
            </thead>
            <tbody class="">

            <!--遍历输出所有票据内容-->
            <c:forEach var="ticket" items="${ticketList}"
                       varStatus="s">
            <tr>
                <td class="text-center">
                    <input type="checkbox"></td>
                <td class="text-center">${s.count}</td>
                <td>#${ticket.ticketId}</td>
                <td>${ticket.subject}</td>
                <td>${ticket.user.username}</td>
                <td>${ticket.type}</td>
                <td>${ticket.money}</td>
                <td><c:if test="${ticket.status eq 0}">未审核</c:if>
                    <c:if test="${ticket.status eq 1}">审核通过</c:if></td>
                <td>
                    <button class="btn  btn-xs btn-info" style="color: white;"><span class="glyphicon glyphicon-list"></span>
                       <a href="${cx}/tickets/view/${ticket.ticketId}"> 详情</a></button>
                    <button class="btn  btn-xs btn-success"><span class="glyphicon glyphicon-user"></span>
                        <a href="${cx}/tickets/edit/${ticket.ticketId}"> 编辑</a></button>
                    <button class="btn  btn-xs btn-danger"><span class="glyphicon glyphicon-user">
                        <a href="${cx}/tickets/del/${ticket.ticketId}"> 删除</a>
                    </span></button>

                </td>
            </tr>
            </c:forEach>
            </tbody>
        </table>

        <ul class="list-group">
            <!-- <li class="list-group-item">
                <div class="alert alert-warning">No user record!</div>
            </li>-->
            <li class="list-group-item">

                <ul class="pagination square green">
                    <li class="disabled"><span>Prev</span></li>
                    <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li class="disabled"><span>...</span></li>
                    <li><a href="#">14</a></li>
                    <li><a href="#">15</a></li>
                    <li><a href="#">16</a></li>
                    <li><a href="#">17</a></li>
                    <li><a href="#">Next</a></li>
                </ul>
            </li>
        </ul>

    </div>


</template:user_backend>
<script>
    var ItemId="Item1_2";
    //使用jq弹出一个是否删除记录的提示框
    $(document).ready(function () {
        $(".ticketDel").click(function () {
            if (confirm("确定删除票据?")) {
                return true;
            }
            return false;
        });
    });

</script>

