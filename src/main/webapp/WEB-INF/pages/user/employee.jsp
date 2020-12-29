<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap/css/bootstrap.min.css">

    <script href="${APP_PATH}/static/jquery/jquery-2.1.1.min.js"></script>
    <script src="${APP_PATH}/static/bootstrap/js/bootstrap.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1>SSMSuper-CURD</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-8">
                <button type="button" class="btn btn-primary">Add</button>
                <button type="button" class="btn btn-danger">Delete</button>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>#</th>
                        <th>LastName</th>
                        <th>Gender</th>
                        <th>Email</th>
                        <th>Department</th>
                        <th>Operation</th>
                    </tr>
                    <c:forEach items="${requestScope.pageInfo.list}" var="emp">
                    <tr>
                        <td>${emp.id}</td>
                        <td>${emp.lastName}</td>
                        <td>${emp.gender == "1"? Male : Female}</td>
                        <td>${emp.email}</td>
                        <td>${emp.department.deptName}</td>
                        <td>
                            <button type="button" class="btn btn-info btn-sm">
                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                Edit
                            </button>
                            <button type="button" class="btn btn-danger btn-sm">
                                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
                                Remove
                            </button>
                        </td>
                    </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                Now is for [ ${pageInfo.pageNum} ] page ,
                The total Page is [ ${pageInfo.pages} ],
                Datas : [ ${pageInfo.total} ]
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-md-offset-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">

                        <li><a href="?pageNo=1">First Page</a></li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li>
                                <a href="?pageNo=${pageInfo.pageNum - 1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                            <c:if test="${page_Num == pageInfo.pageNum}">
                                <li class="active"><a href="#">${page_Num}</a></li>
                            </c:if>
                            <c:if test="${page_Num != pageInfo.pageNum}">
                                <li ><a href="?pageNo=${page_Num}">${page_Num}</a></li>
                            </c:if>
                        </c:forEach>


                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="?pageNo=${pageInfo.pageNum + 1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <li><a href="?pageNo=${pageInfo.pages}">Last Page</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</body>
</html>
