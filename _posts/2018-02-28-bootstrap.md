---
layout: post
title: "Bootstrap"
description: "Bootstrap"
categories: [Bootstrap]
tags: [Bootstrap]
redirect_from:
  - /2018/02/28/
---



# 기본 템플릿

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Jiyoung's Test</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script>
$(document).ready(function() {
	
});
</script>
</head>
<body>

<div class="container">

<!-- Modal -->
<div id="myModal">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">로그인</h4>
        <p>정상적인 서비스 이용을 위해서 로그인이 필요합니다</p>
      </div>
      <div class="modal-body">
        <form action="/action_page.php">
		  <div class="form-group">
		    <label for="email">ID:</label>
		    <input type="email" class="form-control" id="email">
		  </div>
		  <div class="form-group">
		    <label for="pwd">PW:</label>
		    <input type="password" class="form-control" id="pwd">
		  </div>
		  <div class="checkbox">
		    <label><input type="checkbox"> Remember me</label>
		  </div>
		  <button type="submit" class="btn btn-default">Submit</button>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>




</div>
</body>
</html>
```



# Grid

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Jiyoung's Test</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
$(document).ready(function() {
	
});
</script>
</head>
<body>

<div class="container">

		<h1>Bootstrap Grid</h1>
		<div class="row">
			<div class="col-*-*">1</div>
			<div class="col-*-*">2</div>
		</div>
		<div class="row">
			<div class="col-sm-4">col-sm-4</div>
			<div class="col-sm-4">col-sm-4</div>
			<div class="col-sm-4">col-sm-4</div>
		</div>

	</div>
</body>
</html>
```



# Typography

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Jiyoung's Test</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
$(document).ready(function() {
	
});
</script>
</head>
<body>

<div class="container">
		<div>
			<h1>Text/Typography</h1>
			<h1>h1 Bootstrap heading (36px)</h1>
			<h2>h2 Bootstrap heading (30px)</h2>
			<h3>h3 Bootstrap heading (24px)</h3>
			<h4>h4 Bootstrap heading (18px)</h4>
			<h5>h5 Bootstrap heading (14px)</h5>
			<h6>h6 Bootstrap heading (12px)</h6>
		</div>
		
		<div>
			<h1>h1 heading <small>secondary text</small></h1>
		</div>

		<div>
			<h1>Code Snippets</h1>
			<p>
				The following HTML elements:
				<code>span</code>
				,
				<code>section</code>
				, and
				<code>div</code>
				defines a section in a document.
			</p>
		</div>

		<div>
			<h1>Keyboard Inputs</h1>
			<p>
				Use
				<kbd>ctrl + p</kbd>
				to open the Print dialog box.
			</p>
		</div>

		<div>
			<h1>Multiple Code Lines</h1>
			<pre>
			Text in a pre element
			is displayed in a fixed-width
			font, and it preserves
			both      spaces and
			line breaks.
			</pre>
		</div>

		<div>
			<p class="bg-success">This text indicates success.</p>
		</div>

	</div>
</body>
</html>
```



# Tables

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Jiyoung's Test</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>

	<div class="container">
		<h2>Basic Table</h2>
		<table class="table">
			<thead>
				<tr>
					<th>Firstname</th>
					<th>Lastname</th>
					<th>Email</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>John</td>
					<td>Doe</td>
					<td>john@example.com</td>
				</tr>
				<tr>
					<td>Mary</td>
					<td>Moe</td>
					<td>mary@example.com</td>
				</tr>
				<tr>
					<td>July</td>
					<td>Dooley</td>
					<td>july@example.com</td>
				</tr>
			</tbody>
		</table>

		<table class="table table-striped">
			<thead>
				<tr>
					<th>Firstname</th>
					<th>Lastname</th>
					<th>Email</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>John</td>
					<td>Doe</td>
					<td>john@example.com</td>
				</tr>
				<tr>
					<td>Mary</td>
					<td>Moe</td>
					<td>mary@example.com</td>
				</tr>
				<tr>
					<td>July</td>
					<td>Dooley</td>
					<td>july@example.com</td>
				</tr>
			</tbody>
		</table>

		<table class="table table-responsive">
			<thead>
				<tr>
					<th>Firstname</th>
					<th>Lastname</th>
					<th>Email</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>John</td>
					<td>Doe</td>
					<td>john@example.com</td>
				</tr>
				<tr>
					<td>Mary</td>
					<td>Moe</td>
					<td>mary@example.com</td>
				</tr>
				<tr>
					<td>July</td>
					<td>Dooley</td>
					<td>july@example.com</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>
```



