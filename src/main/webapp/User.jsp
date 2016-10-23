<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kbhkn.model.User, com.kbhkn.service.impl.GenericServiceImpl"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	request.setAttribute("allUsers", new GenericServiceImpl().findAll(User.class));	
%>
<!DOCTYPE html>
<html lang="tr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>User Actions</title>
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
    <nav class="navbar navbar-default navbar-fixed-top">
        <div class="container">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                	<span class="sr-only">Toggle navigation</span>
                	<span class="icon-bar"></span>
                	<span class="icon-bar"></span>
                	<span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">Föy 2</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav">
                    <li class="active"><a href="User.jsp">User</a></li>
                    <li><a href="Product.jsp">Product</a></li>
                    <li><a href="Order.jsp">Order</a></li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                </ul>
            </div>
        </div>
    </nav>
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="page-header" style="margin-top: -8px">
                    <h1 style="color: #000000;">User Actions</h1>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    <strong>User Add</strong>
                                </h3>
                            </div>
                            <div class="panel-body">
                                <form action="userProcess.do" method="post" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Username</label>
                                        <div class="col-lg-5">
                                            <input type="text" name="username" required="required" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Password</label>
                                        <div class="col-lg-5">
                                            <input type="password" name="password" required="required" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label"></label>
                                        <div class="col-lg-2">
                                            <input type="hidden" name="processType" value="add" />
                                            <input type="submit" class="form-control btn btn-success" value="${!u.userId? 'Add User' : 'Update User'}" />
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-12">
                        <div class="panel panel-success">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    <strong>All Users</strong>
                                </h3>
                            </div>
                            <div class="panel-body">
                                <table class="footable table table-bordered toggle-circle">
                                    <thead>
                                        <tr>
                                            <th>User ID</th>
                                            <th>Username</th>
                                            <th>Password</th>
                                            <td data-sort-ignore="true"></td>
                                            <td data-sort-ignore="true"></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${allUsers}" var="u">
                                            <tr>
                                                <td>${u.userId}</td>
                                                <td>${u.username}</td>
                                                <td>${u.password}</td>
                                                <td><a href="userProcess.do?userId=${u.userId}&processType=delete" class="btn btn-danger btn-sm">Delete  <i class="glyphicon glyphicon-trash" aria-hidden="true"></i></a></td>
                                                <td><a href="#" data-toggle="modal" data-target="#EditUserModal" class="btn btn-primary btn-sm" data-user-id="${u.userId}" data-user-name="${u.username}"> Update <i class="glyphicon glyphicon-refresh" aria-hidden="true"></i></a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="EditUserModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Update User</h4>
                </div>
                <div class="modal-body">
                    <form action="userProcess.do" method="post" class="form-horizontal">
                        <input type="hidden" name="userId" id="userId" />
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Username</label>
                            <div class="col-lg-5">
                                <input type="text" name="username" id="username" required="required" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Password</label>
                            <div class="col-lg-5">
                                <input type="password" name="password" id="password" required="required" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label"></label>
                            <div class="col-lg-2">
                                <input type="hidden" name="processType" value="update" />
                                <input type="submit" class="form-control btn btn-success" value="Update" />
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="static/js/jquery.min.js"></script>
    <script src="static/js/bootstrap.min.js"></script>
    <script src="static/js/custom.js"></script>
</body>
</html>
