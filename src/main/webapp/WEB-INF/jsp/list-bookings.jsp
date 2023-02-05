
<script type="text/javascript">
function callAlert(){
	alert("Booking incomplete, You should Select Seats again");
};
</script>

<script type="text/javascript">
function checkdate(sourceDate){
	var today = new Date();
	
	var dd = String(today.getDate()).padStart(2, '0');
	var mm = String(today.getMonth()).padStart(2, '0'); 
	var yyyy = today.getFullYear();
	
	today = new Date(yyyy, mm, dd);
	
	sourceDate = new Date(sourceDate);
	
	if (today>sourceDate){
		alert("Cannot update/delete old dated data");
		return false;
	}
	return true;
}
</script>
<div class="container" >
<%@ include file="common/header.jspf"%>
<%@ include file="common/user-navigation.jspf"%>

	<br>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<c:if test="${bookingStatus==1}">
				<script>callAlert()</script>
			</c:if>
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
						<th> Source</th>
						<th> Destination </th>
						<th> Journey Date </th>
						<th>Booking Status</th>
						
						<th>Seats</th>
						
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${bookingDetails}" var="bookingDetails">
						<tr>
							<td>${bookingDetails.name}</td>
							<td>${bookingDetails.mobileNumber}</td>
							<td>${bookingDetails.noOfTickets}</td>
							<td>${bookingDetails.amount}</td>
							<td>${bookingDetails.source}</td>
							<td>${bookingDetails.destination}</td>
							<td>${bookingDetails.journeyDate}</td>
							<c:if test="${bookingDetails.bookingStatus=='0'}">
								<td>Pending</td>
								<td><a type="button" class="btn btn-success"
								href="/cancel-ticket?id=${bookingDetails.id}">Cancel</a>
							</td>
							</c:if>
							<c:if test="${bookingDetails.bookingStatus=='1'}">
								<td>Cancelled</td>
								<td>Booking Cancelled</td>
							
							</c:if>
							<c:if test="${bookingDetails.bookingStatus=='2'}">
								<td>Paid</td>
								<td>Pending approval</td>
							
							</c:if>
							<c:if test="${bookingDetails.bookingStatus=='3'}">
								<td>Approved</td>
								<c:if test="${empty bookingDetails.seatNums}">
								<td><a type="button" class="btn btn-success"
								href="/seats?id=${bookingDetails.id}"  onclick="return checkdate('${bookingDetails.journeyDate}')">Select Seats</a>
								</td>
								</c:if>
								<c:if test="${not empty bookingDetails.seatNums}">
								<td>Seats ${bookingDetails.seatNums}
								</td>
								</c:if>
								
							</c:if>
							
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</div>
<%@ include file="common/footer.jspf"%>