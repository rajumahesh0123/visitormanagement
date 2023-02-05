

<div class="container">
<%@ include file="common/header.jspf"%>
<%@ include file="common/user-navigation.jspf"%>

	<br>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3>List of Journeys</h3>
		</div>
		<div class="panel-body">
			<table class="table table-striped">
				<thead>
					<tr>
						<th >Passenger Name</th>
						<th>Mobile Number</th>
						<th>No. Of Tickets</th>
						<th> Bus Number</th>
						<th> Source </th>
						<th> Destination</th>
						
						<th>Source Time</th>
						
						<th>Destination Time</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${JourneyDetails}" var="JourneyDetails">
						<tr>
							<td>${JourneyDetails.passengerName}</td>
							<td>${JourneyDetails.mobileNumber}</td>
							<td>${JourneyDetails.noOfTickets}</td>
							<td>${JourneyDetails.busNumber}</td>
							<td>${JourneyDetails.source}</td>
							<td>${JourneyDetails.destination}</td>
							<td>${JourneyDetails.sourceTime}</td>
							<td>${JourneyDetails.destinationTime}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</div>
<%@ include file="common/footer.jspf"%>