# Images

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Jiyoung's Test</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>
	<div class="container">
		<h2>Image Gallery</h2>
		<div class="row">
			<div class="col-md-4">
				<div class="thumbnail">
					<img src="img_forest.jpg" alt="forest" style="width: 100%">
					<div class="caption">
						<p>forest...</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="thumbnail">
					<img src="img_lights.jpg" alt="lights" style="width: 100%">
					<div class="caption">
						<p>lights...</p>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="thumbnail">
					<img src="img_fjords.jpg" alt="fjords" style="width: 100%">
					<div class="caption">
						<p>fjords...</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
```



# Alert

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Jiyoung's Test</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
$(document).ready(function() {
	
});
</script>
</head>
<body>

<div class="container">

		<div class="alert alert-success alert-dismissible">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
			<strong>Success!</strong> Indicates a successful or positive action.
		</div>

</div>
</body>
</html>
```





# Buttons

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Jiyoung's Test</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
$(document).ready(function() {
	
});
</script>
</head>
<body>

<div class="container">
	<h1>Bootstrap Buttons</h1>
	<div style="margin-bottom:30px">
		<button type="button" class="btn btn-default">회원가입</button>
		<button type="button" class="btn btn-default">상세보기</button>
		<button type="button" class="btn btn-default">글쓰기</button>
	</div>
	
	<div style="margin-bottom:30px">
		<button type="button" class="btn btn-default btn-sm">회원가입</button>
		<button type="button" class="btn btn-default btn-sm">상세보기</button>
		<button type="button" class="btn btn-default btn-sm">글쓰기</button>
	</div>
	
	<div class="btn-group" style="margin-bottom:30px">
		<button type="button" class="btn btn-default btn-sm">회원가입</button>
		<button type="button" class="btn btn-default btn-sm">상세보기</button>
		<button type="button" class="btn btn-default btn-sm">글쓰기</button>
	</div>
	
	<div style="margin-bottom:30px">
		<button type="button" class="btn btn-default btn-sm btn-block">로그인</button>
	</div>
	
	<h2>Basic Table</h2>
		<table class="table">
			<thead>
				<tr>
					<th>Firstname</th>
					<th>Lastname</th>
					<th>Email</th>
					<th>Delete</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>John</td>
					<td>Doe</td>
					<td>john@example.com</td>
					<td><button type="button" class="btn btn-default btn-sm btn-block">Delete</button></td>
				</tr>
				<tr>
					<td>Mary</td>
					<td>Moe</td>
					<td>mary@example.com</td>
					<td><button type="button" class="btn btn-default btn-sm btn-block">Delete</button></td>					
				</tr>
				<tr>
					<td>July</td>
					<td>Dooley</td>
					<td>july@example.com</td>
					<td><button type="button" class="btn btn-default btn-sm btn-block disabled">Delete</button></td>					
				</tr>
			</tbody>
		</table>
</div>
</body>
</html>
```



# Glyphicons

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Jiyoung's Test</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
$(document).ready(function() {
	
});
</script>
</head>
<body>

	<div class="container">
		<h1>Bootstrap Glyphicons</h1>
		<button type="button" class="btn btn-default">
			<span class="glyphicon glyphicon-search"></span> Search
		</button>

	</div>
</body>
</html>
```



