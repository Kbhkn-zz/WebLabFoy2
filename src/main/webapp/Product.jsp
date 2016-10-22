<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.kbhkn.model.Product, com.kbhkn.service.impl.GenericServiceImpl"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	request.setAttribute("allProducts", new GenericServiceImpl().findAll(Product.class));	
%>
<!DOCTYPE html>
<html lang="tr">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Product Actions</title>
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
                    <h1 style="color: #000000;">Product Actions</h1>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h3 class="panel-title">
                                    <strong>Product Add</strong>
                                </h3>
                            </div>
                            <div class="panel-body">
                                <form action="productProcess.do" method="post" class="form-horizontal">
                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Name</label>
                                        <div class="col-lg-5">
                                            <input type="text" name="productname" required="required" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Info</label>
                                        <div class="col-lg-8">
                                            <input type="text" name="productinfo" required="required" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 control-label">Price</label>
                                        <div class="col-lg-5">
                                            <input type="number" name="productprice" required="required" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <label class="col-lg-3 control-label"></label>
                                        <div class="col-lg-2">
                                            <input type="hidden" name="processType" value="add" />
                                            <input type="submit" class="form-control btn btn-success" value="Add Product" />
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
                                            <th>Product ID</th>
                                            <th>Name</th>
                                            <th>Info</th>
                                            <th>Price</th>
                                            <td data-sort-ignore="true"></td>
                                            <td data-sort-ignore="true"></td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${allProducts}" var="p">
                                            <tr>
                                                <td>${p.productId}</td>
                                                <td>${p.productName}</td>
                                                <td>${p.productInfo}</td>
                                                <td>${p.productPrice} ₺</td>
                                                <td><a href="productProcess.do?productId=${p.productId}&processType=delete" class="btn btn-danger btn-sm">Sil <i class="glyphicon glyphicon-trash" aria-hidden="true"></i></a></td>
                                                <td><a href="#" data-toggle="modal" data-target="#EditProductModal" class="btn btn-primary btn-sm" data-product-id="${p.productId}" data-product-name="${p.productName}" data-product-info="${p.productInfo}" data-product-price="${p.productPrice}"> Güncelle <i class="glyphicon glyphicon-refresh" aria-hidden="true"></i></a></td>
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
    <div class="modal fade" id="EditProductModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">Update User</h4>
                </div>
                <div class="modal-body">
                    <form action="productProcess.do" method="post" class="form-horizontal">
                        <input type="hidden" name="productId" id="productId" required="required" />
                        <div class="form-group">
                            <label class="col-lg-3 control-label">Name</label>
                            <div class="col-lg-5">
                                <input type="text" name="productname" id="productname" required="required" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Info</label>
                            <div class="col-lg-8">
                                <input type="text" name="productinfo" id="productinfo" required="required" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">Price</label>
                            <div class="col-lg-5">
                                <input type="number" name="productprice" id="productprice" required="required" />
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