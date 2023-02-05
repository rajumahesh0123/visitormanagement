<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="container">
    <%@include file="common/header.jspf"%>
    <%@include file="common/user-navigation.jspf"%>
    
   

    <div align="center">

        <section class="get-in-touch">
            <h1 class="title">Book Tickets Here</h1>
    <form:form method="post" modelAttribute="bookingDetails" cssClass="contact-form row">
	    <div class="form-field col-lg-5">
		        <form:label path="custID" cssClass="lable" >Customer ID </form:label>
		    </div>
		       <div class="form-field col-lg-5">
		        <form:input path="custID" required="required" cssClass="input-text js-input" style="width:500px;" readonly="true"></form:input>
		    </div>
	    <div class="form-field col-lg-5">
	        <form:label path="busNumber" cssClass="lable" >Bus Number, Available seats: </form:label>
	    </div>
	       <div class="form-field col-lg-5">
	        <form:input path="busNumber" required="required" cssClass="input-text js-input" style="width:500px;" readonly="true"></form:input>
	    </div>
        
        
        
        <div class="form-field col-lg-5">
            <form:label path="name" cssClass="lable">Name of any Passenger:</form:label>
             </div>
        <div class="form-field col-lg-5">
            <form:input path="name" type="text" required="required" cssClass="input-text js-input" style="width:500px;"/>
        </div>
        
        <div class="form-field col-lg-5">
            <form:label path="mobileNumber" cssClass="lable">Mobile Number:</form:label>
             </div>
        <div class="form-field col-lg-5">
            <form:input path="mobileNumber" type="text" required="required" cssClass="input-text js-input" style="width:500px;"/>
        </div>
        <div class="form-field col-lg-5">
            <form:label path="noOfTickets" cssClass="lable">No Of Tickets:</form:label>
             </div>
        <div class="form-field col-lg-5">
            <form:input path="noOfTickets" type="text" required="required" cssClass="input-text js-input" style="width:500px;"/>
        </div>
        
        
        <div class="form-field col-lg-12">
            <input class="submit-btn" type="submit" value="Book Tickets">
        </div>

    </form:form>
        </section>


        <%@include file="common/footer.jspf"%>
    </div>
</div>