# Badges

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Jiyoung's Test</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
$(document).ready(function() {
	
});
</script>
</head>
<body>

	<div class="container">
		<h1>Bootstrap Badges</h1>
		<div>
			<button type="button" class="btn btn-default">Primary <span class="badge">7</span></button>
		</div>
		
		
		<h2>Basic Table</h2>
		<table class="table">
			<thead>
				<tr>
					<th>Firstname</th>
					<th>Lastname</th>
					<th>Email</th>
					<th>수강신청회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>John</td>
					<td>Doe</td>
					<td>john@example.com</td>
					<td><span class="badge">2</span></td>
				</tr>
				<tr>
					<td>Mary</td>
					<td>Moe</td>
					<td>mary@example.com</td>
					<td><span class="badge">1</span></td>					
				</tr>
				<tr>
					<td>July</td>
					<td>Dooley</td>
					<td>july@example.com</td>
					<td><span class="badge">3</span></td>					
				</tr>
			</tbody>
		</table>
		<div>
			<button type="button" class="btn btn-default">Total Count <span class="badge">6</span></button>
		</div>
	</div>
	
</body>
</html>
```



# Progress Bars

```html

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SIST_쌍용교육센터</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script>
	$(document).ready(function() {

		// jQuery methods go here...

	});
</script>
</head>
<body>

	<div class="container">

		<h1>Bootstrap Progress Bars</h1>
		<div>
			<h3>2018.01~2018.05</h3>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>과목명</th>
						<th>기간</th>
						<th>강사</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Java SE</td>
						<td>2018.01~2018.02</td>
						<td>john@example.com</td>
					</tr>
					<tr>
						<td>Oracle</td>
						<td>2018.02~2018.02</td>
						<td>mary@example.com</td>
					</tr>
					<tr>
						<td>JDBC</td>
						<td>2018.02~2018.03</td>
						<td>july@example.com</td>
					</tr>
					<tr>
						<td>Project</td>
						<td>2018.03~2018.05</td>
						<td>july@example.com</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="progress">
			<div class="progress-bar progress-bar-success" role="progressbar"
				style="width: 40%">Java SE</div>
			<div class="progress-bar progress-bar-warning" role="progressbar"
				style="width: 20%">Oracle</div>
			<div class="progress-bar progress-bar-danger" role="progressbar"
				style="width: 10%">JDBC</div>
			<div class="progress-bar progress-bar-info" role="progressbar"
				style="width: 30%">Project</div>
		</div>

	</div>

</body>
</html>
```



# Panels

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Jiyoung's Test</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>

	<div class="container">

		<h1>Bootstrap Panels</h1>

		<div class="panel panel-default">
			<div class="panel-heading"><h4>2018.01~2018.05</h4></div>
			<div class="panel-body">
				<table class="table">
					<thead>
						<tr>
							<th>Firstname</th>
							<th>Lastname</th>
							<th>Email</th>
							<th>수강신청회수</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>John</td>
							<td>Doe</td>
							<td>john@example.com</td>
							<td><span class="badge">2</span></td>
						</tr>
						<tr>
							<td>Mary</td>
							<td>Moe</td>
							<td>mary@example.com</td>
							<td><span class="badge">1</span></td>
						</tr>
						<tr>
							<td>July</td>
							<td>Dooley</td>
							<td>july@example.com</td>
							<td><span class="badge">3</span></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>

	</div>
</body>
</html>
```



