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
.mainContainer {
	display: flex;
	align-items: center;
	justify-content: center;
	flex-direction: column;
}
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 50%;
  margin-bottom: 2rem;
}

td, th {
  border: 1px solid #000;
  text-align: left;
  padding: 8px;

}

td:last-child {
  display:flex;
  align-items: center;
  justify-content: space-around;
}

button {
	cursor: pointer;
}

tr:nth-child(even) {
  background-color: #dddddd;
}

.dash_btns {
	display: flex;
	align-items: center;
	justify-content: space-between;
	width: 15%;
}
.addBtn {
	background-color: #4cd137;
	color: #fff;
	border: none;
	padding: 10px 15px;
	font-size: 15px;
}
.logoutBtn {
	background-color: #f1c40f;
	border: none;
	padding: 10px 15px;
	font-size: 15px;
}
.editBtn {
	background-color: #00a8ff;
	color: #fff;
	border: none;
	padding: 5px;
}
.deleteBtn {
	background-color: red;
	color: #fff;
	border: none;
	padding: 5px;
}
.joinBtn {
	background-color: #1abc9c;
	color: #fff;
	border: none;
	padding: 5px;
}
.leaveBtn {
	background-color: #d63031;
	color: #fff;
	border: none;
	padding: 5px;
}
</style>
<title>Project Manager Dashboard</title>
</head>
<body>

<div class="mainContainer">

<h1>Project Manager Dashboard</h1>
<h2>Welcome, ${user.firstName}!</h2>
<div class="dash_btns">
	<a href="/projects/new"><button class="addBtn">Add Project</button></a>
	<a href="/logout"><button class="logoutBtn">Log Out</button></a>
</div>

<!--
<h4>All Projects</h4>
<table>
    <thead> 
    	<tr>
    		<th>Project</th>
    		<th>Team Lead</th>
    		<th>Due Date</th>
    		<th>Actions</th>
    	</tr>
    </thead>
    <tbody>
    	<c:forEach var="project" items="${unassignedProjects}">
		<tr>
			<c:if test = "${project.lead.id!=user.id}">
			<td><a href="/projects/${project.id}">${project.title}</a></td>
			<td><c:out value="${project.lead.firstName}"></c:out></td>
			<td><fmt:formatDate value="${project.dueDate}" pattern="MMMM dd"/></td>
		    <td><a href="/dashboard/join/${project.id}">Join Team</a></td>
		    </c:if>
		</tr>	
		</c:forEach>
    </tbody>
</table>
-->

<h2>Projects:</h2>
<table>
    <thead> 
    	<tr>
    		<th>Project</th>
    		<th>Team Lead</th>
    		<th>Due Date</th>
    		<th>Actions</th>
    	</tr>
    </thead>
    <tbody>
    	<c:forEach var="project" items="${assignedProjects}">
		<tr>
			<td><a href="/projects/${project.id}">${project.title}</a></td>
			<td><c:out value="${project.lead.firstName}"></c:out></td>
			<td><fmt:formatDate value="${project.dueDate}" pattern="MMMM dd"/></td>
			<c:if test = "${project.lead.id==user.id}">
		       <td>
		       	<a href="/projects/edit/${project.id}"><button class="editBtn">Edit Project</button></a> 
		       	<a href="/projects/delete/${project.id}"><button class="deleteBtn">Delete Project</button></a>
		       </td>
		    </c:if>
		    <c:if test = "${project.lead.id!=user.id}">
		       <td><a href="/dashboard/leave/${project.id}"><button class="leaveBtn">Leave Team</button></a></td>
		    </c:if>
		</tr>	
	</c:forEach>
	<c:forEach var="project" items="${unassignedProjects}">
		<tr>
			<c:if test = "${project.lead.id!=user.id}">
			<td><a href="/projects/${project.id}">${project.title}</a></td>
			<td><c:out value="${project.lead.firstName}"></c:out></td>
			<td><fmt:formatDate value="${project.dueDate}" pattern="MMMM dd"/></td>
		    <td><a href="/dashboard/join/${project.id}"><button class="joinBtn">Join Team</button></a></td>
		    </c:if>
		</tr>	
		</c:forEach>
    </tbody>
</table>

</div>
</body>
</html>