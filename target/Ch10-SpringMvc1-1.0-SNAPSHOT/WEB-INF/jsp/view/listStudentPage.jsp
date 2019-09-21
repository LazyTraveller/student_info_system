<template:user_backend htmlTitle="学生信息列表" bodyTitle="查看学生信息">
    <c:choose>
        <c:when test="${pageInfo.list.size()==0}">
            <h3>目前系统没有任何学生信息</h3>
        </c:when>
        <c:otherwise>
            <strong>总记录数:${pageInfo.total}, 总页数:${pageInfo.pages},
                第${pageInfo.pageNum}页,
                记录:${pageInfo.startRow}-${pageInfo.endRow},
                总数:${pageInfo.size}</strong>
        </c:otherwise>
    </c:choose>

    <div class="panel panel-default ">
        <!-- Default panel contents -->
        <div class="panel-heading clearfix">
            <div class="pull-right">
                <div class="btn-group">
                    <button type="button"
                            class="btn btn-default dropdown-toggle active"
                            data-toggle="dropdown">
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
                    <button type="button"
                            class="btn btn-default dropdown-toggle"
                            data-toggle="dropdown">
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
                <button class="btn btn-success" data-backdrop="static">新建
                </button>
                <button class="btn btn-danger">删除</button>
            </div>
        </div>


        <table id="List" class="table table-bordered table-hover cc">
            <thead>
            <tr class="">
                <td class="text-center">
                    <input type="checkbox"></td>
                <th>序号</th>
                <th>学生ID号</th>
                <th>姓名</th>
                <th>操作员</th>
                <th>性别</th>
                <th>电话</th>
                <th>家庭地址</th>
                <th>状态</th>
                <th class="col-lg-3">操作</th>
            </tr>
            </thead>
            <tbody class="">

            <!--遍历输出所有学生信息内容-->
            <c:forEach var="student" items="${pageInfo.list}"
                       varStatus="s">
                <tr>
                    <td class="text-center">
                        <input type="checkbox"></td>
                    <td class="text-center">${s.count}</td>
                    <td>#${student.studentId}</td>
                    <td>${student.name}</td>
                    <td>${student.admin.adminname}</td>
                    <td>${student.sex}</td>
                    <td>${student.cellphone}</td>
                    <td>${student.address}</td>
                    <td><c:if test="${student.status eq 0}">未审核</c:if>
                        <c:if test="${student.status eq 1}">审核通过</c:if></td>
                    <td>
                        <button class="btn  btn-xs btn-info"
                                style="color: white;"><span
                                class="glyphicon glyphicon-list"></span>
                            <a href="${cx}/student/view/${student.studentId}">
                                详情</a></button>
                        <button class="btn  btn-xs btn-success"><span
                                class="glyphicon glyphicon-user"></span>
                            <a href="${cx}/student/edit/${student.studentId}">
                                编辑</a></button>

                        <button class="btn  btn-xs btn-danger ticketDel"><span
                                class="glyphicon glyphicon-user">
                        <a href="${cx}/student/del/${student.studentId}"> 删除</a>
                    </span></button>

                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
        <div class="col-md-12 text-right">
            <zsc:page url="${cx}/student/list"/>
        </div>
    </div>


</template:user_backend>
<script>
    var ItemId = "Item1_2";
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

