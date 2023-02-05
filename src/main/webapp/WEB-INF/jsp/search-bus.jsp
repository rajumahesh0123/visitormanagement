 <%@include file="common/header.jspf"%>
    <%@include file="common/user-navigation.jspf"%>
    
<div class="container" align="center" style="padding-top: 30px;">


    <div class="container">
	<div class="d-flex justify-content-center">
		<div class="card">
			<div class="card-header">
			<c:forEach items="${customers}" var="customers">
				<h3>Search Bus, ${customers.name}</h3>
				</c:forEach>
			</div>
			<div class="card-body">
				 <form action="search" method="POST">
					<c:forEach items="${customers}" var="customers">
					<input type="hidden" id="custId" name="custId" value="${customers.id}"/>
					</c:forEach>
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-bus"></i></span>
						</div>
						<input list="sourceList" name="source" id="source" placeholder="Select Source">
                        <datalist  id="sourceList" >
                        
                       <c:forEach items="${source}" var="source">
                       		<option value="${source}">${source}</option>
                       </c:forEach>
                        </datalist>
                     </div>
                      <div class="input-group form-group">  
                        <div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-bus"></i></span>
						</div>
						<input list="destinationList" name="destination" id="destination"  placeholder="Select Destination">
                        <datalist  id="destinationList">
                        
                       <c:forEach items="${destination}" var="destination">
                       		<option value="${destination}">${destination}</option>
                       </c:forEach>
                        </datalist>
					</div>
					
					<div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-bus"></i></span>
						</div>
						<input type="date" name="journeyDate" id="journeyDate"/>
                     </div>
					
					<div class="form-group">
						<input type="submit" value="Search" class="btn float-right login_btn">
					</div>
				</form>
			</div>
			<div class="card-footer">
				
			</div>
		</div>
	</div>
</div>

<script type="text/javascript">

$(function(){
	var today = new Date().toISOString().split('T')[0];
	document.getElementsByName("journeyDate")[0].setAttribute('min', today);
});
</script>


</div>
    <%@include file="common/footer.jspf"%>
    