

<!DOCTYPE html>
<html>
<head>
	<title>Bus Reservation System</title>
  	<!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

	<!--Custom styles-->
	<link rel="stylesheet" type="text/css" href="css/styles.css">
</head>
<body>
<div class="container">
	<div class="d-flex justify-content-center h-100">
		<div class="card" style="width: 80rem;">
			<div class="card-header">
				<h3>Register</h3>
			</div>
			<div class="card-body">
				 <form action="register" method="POST">
				 <div class="row">
			     	<div class="col mb-3 form-field" >
			        <div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-user"></i></span>
						</div>
						<input type="text" class="form-control" id="name" name="name" placeholder="Enter Name" required>
						
					</div>
					
			    	</div>
			        <div class="col mb-3 form-field" >
			        <div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-phone"></i></span>
						</div>
						<input type="text" class="form-control" id="mobileNumber" required name="mobileNumber" placeholder="Enter Mobile Number">
					</div>
			    	</div>
		
		        
				</div>
					
				<div class="row">
			     	
			        <div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-address-book"></i></span>
						</div>
						<textarea class="form-control" id="address" name="address" placeholder="Enter Address" required></textarea>
					</div>
			    </div>
			    <div class="row">
			     	<div class="col mb-3 form-field" >
			        <div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-clock"></i></span>
						</div>
						<input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" placeholder="Select Date Of Birth" required>
					</div>
			    	</div>
					<div class="col mb-3 form-field" >
			        <div class="input-group form-group">
						<div class="input-group-prepend">
							<span class="input-group-text"><i class="fas fa-genderless"></i></span>
						</div>
						<select class="form-control form-select" name="gender" id="gender" required>
	                        <option selected>Select Gender</option>
	                        <option value="1">Male</option>
	                        <option value="2">Female</option>
                        </select>
					</div>
			    	</div>
			    	</div>
					<div class="row">
				     	<div class="col mb-3 form-field" >
				        <div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-user-secret"></i></span>
							</div>
							<input type="text" class="form-control" id="username" name="username" placeholder="Enter Username" required>
							
						</div>
						
				    	</div>
				        <div class="col mb-3 form-field" >
				        <div class="input-group form-group">
							<div class="input-group-prepend">
								<span class="input-group-text"><i class="fas fa-key"></i></span>
							</div>
							<input type="text" class="form-control" id="password" name="password" placeholder="Enter Password" required>
						</div>
				    	</div>
			
			        
					</div>
		        
				
					
					
					
					<div class="form-group">
						<input type="submit" value="Register" class="btn float-right login_btn">
					</div>
				</form>
			</div>
			<div class="card-footer">
				<div class="d-flex justify-content-center links">
					Already Registered?<a href="/">Login</a>
				</div>
				
			</div>
		</div>
	</div>
</div>
</body>
</html>