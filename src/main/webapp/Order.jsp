<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kbhkn.model.*, com.kbhkn.service.impl.GenericServiceImpl"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	request.setAttribute("allOrders", new GenericServiceImpl().findAll(Order.class));
	request.setAttribute("allProducts", new GenericServiceImpl().findAll(Product.class));
	request.setAttribute("allUsers", new GenericServiceImpl().findAll(User.class));
%>
<!DOCTYPE html>
<html lang="tr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Order Actions</title>
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
                    <li><a href="User.jsp">User</a></li>
                    <li class="active"><a href="Product.jsp">Product</a></li>
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
                    <h1 style="color: #000000;">Order Actions</h1>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    <strong>Order Add</strong>
                                </h3>
                            </div>
                            <div class="panel-body">
                                <form action="orderProcess.do" method="post" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Product</label>
                                        <div class="col-lg-5">
                                            <select title="Choose it product" class="form-control" name="productId">
												<c:forEach items="${allProducts}" var="p">
													<option value="${p.productId}">${p.productName} - ${p.productInfo} - ${p.productPrice} ₺</option>
												</c:forEach>
											</select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">User</label>
                                        <div class="col-lg-5">
                                            <select title="Choose it user" class="form-control" name="userId">
												<c:forEach items="${allUsers}" var="u">
													<option value="${u.userId}">${u.username}</option>
												</c:forEach>
											</select>
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Quantity</label>
                                        <div class="col-lg-5">
                                            <input type="number" name="qty" required="required" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 control-label"></label>
                                        <div class="col-lg-2">
                                            <input type="hidden" name="processType" value="add" />
                                            <input type="submit" class="form-control btn btn-success" value="Add Order" />
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
                                    <strong>All Products</strong>
                                </h3>
                            </div>
                            <div class="panel-body">
                                <table class="footable table table-bordered toggle-circle">
                                    <thead>
                                        <tr>
                                            <th>Order ID</th>
                                            <th>User</th>
                                            <th>Product</th>
                                            <th>Unit price</th>
                                            <th>Order date</th>
                                            <th>Total sales</th>
                                            <th>Total Price</th>
                                            <td data-sort-ignore="true"></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${allOrders}" var="o">
                                            <tr>
                                                <td>${o.orderId}</td>
                                                <td>${o.user.username}</td>
                                                <td>${o.product.productName}</td>
                                                <td>${o.product.productPrice} ₺</td>
                                                <td>${o.orderDate}</td>
                                                <td>${o.orderCount}</td>
                                                <td>${o.product.productPrice * o.orderCount} ₺</td>
                                                <td><a href="orderProcess.do?orderId=${o.orderId}&processType=delete" class="btn btn-danger btn-sm">Sil  <i class="glyphicon glyphicon-trash" aria-hidden="true"></i></a></td>
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
</body>
</html>