# Collapse

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Jiyoung's Test</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>

	<div class="container">

		<h1>Basic Collapse</h1>
		<div>
			<h3>2018.01~2018.05</h3>
			<table class="table table-striped">
				<thead>
					<tr>
						<th>과목명</th>
						<th>기간</th>
						<th>강사</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Java SE
							<button type="button" class="btn btn-xs" data-toggle="collapse"
								data-target="#demo">과목설명</button>
							<div id="demo" class="collapse">Java입니다</div>
						</td>
						<td>2018.01~2018.02</td>
						<td>john@example.com</td>
					</tr>
					<tr>
						<td>Oracle
							<button type="button" class="btn btn-xs" data-toggle="collapse"
								data-target="#demo2">과목설명</button>
							<div id="demo2" class="collapse">Oracle입니다</div>
						</td>
						<td>2018.02~2018.02</td>
						<td>mary@example.com</td>
					</tr>
					<tr>
						<td>JDBC
							<button type="button" class="btn btn-xs" data-toggle="collapse"
								data-target="#demo3">과목설명</button>
							<div id="demo3" class="collapse">JDBC입니다</div>
						</td>
						<td>2018.02~2018.03</td>
						<td>july@example.com</td>
					</tr>
					<tr>
						<td>Project
							<button type="button" class="btn btn-xs" data-toggle="collapse"
								data-target="#demo4">과목설명</button>
							<div id="demo4" class="collapse">Prjoject입니다</div>								
						</td>
						<td>2018.03~2018.05</td>
						<td>july@example.com</td>
					</tr>
				</tbody>
			</table>
		</div>

	</div>
</body>
</html>
```



# Tabs

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Jiyoung's Test</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>

	<div class="container">
		<h1>Bootstrap Tabs</h1>

		<h3> 강사 강의 일정 </h3>
		<ul class="nav nav-tabs">
			<li class="active"><a href="design014_1.html">예정</a></li>
			<li><a href="design014_2.html">진행</a></li>
			<li><a href="design014_3.html">종료</a></li>
		</ul>
		
		<table class="table table-striped">
				<thead>
					<tr>
						<th>과목명</th>
						<th>기간</th>
						<th>강사</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>JDBC
							<button type="button" class="btn btn-xs" data-toggle="collapse"
								data-target="#demo3">과목설명</button>
							<div id="demo3" class="collapse">JDBC입니다</div>
						</td>
						<td>2018.02~2018.03</td>
						<td>july@example.com</td>
					</tr>
					<tr>
						<td>Project
							<button type="button" class="btn btn-xs" data-toggle="collapse"
								data-target="#demo4">과목설명</button>
							<div id="demo4" class="collapse">Prjoject입니다</div>								
						</td>
						<td>2018.03~2018.05</td>
						<td>july@example.com</td>
					</tr>
				</tbody>
			</table>
	</div>
</body>
</html>
```

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Jiyoung's Test</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>

	<div class="container">
		<h1>Bootstrap Tabs</h1>

		<h3> 강사 강의 일정 </h3>
		<ul class="nav nav-tabs">
			<li><a href="design014_1.html">예정</a></li>
			<li class="active"><a href="design014_2.html">진행</a></li>
			<li><a href="design014_3.html">종료</a></li>
		</ul>
		
		<table class="table table-striped">
				<thead>
					<tr>
						<th>과목명</th>
						<th>기간</th>
						<th>강사</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>Oracle
							<button type="button" class="btn btn-xs" data-toggle="collapse"
								data-target="#demo2">과목설명</button>
							<div id="demo2" class="collapse">Oracle입니다</div>
						</td>
						<td>2018.02~2018.02</td>
						<td>mary@example.com</td>
					</tr>
				</tbody>
			</table>
	</div>
</body>
</html>
```

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Jiyoung's Test</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>

	<div class="container">
		<h1>Bootstrap Tabs</h1>

		<h3>강사 강의 일정</h3>
		<ul class="nav nav-tabs">
			<li><a href="design014_1.html">예정</a></li>
			<li><a href="design014_2.html">진행</a></li>
			<li class="active"><a href="design014_3.html">종료</a></li>
		</ul>

		<table class="table table-striped">
			<thead>
				<tr>
					<th>과목명</th>
					<th>기간</th>
					<th>강사</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Java SE
						<button type="button" class="btn btn-xs" data-toggle="collapse"
							data-target="#demo">과목설명</button>
						<div id="demo" class="collapse">Java입니다</div>
					</td>
					<td>2018.01~2018.02</td>
					<td>john@example.com</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>
```



