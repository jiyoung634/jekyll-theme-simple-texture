---
layout: post
title: "File Upload"
description: "(test)File Upload"
categories: [JSP]
tags: [JSP, File Upload]
redirect_from:
  - /2018/03/15/
---



```javascript
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//JSP code
	request.setCharacterEncoding("UTF-8");
	StringBuilder sb = new StringBuilder();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Jiyoung's Test:D</title>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<style>
</style>

<!-- Google Map API -->
<script src="https://maps.googleapis.com/maps/api/js?callback=myMap"></script>

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

		<h3>File Upload:</h3>
		Select a file to upload: <br />
		<form action="uploadFile.jsp" method="post"
			enctype="multipart/form-data">
			<input type="text" name="content" size="50" /><br>
			<input type="file" name="file" size="50" /> <br> 
			<input type="submit" value="Upload File" />
		</form>


	</div>

</body>
</html>
```

```javascript
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*, java.text.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.io.output.*"%>
<%-- '<%!~~~'는 클래스 안에, '<%~~~~~'는 메소드 안에 들어간다. --%>
<%!private String randomFileName() {
		long currentTime = System.currentTimeMillis();
		SimpleDateFormat simDf = new SimpleDateFormat("HHMMmmyyyyssdd");
		Random r = new Random();
		String uniqueFileName = String.format("%04d%s", r.nextInt(1000), simDf.format(new Date(currentTime)));
		return uniqueFileName;
	}%>
<%
	request.setCharacterEncoding("UTF-8");
	File file;
	int maxFileSize = 5000 * 1024;
	int maxMemSize = 5000 * 1024;
	ServletContext context = pageContext.getServletContext();
	String filePath = request.getServletContext().getRealPath("data");
	// Verify the content type
	String contentType = request.getContentType();
	String newFileName = "";

	if ((contentType.indexOf("multipart/form-data") >= 0)) {
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// maximum size that will be stored in memory
		factory.setSizeThreshold(maxMemSize);

		// Location to save data that is larger than maxMemSize. (임시폴더)
		factory.setRepository(new File("c:\\temp"));

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);

		// maximum file size to be uploaded.
		upload.setSizeMax(maxFileSize);

		try {
			// Parse the request to get file items.
			List fileItems = upload.parseRequest(request);

			// Process the uploaded file items
			Iterator i = fileItems.iterator();

			out.println("<html>");
			out.println("<head>");
			out.println("<title>JSP File upload</title>");
			out.println("</head>");
			out.println("<body>");

			while (i.hasNext()) {
				FileItem fi = (FileItem) i.next();
				if (fi.isFormField()) {
					String content = fi.getString("UTF-8");
					out.println("content:" + content + "<br>");
				} else {
					// Get the uploaded file parameters
					String fieldName = fi.getFieldName();
					String fileName = fi.getName();
					System.out.println("old FilePath + FileName:" + fileName);
					boolean isInMemory = fi.isInMemory();
					long sizeInBytes = fi.getSize();

					// Write the file
					/* if( fileName.lastIndexOf("\\") >= 0 ) {
					   file = new File( filePath + "\\" + fileName.substring( fileName.lastIndexOf("\\"))) ;
					} else {
					   file = new File( filePath + "\\" + fileName.substring(fileName.lastIndexOf("\\")+1)) ;
					} */

					// 주의) 물리적 파일이름이 같은 파일인 경우 덮어쓰기가 된다. -> 유니크 파일 이름 생성 -> 확장자는 그대로 유지해야 한다. -> "동적 생성된 파일 이름.확장자"

					if (fileName.lastIndexOf(".") >= 0) {
						String ext = fileName.substring(fileName.lastIndexOf(".")); // 현재 파일의 확장자;
						newFileName = randomFileName() + ext;//동적 생성된 이름 + 기존 확장자;
						file = new File(filePath + "\\" + newFileName);
					} else {
						newFileName = randomFileName();//동적 생성된 이름 + 기존 확장자;
						file = new File(filePath + "\\" + newFileName);
					}
					System.out.println("new FilePath + FileName:" + filePath + "\\" + newFileName);

					fi.write(file); // 서버의 데이터를 물리적으로 기록(저장)
					out.println("Uploaded Filename: " + filePath + "\\" + newFileName + "(" + sizeInBytes
							+ "Bytes)" + "<br>");
				}
			}
			out.println("</body>");
			out.println("</html>");
		} catch (Exception ex) {
			System.out.println(ex);
		}
	} else {
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Servlet upload</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<p>No file uploaded</p>");
		out.println("</body>");
		out.println("</html>");
	}
%>

<img src="data/<%=newFileName%>" alt="<%=newFileName%>">
```

