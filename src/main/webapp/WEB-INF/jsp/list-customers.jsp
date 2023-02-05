

<div class="container">
<%@ include file="common/header.jspf"%>
<%@ include file="common/navigation.jspf"%>
	
	<br>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3>List of Users</h3>
		</div>
		<div class="panel-body">
			<table class="table table-striped">
				<thead>
					<tr>
						<th >Name</th>
						<th>Mobile Number</th>
						<th>Address</th>
						<th>Gender</th>
						<th>DOB</th>
						
						<th>Username</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${customers}" var="customer">
						<tr>
							<td>${customer.name}</td>
							<td>${customer.mobileNumber}</td>
							<td>${customer.address}</td>
							<td>${customer.gender}</td>
							<td>${customer.dateOfBirth}</td>
							
							<td>${customer.username}</td>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</div>
<%@ include file="common/footer.jspf"%>