# Toggleable / Dynamic Tabs

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Jiyoung's Test</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>

	<div class="container">
		<h1>Bootstrap Toggleable / Dynamic Tabs</h1>
		<ul class="nav nav-pills">
			<li class="active"><a data-toggle="pill" href="#schedule1">예정</a></li>
			<li><a data-toggle="pill" href="#schedule2">진행</a></li>
			<li><a data-toggle="pill" href="#schedule3">종료</a></li>
		</ul>

		<div class="tab-content">
			<div id="#schedule1" class="tab-pane fade in active">
				<h3>예정</h3>

				<table class="table table-striped">
					<thead>
						<tr>
							<th>과목명</th>
							<th>기간</th>
							<th>강사</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>JDBC
								<button type="button" class="btn btn-xs" data-toggle="collapse"
									data-target="#demo3">과목설명</button>
								<div id="demo3" class="collapse">JDBC입니다</div>
							</td>
							<td>2018.02~2018.03</td>
							<td>july@example.com</td>
						</tr>
						<tr>
							<td>Project
								<button type="button" class="btn btn-xs" data-toggle="collapse"
									data-target="#demo4">과목설명</button>
								<div id="demo4" class="collapse">Prjoject입니다</div>
							</td>
							<td>2018.03~2018.05</td>
							<td>july@example.com</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="schedule2" class="tab-pane fade">
				<h3>진행</h3>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>과목명</th>
							<th>기간</th>
							<th>강사</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Oracle
								<button type="button" class="btn btn-xs" data-toggle="collapse"
									data-target="#demo2">과목설명</button>
								<div id="demo2" class="collapse">Oracle입니다</div>
							</td>
							<td>2018.02~2018.02</td>
							<td>mary@example.com</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div id="schedule3" class="tab-pane fade">
				<h3>종료</h3>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>과목명</th>
							<th>기간</th>
							<th>강사</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Java SE
								<button type="button" class="btn btn-xs" data-toggle="collapse"
									data-target="#demo">과목설명</button>
								<div id="demo" class="collapse">Java입니다</div>
							</td>
							<td>2018.01~2018.02</td>
							<td>john@example.com</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>
```



# Navigation Bar & Dropdown

```html

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SIST_쌍용교육센터</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script>
	$(document).ready(function() {

		// jQuery methods go here...

	});
</script>
</head>
<body>

	<div class="container">
		<h1>Bootstrap Navigation Bar</h1>

		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">SIST</a>
				</div>
				<ul class="nav navbar-nav">

					<li class="dropdown active"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">기초정보관리<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">과정명관리</a></li>
							<li><a href="#">과목명관리</a></li>
							<li><a href="#">강의실관리</a></li>
							<li><a href="#">교재명관리</a></li>
						</ul></li>

					<li><a href="#">강사관리</a></li>
					<li><a href="#">개설과정관리</a></li>
					<li><a href="#">개설과목관리</a></li>
					<li><a href="#">수강생관리</a></li>
					<li><a href="#">성적조회</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-user"></span>
							홍길동(매니저)</a></li>
					<li><a href="#"><span class="glyphicon glyphicon-log-out"></span>
							Logout</a></li>
				</ul>
			</div>
		</nav>

	</div>

</body>
</html>
```



# Forms

```html

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SIST_쌍용교육센터</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script>
	$(document).ready(function() {

		// jQuery methods go here...

	});
