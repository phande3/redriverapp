<!DOCTYPE html>
<%@page language="java" pageEncoding="ISO-8859-1"
	contentType="text/html; charset=ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html lang="en">
<head>
<title><spring:message code="greeting" text="Red River student application"/></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
	<style type="text/css">

* {box-sizing: border-box;}

body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: #e9e9e9;
}

.topnav .search-container {
  float: right;
}

.topnav input[type=text] {
  padding: 6px;
  margin: 8px;
  font-size: 17px;
  border: none;
}

.topnav .search-container button {
  float: right;
  padding: 6px 10px;
  margin-top: 8px;
  margin-right: 16px;
  background: #ddd;
  font-size: 17px;
  border: none;
  cursor: pointer;
}

.topnav .search-container button:hover {
  background: #ccc;
}

@media screen and (max-width: 600px) {
  .topnav .search-container {
    float: none;
  }
  .topnav a, .topnav input[type=text], .topnav .search-container button {
    float: none;
    display: block;
    text-align: left;
    width: 100%;
    margin: 0;
    padding: 14px;
  }
  .topnav input[type=text] {
    border: 1px solid #ccc;  
  }
}

</style>
<script type="text/javascript">
$(document).ready(function() {
	$(document).on("click", ".open-deleteStudentDialog", function () {
	     var studentId = $(this).data('id');
	     $("#studentId").val( studentId );
	    $('#deleteconfirmmodal').modal('show');
 });
 
 $(document).on("click", ".open-editStudentDialog", function () {
	  var studentId = $(this).data('id');
	  if(studentId === undefined ){
		  //reset form
		  $("#editconfirmmodal #firstName" ).val("");
		  $("#editconfirmmodal #lastName" ).val("");
		  $("#editconfirmmodal #dob" ).val("");
		  $("#editconfirmmodal #gender" ).val("");
		  $("#editconfirmmodal #grade" ).val("");
		  
		  $("#editconfirmmodal #email" ).val("");
		  $("#editconfirmmodal #phone" ).val("");
		  $("#editconfirmmodal #address" ).val("");
		  
		  $('#editconfirmmodal').modal('show');
	  } else {
		  $.ajax({
			  type:'GET',
			  url:'/get/'+ studentId,
			  success:function(student){
				  $("#editconfirmmodal #id" ).val(student.id);
				  $("#editconfirmmodal #firstName" ).val(student.firstName);
				  $("#editconfirmmodal #lastName" ).val(student.lastName);
				  $("#editconfirmmodal #dob" ).val(student.dob);
				  $("#editconfirmmodal #gender" ).val(student.gender);
				  $("input[name=gender][value=" + student.gender + "]").prop('checked', true);
				  $("#editconfirmmodal #grade" ).val(student.grade);
				  
				  $("#editconfirmmodal #email" ).val(student.email);
				  $("#editconfirmmodal #address" ).val(student.address);
				  $("#editconfirmmodal #phone" ).val(student.phone);
				  
				  $('#editconfirmmodal').modal('show');
			  }
		  });
	  }
	  
 });
	
});
  </script>
</head>
<body>

	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#"><spring:message code="brand.name" text="Red River"/></a>
			</div>
			<ul class="nav navbar-nav">
				<li class="active"><a href="/"><spring:message code="all.student.text" text="All Students"/></a></li>
<!-- 				<li><button type="button" -->
<!-- 								class="btn btn-info btn-sm open-addStudentDialog" -->
<!-- 								data-toggle="modal"  -->
<!-- 								data-target="#addconfirmmodal">Add</button></li> -->
			</ul>
<!-- 			<ul class="nav navbar-nav navbar-right"> -->
<!-- 				<li><a href="#"><span class="glyphicon glyphicon-user"></span> -->
<!-- 						Sign Up</a></li> -->
<!-- 				<li><a href="#"><span class="glyphicon glyphicon-log-in"></span> -->
<!-- 						Login</a></li> -->
<!-- 			</ul> -->
		</div>
	</nav>

	<div class="container">
	
		<!-- Search form -->
		 
		 <div class="topnav">
		  <div class="search-container">
		    <form action="/" id="searchform" name="searchform">
		      <input type="text" placeholder="Search.." name="searchName"  value="${ searchName }">
		      <button type="submit"><i class="fa fa-search"></i></button>
		    </form>
		 </div>
		</div>
	<div class="row" style="padding:20px">
    <div class="col text-center">
      <button type="button"
								class="btn btn-info btn-sm open-editStudentDialog"
								data-toggle="modal" 
								data-target="#editStudentDialog"><spring:message code="add.student" text="Add Student"/></button>
    </div>
  </div>
