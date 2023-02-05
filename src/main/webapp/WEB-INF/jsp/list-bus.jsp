

<div class="container">
<%@ include file="common/header.jspf"%>
<%@ include file="common/user-navigation.jspf"%>

	<br>
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h3>List of Buses</h3>
		</div>
		<div class="panel-body">
			<table class="table table-striped">
				<thead>
					<tr>
						<th >Bus Number</th>
						<th>Source</th>
						<th>Destination</th>
						<th> Source Time</th>
						<th> Destination Time</th>
						<th> No. Of Seats</th>
						<th>Fare/seat</th>
						<th>Available Seats</th>
						
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${buses}" var="bus">
						<tr>
							<td>${bus.busNumber}</td>
							<td>${bus.source}</td>
							<td>${bus.destination}</td>
							<td>${bus.sourceTime}</td>
							<td>${bus.destinationTime}</td>
							<td>${bus.noOfSeats}</td>
							<td>${bus.fare}</td>
							<td>${bus.availableSeats}</td>
							<c:forEach items="${customers}" var="customers">
							<td><a type="button" class="btn btn-success"
								href="/book-ticket?id=${bus.id}&custId=${customers.id}">Book</a>
							
								</td>
								</c:forEach>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</div>
<%@ include file="common/footer.jspf"%>