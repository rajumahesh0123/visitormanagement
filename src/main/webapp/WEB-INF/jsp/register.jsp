<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<head>
<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">


<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>

<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>


<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="https://unpkg.com/gijgo@1.9.13/js/gijgo.min.js" type="text/javascript"></script>
<link href="https://unpkg.com/gijgo@1.9.13/css/gijgo.min.css" rel="stylesheet" type="text/css" />


</head>
<body>
 <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <a class="navbar-brand" href="#">Visitor Management System</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
    <ul class="navbar-nav ml-auto" >
      <li class="nav-item active">
        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
      </li>
      
        <a class="nav-link" href="/">Logout <span class="sr-only">(current)</span></a>
      </li>
      
    </ul>
  </div>
</nav>
<div class="container">
   

      <div class="vh-100 d-flex justify-content-center align-items-center" style="padding-top:30px;">
      <div class=" p-5 shadow-sm border rounded-5 border-primary bg-white">
          <h2 class="text-center mb-4 text-primary">Visitor Registration Form</h2>
	    <form:form method="post" modelAttribute="register" cssClass="contact-form ">
		     <div class="row">
			     <div class="col mb-3 form-field" >
			        <form:label path="name" cssClass="lable">Visitor Name: </form:label>
			    </div>
			        <div class="col mb-3 form-field" >
			        <form:input path="name" required="required" cssClass="input-text js-input"></form:input>
			    </div>
		
		         <div class="col mb-3 form-field" >
		            <form:label path="mobilenumber" cssClass="lable">Mobile Number:</form:label>
		        </div>
		         <div class="col mb-3 form-field" >
		            <form:input path="mobilenumber" type="text" required="required" cssClass="input-text js-input"/>
		        </div>
			</div>
			<br/>
	        <div class="row">
			     <div class="col mb-3 form-field" >
			        <form:label path="address" cssClass="lable">Address: </form:label>
			    </div>
			    </div>
			      <div class="row">
			    <div class="col mb-3 form-field" >
			        <form:textarea path="address" required="required" cssClass="input-text js-input" style="width:700px;"/>
			    </div>
			</div>
			
			<div class="row">
			     <div class="col mb-3 form-field" >
			        <form:label path="idNumber" cssClass="lable">ID Number: </form:label>
			    </div>
			        <div class="col mb-3 form-field" >
			        <form:input path="idNumber" required="required" cssClass="input-text js-input"></form:input>
			    </div>
		
		         <div class="col mb-3 form-field" >
		            <form:label path="dateOfVisit" cssClass="lable">Date of visit:</form:label>
		        </div>
		         <div class="col mb-3 form-field" >
		            <form:input path="dateOfVisit" type="date" required="required" cssClass="input-text js-input"/>
		        </div>
			</div>
			
			
	        
	        <div class="form-field col-lg-12">
	            <input class="submit-btn btn-success" type="submit" value="Add Visitor">
	        </div> 
	
	    </form:form>
        

    </div>
</div>
</div>