<!-- 		<form class="" action="/"> -->
<!-- 			<input class="form-control" type="text" placeholder="Search" -->
<%-- 				aria-label="Search" name="searchName" value="${ searchName }"> --%>
<!-- 		</form> -->

<c:if test="${ not empty servermsg  }">
<div class="alert alert-info" style="padding-top:20px">
  <strong>Info!</strong> ${ servermsg }
</div>
</c:if>
<c:if test="${ not empty servererror  }">
<div class="alert alert-danger" role="alert" style="padding-top:20px">
  <strong>ERROR!!</strong> ${ servererror }
</div>
</c:if>

		<div style="padding-top:20px">
		<table class="table table-hover">
			<thead>
				<tr>
					<th><spring:message code="id" text="Id"/></th>
					<th><spring:message code="firstname" text="Firstname"/></th>
					<th><spring:message code="lastname" text="Lastname"/></th>
					<th><spring:message code="birthdate" text="Birth Date"/></th>
					
					<th><spring:message code="email" text="Email"/></th>
					<th><spring:message code="address" text="Address"/></th>
					<th><spring:message code="phone" text="Phone"/></th>
					
					<th><spring:message code="Gender" text="Gender"/></th>
					<th><spring:message code="Grade" text="Grade applying For"/></th>
					<th><spring:message code="Edit" text="Edit"/></th>
					<th><spring:message code="Delete" text="Delete"/></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="student" items="${pageHolder.content}">
					<tr>
						<td>${student.id}</td>
						<td>${student.firstName}</td>
						<td>${student.lastName}</td>
						<td>${student.dob}</td>
						
						<td>${student.email}</td>
						<td>${student.address}</td>
						<td>${student.phone}</td>
						
						<td>${student.gender}</td>
						<td>${student.grade}</td>
<!-- 					<td><a href="#editconfirmmodal" data-toggle="modal"><div class="glyphicon glyphicon-pencil"></div></a></td>  -->
<!-- 					<td><a href="#deleteconfirmmodal"><div class="glyphicon glyphicon-pencil" data-toggle="modal" data-target="#editconfirmmodal"></div></a></td>  -->
					
						<td><div>
								<button type="button"
									class="btn btn-info btn-sm open-editStudentDialog"
									data-id="${student.id}" data-target="#editconfirmmodal"><spring:message code="Edit" text="Edit"/></button>
							</div></td>
						<td><button type="button"
								class="btn btn-info btn-sm open-deleteStudentDialog"
								data-toggle="modal" data-id="${student.id}"
								data-target="#deleteconfirmmodal"><spring:message code="Delete" text="Delete"/></button></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
		<div>
		<c:if test="${  pageHolder.content .size() != 0 }">
		<ul class="pagination">
		<c:if test="${pageNumber != 0}">
			<li class="page-item"><a class="page-link"
				href="/?pageSize=${pageHolder.pageable.pageSize}&pageNumber=${pageNumber-1}"><spring:message code="Previous" text="Previous"/></a>
			</li>
		</c:if>
		<c:forEach begin="1" end="${pageHolder.totalPages}" var="i">
			<c:choose>
				<c:when test="${pageNumber eq i-1}">
					<li class="page-item active"><a class="page-link"> ${i} <span
							class="sr-only">(current)</span></a></li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link"
						href="/?pageSize=${pageHolder.pageable.pageSize}&pageNumber=${i-1}">${i}</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		<c:if test="${pageNumber+1 lt pageHolder.totalPages}">
			<li class="page-item"><a class="page-link"
				href="/?pageSize=${pageHolder.pageable.pageSize}&pageNumber=${pageNumber+1}"><spring:message code="Next" text="Next"/></a>
			</li>
		</c:if>
	</ul>
	</c:if>
	</div>
		<!-- Modal -->
		<div class="modal fade" id="deleteconfirmmodal" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title"><spring:message code="confirm.delete" text="Please confirm record delete"/></h4>
					</div>
					<div class="modal-body">
						<p><spring:message code="confirm.delete.text" text="Are you sure you want to delete a student record?"/></p>
					</div>
					<form action="/delete" method="post">
						<div class="form-group">
							<input type="hidden" name="studentId" id="studentId" value="" />
							<div class="modal-footer">
								<button type="submit" class="btn btn-warning"><spring:message code="confirm" text="Confirm"/></button>
								<button type="button" class="btn btn-default"
									data-dismiss="modal"><spring:message code="Close" text="Close"/></button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="editconfirmmodal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title collapse navbar-collapse"><spring:message code="title.edit" text="Add/Edit Student Information"/></h4>
				</div>
				<div class="modal-body">

					<form action="/save" method="post">
						<input type="hidden" name="id" id="id" />
						<div class="form-group">
							<label for="firstName"><spring:message code="firstname" text="Firstname"/></label> <input type="text"
							 class="form-control"
								name="firstName" id="firstName" maxlength="20" required>
						</div>
						<div class="form-group">
							<label for="lastName"><spring:message code="lastname"  text="Lastname"/></label> <input type="text"
								class="form-control" name="lastName"
								id="lastName" maxlength="20" required>
						</div>
					
						<div class="form-group">
							<label for="dob"><spring:message code="birthdate" text="Birth Date"/>
							</label> <input type="Date" class="form-control" name="dob" id="dob" required >
						</div>
						
						<div class="form-group">
							<label for="email"><spring:message code="email" text="Email"/>
							</label> <input type="email" class="form-control" name="email" id="email" required >
						</div>
						<div class="form-group">
							<label for="address"><spring:message code="address" text="Address"/>
							</label> <textarea class="form-control" style="resize: none;" maxlength="100" name="address" draggable="false" inputmode="text" rows="3" id="address" required ></textarea>
						</div>
						<div class="form-group">
							<label for="phone"><spring:message code="phone" text="Contact Phone"/>
							</label> <input type="text" class="form-control" maxlength="10"  name="phone" id="phone" required >
						</div>
						
						<div class="form-group">
							<label for="dob"><spring:message code="Gender" text="Gender"/></label>
							<div class="radio">
								<label><input type="radio"  required name="gender" value="Male" checked="checked">Male</label>
							</div>
							<div class="radio">
								<label><input type="radio" required name="gender" value="Female">Female</label>
							</div>
							
						</div>
						<div class="form-group">
							<label for="grade"><spring:message code="Grade" text="Grade"/></label> 
							<select	class="form-control" id="grade" name="grade" required>
								<option value="First Year">First Year</option>
								<option value="Second Year">Second Year</option>
								<option value="Third Year">Third Year</option>
								<option value="Fourth Year">Fourth Year</option>
							</select>
						</div>
						<button type="submit" class="btn btn-primary active"><spring:message code="submit" text="Submit"/></button>
						<button type="button" class="btn btn-primary" data-dismiss="modal"><spring:message code="cancel" text="Cancel"/></button>
					</form>

				</div>

			</div>
		</div>
	</div>
