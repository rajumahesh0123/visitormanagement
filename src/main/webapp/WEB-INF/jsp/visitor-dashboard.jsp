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
<div class="vh-100">
    <div class="wrapper ">
   
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <div class="mt-5 mb-3 clearfix">
                        <h2 class="pull-left">Visitor Details</h2>
                    </div>
			  <table class="table table-bordered table-striped">
                    <thead>
					<tr>
						<th >Name</th>
						<th>Mobile Number</th>
						<th>Address</th>
						<th>ID Number</th>
						<th>Date of visit</th>
						<th>Status</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${visitors}" var="visitor">
						<tr>
							<td>${visitor.name}</td>
							<td>${visitor.mobilenumber}</td>
							<td>${visitor.address}</td>
							<td>${visitor.idNumber}</td>
							<td>${visitor.dateOfVisit}</td>
							<td>
							
							<c:if test="${visitor.approvedStatus=='0'}">
							 Pending Approval
							
							</c:if>
							<c:if test="${visitor.approvedStatus=='1'}">
							Approved
							</c:if>
							</td>
							<td>
							<c:if test="${visitor.approvedStatus=='0'}">
							<a type="button" class="btn btn-success"
								href="/update-visitor?id=${visitor.id}">Update</a>
							<a type="button" class="btn btn-warning"
								href="/delete-visitor?id=${visitor.id}">Delete</a>
							</c:if>
							<c:if test="${visitor.approvedStatus=='1'}">
							Cannot modify after approval
							</c:if>
							</td>
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
    
    </body>

</html>
