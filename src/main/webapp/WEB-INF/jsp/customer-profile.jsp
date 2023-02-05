<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div class="container">
    <%@include file="common/header.jspf"%>
    <%@include file="common/user-navigation.jspf"%>
   
    <div align="center">

        <section class="get-in-touch">
            <h1 class="title">Edit Profile</h1>
            
    <form:form method="post" modelAttribute="customer" cssClass="contact-form row">
	    <div class="form-field col-lg-5">
	        <form:label path="name" cssClass="lable" >Name: </form:label>
	    </div>
	       <div class="form-field col-lg-5">
	        <form:input path="name" required="required" cssClass="input-text js-input" style="width:500px;" ></form:input>
	    </div>

        <div class="form-field col-lg-5">
            <form:label path="mobileNumber" cssClass="lable">Mobile Number:</form:label>
        </div>
        <div class="form-field col-lg-5">
            <form:input path="mobileNumber" required="required" cssClass="input-text js-input" style="width:500px;"/>
        </div>

        
       <div class="form-field col-lg-5">
            <form:label path="address" cssClass="lable">Address:</form:label>
             </div>
        <div class="form-field col-lg-5">
            <form:input path="address" type="text" required="required" cssClass="input-text js-input" style="width:500px;"/>
        </div>

		<div class="form-field col-lg-5">
            <form:label path="dateOfBirth" cssClass="lable">Date Of Birth:</form:label>
             </div>
        <div class="form-field col-lg-5">
            <form:input path="dateOfBirth" type="date" required="required"  style="width:500px;"/>
        </div>
        
        
        <div class="form-field col-lg-12">
            <input class="submit-btn" type="submit" value="Edit Profile">
        </div>

    </form:form>
        </section>


        <%@include file="common/footer.jspf"%>
    </div>
</div>
