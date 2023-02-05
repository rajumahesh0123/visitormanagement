
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
<div class="container">
<%@ include file="common/header.jspf"%>
<%@ include file="common/navigation.jspf"%>
	<div>
		<a type="button" class="btn btn-primary btn-md" href="add-bus">Add Bus</a>
	</div>
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
							<c:if test=""></c:if>
							<td><a type="button" class="btn btn-success"
								href="/update-bus?id=${bus.id}" onclick="return checkdate('${bus.sourceTime}')">Update</a>
							<a type="button" class="btn btn-warning"
								href="/delete-bus?id=${bus.id}" onclick="return checkdate('${bus.sourceTime}')">Delete</a>
							
								</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

</div>
<%@ include file="common/footer.jspf"%>