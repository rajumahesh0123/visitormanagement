<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="container">
    <%@include file="common/header.jspf"%>
    <%@include file="common/navigation.jspf"%>
    <h5><a href="/list-buses"> Click For List Of Buses</a></h5>
   

    <div align="center">

        <section class="get-in-touch">
            <h1 class="title">Bus Details</h1>
    <form:form method="post" modelAttribute="bus" cssClass="contact-form row">
	    <div class="form-field col-lg-5">
	        <form:label path="busNumber" cssClass="lable" >Enter Bus Number: </form:label>
	    </div>
	       <div class="form-field col-lg-5">
	        <form:input path="busNumber" required="required" cssClass="input-text js-input" style="width:500px;" ></form:input>
	    </div>

        <div class="form-field col-lg-5">
            <form:label path="source" cssClass="lable">Enter Source:</form:label>
        </div>
        <div class="form-field col-lg-5">
            <form:input path="source" type="text" required="required" cssClass="input-text js-input" style="width:500px;"/>
        </div>

        
       <div class="form-field col-lg-5">
            <form:label path="destination" cssClass="lable">Enter Destination:</form:label>
             </div>
        <div class="form-field col-lg-5">
            <form:input path="destination" type="text" required="required" cssClass="input-text js-input" style="width:500px;"/>
        </div>

		<div class="form-field col-lg-5">
            <form:label path="sourceTime" cssClass="lable">Enter Source Time:</form:label>
             </div>
        <div class="form-field col-lg-5">
            <form:input path="sourceTime" type="datetime-local" required="required" cssClass="input-text js-input" style="width:500px;"/>
        </div>
        
        <div class="form-field col-lg-5">
            <form:label path="destinationTime" cssClass="lable">Enter Destination Time:</form:label>
             </div>
        <div class="form-field col-lg-5">
            <form:input path="destinationTime" type="datetime-local" required="required" cssClass="input-text js-input" style="width:500px;"/>
        </div>
        <div hidden="hidden">
        <div class="form-field col-lg-5">
            <form:label  path="noOfSeats" cssClass="lable">Enter Number of Seats:</form:label>
             </div>
        <div class="form-field col-lg-5">
            <form:input path="noOfSeats" type="text" required="required" cssClass="input-text js-input" style="width:500px;" value="24" disabled="true"/>
        </div>
        </div>
        <div class="form-field col-lg-5">
            <form:label path="fare" cssClass="lable">Enter Fare per seat:</form:label>
             </div>
        <div class="form-field col-lg-5">
            <form:input path="fare" type="text" required="required" cssClass="input-text js-input" style="width:500px;"/>
        </div>
        
        <div class="form-field col-lg-12">
            <input class="submit-btn" type="submit" value="Submit Data">
        </div>

    </form:form>
        </section>


        <%@include file="common/footer.jspf"%>
    </div>
</div>
