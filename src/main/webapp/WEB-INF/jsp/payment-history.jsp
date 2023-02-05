

<div class="container">
<%@ include file="common/header.jspf"%>
<%@ include file="common/navigation.jspf"%>

	<br>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3>List of Bookings</h3>
		</div>
		<div class="panel-body">
			<table class="table table-striped">
				<thead>
					<tr>
						<th >Passenger Name</th>
						<th>Mobile Number</th>
						<th>No. Of Tickets</th>
						<th> Amount</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${bookingDetails}" var="bookingDetails">
						<tr>
							<td>${bookingDetails.name}</td>
							<td>${bookingDetails.mobileNumber}</td>
							<td>${bookingDetails.noOfTickets}</td>
							<td>${bookingDetails.amount}</td>
							
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</div>
<%@ include file="common/footer.jspf"%>