<!-- 		<div class="modal fade" id="addconfirmmodal" data-toggle="validator"> -->
<!-- 		<div class="modal-dialog"> -->
<!-- 			<div class="modal-content"> -->
<!-- 				<div class="modal-header"> -->
<!-- 					<button type="button" class="close" data-dismiss="modal">&times;</button> -->
<!-- 					<h4 class="modal-title">Add Student Information</h4> -->
<!-- 				</div> -->
<!-- 				<div class="modal-body"> -->

<!-- 					<form action="/save" method="post" > -->
<!-- 						<div class="form-group"> -->
<!-- 							<label for="firstName">First Name:</label> <input type="text" -->
<!-- 							 class="form-control" -->
<!-- 								name="firstName" id="firstName" required> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label for="lastName">Last Name:</label> <input type="text" -->
<!-- 								class="form-control" name="lastName" -->
<!-- 								id="lastName" required> -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label for="dob">Birth Date:</label> <input type="Date" -->
<!-- 							 class="form-control" name="dob" id="dob" required > -->
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label for="dob">Gender</label> -->
<!-- 							<div class="radio"> -->
<!-- 								<label><input type="radio" required id="gender" name="gender" value="Male">Male</label> -->
<!-- 							</div> -->
<!-- 							<div class="radio"> -->
<!-- 								<label><input type="radio" required id="gender" name="gender" value="Female">Female</label> -->
<!-- 							</div> -->
							
<!-- 						</div> -->
<!-- 						<div class="form-group"> -->
<!-- 							<label for="grade">Select Grade:</label>  -->
<!-- 							<select	class="form-control" id="grade" name="grade" required> -->
<!-- 								<option value="first">First</option> -->
<!-- 								<option value="second">Second</option> -->
<!-- 								<option value="third">Third</option> -->
<!-- 								<option value="fourth">Fourth</option> -->
<!-- 								<option value="fifth">Fifth</option> -->
<!-- 							</select> -->
<!-- 						</div> -->
<!-- 						<button type="submit" class="btn btn-primary active">Submit</button> -->
<!-- 						<button type="button" class="btn btn-primary" data-dismiss="modal">Cancel</button> -->
<!-- 					</form> -->

<!-- 				</div> -->

<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</div> -->
</body>
</html>