</script>
</head>
<body>

	<div class="container">
		<h1>Bootstrap Forms</h1>

		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<a class="navbar-brand" href="#">SIST</a>
				</div>
				<ul class="nav navbar-nav">

					<li class="dropdown active"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">기초정보관리<span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="#">과정명관리</a></li>
							<li><a href="#">과목명관리</a></li>
							<li><a href="#">강의실관리</a></li>
							<li><a href="#">교재명관리</a></li>
						</ul></li>

					<li><a href="#">강사관리</a></li>
					<li><a href="#">개설과정관리</a></li>
					<li><a href="#">개설과목관리</a></li>
					<li><a href="#">수강생관리</a></li>
					<li><a href="#">성적조회</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-user"></span>
							홍길동(매니저)</a></li>
					<li><a href="#"><span class="glyphicon glyphicon-log-out"></span>
							Logout</a></li>
				</ul>
			</div>
		</nav>

		<ul class="breadcrumb">
			<li>Home</li>
			<li>기초 정보 관리</li>
			<li class="active">과정명 관리</li>
		</ul>
		<div class="panel panel-default">
			<div class="panel-heading">과정 관리 입력</div>
			<div class="panel-body">

				<form>
					<div class="form-group">
						<label for="octitle">과정명:</label> <input type="text"
							class="form-control" id="octitle">
						<span class="help-block">This is some help text...</span>							
					</div>
					<button type="submit" class="btn btn-default">Submit</button>
				</form>

			</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">과정 관리 출력</div>
			<div class="panel-body">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>과정ID</th>
							<th>과정명</th>
							<th>수정/삭제</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>OC001</td>
							<td>자바 전문가</td>
							<td><button type="button" class="btn btn-xs btn-default">update</button>/
								<button type="button" class="btn btn-xs btn-default disabled">delete</button></td>
						</tr>
						<tr>
							<td>OC002</td>
							<td>오라클 전문가</td>
							<td><button type="button" class="btn btn-xs btn-default">update</button>/
								<button type="button" class="btn btn-xs btn-default">delete</button></td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>

	</div>

</body>
</html>
```



# Carousel

```html

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>SIST_쌍용교육센터</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script>
	$(document).ready(function() {

		// jQuery methods go here...

	});
</script>
</head>
<body>

	<div class="container">

		<h1>Bootstrap Carousel Plugin</h1>

		<h3>프로젝트 결과</h3>

		<div id="myCarousel" class="carousel slide" data-ride="carousel">
			<!-- Indicators -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1"></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
			</ol>

			<!-- Wrapper for slides -->
			<div class="carousel-inner">
				<div class="item active">
					<img src="la.jpg" alt="Los Angeles">
				</div>

				<div class="item">
					<img src="chicago.jpg" alt="Chicago">
				</div>

				<div class="item">
					<img src="ny.jpg" alt="New York">
				</div>
			</div>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#myCarousel"
				data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>

	</div>

</body>
</html>


```



# Modal

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Jiyoung's Test</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {

	});
</script>
</head>
<body>

	<div class="container">

		<!-- Trigger the modal with a button -->
		<button type="button" class="btn btn-info btn-lg" data-toggle="modal"
			data-target="#myModal">Open Modal</button>
	</div>
	<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Modal Header</h4>
				</div>
				<div class="modal-body">
					<div class="media">
						<div class="media-left">
							<img src="https://www.w3schools.com/bootstrap/img_avatar1.png" class="media-object"
								style="width: 60px">
						</div>
						<div class="media-body">
							<h4 class="media-heading">홍길동</h4>
							<p>등급: 매니저</p>
							<p>전화: 010-1234-1234</p>
							<p>이메일: hong@naver.com</p>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>


</body>
</html>
```



# Tooltip

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Jiyoung's Test</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script>
	$(document).ready(function() {
		$('[data-toggle="modal"]').tooltip();
	});
</script>

