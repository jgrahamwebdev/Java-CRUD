<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<style>
.deleteBtn {
	background-color: red;
	color: #fff;
	border: none;
	padding: 5px;
	margin-top: 2rem;
	cursor: pointer;
}
.backBtn {
	background-color: #00a8ff;
	color: #fff;
	border: none;
	padding: 5px;
	margin-top: 2rem;
	margin-right: 1rem;
	cursor: pointer;
}
</style>
<title>Project Details</title>
</head>
<body>

<h1>Project Details</h1>
<table>
    <tbody>
    	<tr>
            <td>Project: <c:out value="${project.title}"></c:out></td>
        </tr>
        
        <tr>
            <td>Description: <c:out value="${project.description}"></c:out></td>
        </tr>
        
        <tr>
            <td>Due Date: <fmt:formatDate value="${project.dueDate}" pattern="MMMM dd"/></td>
        </tr>
        
        <tr>
        	<td>Name: <c:out value="${project.lead.firstName}"></c:out></td>
        </tr>
    </tbody>
</table>

<a href="/dashboard"><button class="backBtn">Back to Dashboard</button></a>
<c:if test = "${project.lead.id==userId}">
   <a href="/projects/delete/${project.id}"><button class="deleteBtn">Delete Project</button></a>
</c:if>
</body>
</html>