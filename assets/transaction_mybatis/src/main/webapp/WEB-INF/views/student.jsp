<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%-- jstl-1.2.jar 파일 필요 --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SIST_쌍용교육센터</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>
div#input:hover, div#output:hover {
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
}
</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {

	});


</script>
</head>
<body>
	<div class="container">

		<div class="panel page-header" style="text-align:center;">
			<h1 style="font-size:xx-large;">
				<a href="${pageContext.request.contextPath}/student/list"><img src="${pageContext.request.contextPath}/resources/img/sist_logo.png" alt="sist_logo.png"> </a>
				트랜잭션 <small>v3.0</small> 
			</h1>
		</div>

		<div class="panel panel-default" id="input">
			<div class="panel-heading">입력</div>
			<div class="panel-body">

				<form action="${pageContext.request.contextPath}/student/insert" method="post">
				
					<div class="form-group">
						<label for="name">Name:</label> <input type="text"
							class="form-control" id="name" name="name" required>
					</div>
					<div class="form-group">
						<label for="age">Age:</label> <input type="text"
							class="form-control" id="age" name="age" required>
					</div>
					<div class="form-group">
						<label for="marks">Marks:</label> <input type="text"
							class="form-control" id="marks" name="marks">
					</div>
					
					<div class="form-group">
						<label for="year">Year:</label> <input type="text"
							class="form-control" id="year" name="year">
					</div>
				
					<button type="submit" class="btn btn-default">Submit</button>
					
					<c:if test="${param.success==1}">
					<div class="alert alert-success alert-dismissible fade in" style="display:inline-block; padding-top:5px; padding-bottom:5px; margin:0px;">  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>  <strong>Success!</strong> 요청한 작업이 처리되었습니다. </div>
					</c:if>
					<c:if test="${param.success==0}">
					<div class="alert alert-danger alert-dismissible fade in" style="display:inline-block; padding-top:5px; padding-bottom:5px; margin:0px;">  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>  <strong>Fail!</strong> 요청한 작업 처리가 실패했습니다. </div>
					</c:if>
					
				</form>
			</div>
		</div>

		<div class="panel panel-default" id="output">
			<div class="panel-heading">출력</div>
			<div class="panel-body">

				<table class="table table-striped">
					<thead>
						<tr>
							<th>Id</th>
							<th>Name</th>
							<th>Marks</th>
							<th>Year</th>
							<th>Age</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="m" items="${list}">
						<tr>
							<td>${m.id}</td>
							<td>${m.name}</td>
							<td>${m.marks}</td>
							<td>${m.year}</td>
							<td>${m.age}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
								
			</div>
		</div>

	</div>

</body>
</html>