</head>
<body>


	<div class="container">
		<h3>Tooltip Example</h3>
		<a href="#" class="btn btn-default" data-toggle="modal" data-target="#myModal" title=":D">홍길동(매니저)</a>
	</div>
	
		<!-- Modal -->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog modal-lg">

			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">개인 정보</h4>
				</div>
				<div class="modal-body">
					<div class="media">
						<div class="media-left">
							<img src="https://www.w3schools.com/bootstrap/img_avatar1.png" class="media-object"
								style="width: 120px">
						</div>
						<div class="media-body">
							<h4 class="media-heading">홍길동</h4>
							<p>등급: 매니저</p>
							<p>전화: 010-1234-1234</p>
							<p>이메일: hong@naver.com</p>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
				</div>
			</div>

		</div>
	</div>
	



</body>
</html>
```



# Scrollspy

```html
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Jiyoung's Test</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
body {
	position: relative;
}

#section1 {
	padding-top: 50px;
	height: 500px;
	color: #fff;
	background-color: #1E88E5;
}

#section2 {
	padding-top: 50px;
	height: 500px;
	color: #fff;
	background-color: #673ab7;
}

#section3 {
	padding-top: 50px;
	height: 500px;
	color: #fff;
	background-color: #ff9800;
}

#section41 {
	padding-top: 50px;
	height: 500px;
	color: #fff;
	background-color: #00bcd4;
}

#section42 {
	padding-top: 50px;
	height: 500px;
	color: #fff;
	background-color: #009688;
}
</style>

<script>
	$(document).ready(function() {

	});
</script>
</head>
<body data-spy="scroll" data-target=".navbar" data-offset="50">

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">WebSiteName</a>
			</div>
			<div>
				<div class="collapse navbar-collapse" id="myNavbar">
					<ul class="nav navbar-nav">
						<li><a href="#section1">Section 1</a></li>
						<li><a href="#section2">Section 2</a></li>
						<li><a href="#section3">Section 3</a></li>
						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" href="#">Section 4 <span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#section41">Section 4-1</a></li>
								<li><a href="#section42">Section 4-2</a></li>
							</ul></li>
					</ul>
				</div>
			</div>
		</div>
	</nav>

	<div id="section1" class="container-fluid">
		<h1>Section 1</h1>
		<p>Try to scroll this section and look at the navigation bar while
			scrolling! Try to scroll this section and look at the navigation bar
			while scrolling!</p>
		<p>Try to scroll this section and look at the navigation bar while
			scrolling! Try to scroll this section and look at the navigation bar
			while scrolling!</p>
	</div>
	<div id="section2" class="container-fluid">
		<h1>Section 2</h1>
		<p>Try to scroll this section and look at the navigation bar while
			scrolling! Try to scroll this section and look at the navigation bar
			while scrolling!</p>
		<p>Try to scroll this section and look at the navigation bar while
			scrolling! Try to scroll this section and look at the navigation bar
			while scrolling!</p>
	</div>
	<div id="section3" class="container-fluid">
		<h1>Section 3</h1>
		<p>Try to scroll this section and look at the navigation bar while
			scrolling! Try to scroll this section and look at the navigation bar
			while scrolling!</p>
		<p>Try to scroll this section and look at the navigation bar while
			scrolling! Try to scroll this section and look at the navigation bar
			while scrolling!</p>
	</div>
	<div id="section41" class="container-fluid">
		<h1>Section 4 Submenu 1</h1>
		<p>Try to scroll this section and look at the navigation bar while
			scrolling! Try to scroll this section and look at the navigation bar
			while scrolling!</p>
		<p>Try to scroll this section and look at the navigation bar while
			scrolling! Try to scroll this section and look at the navigation bar
			while scrolling!</p>
	</div>
	<div id="section42" class="container-fluid">
		<h1>Section 4 Submenu 2</h1>
		<p>Try to scroll this section and look at the navigation bar while
			scrolling! Try to scroll this section and look at the navigation bar
			while scrolling!</p>
		<p>Try to scroll this section and look at the navigation bar while
			scrolling! Try to scroll this section and look at the navigation bar
			while scrolling!</p>
	</div>

</body>
</html>

```

