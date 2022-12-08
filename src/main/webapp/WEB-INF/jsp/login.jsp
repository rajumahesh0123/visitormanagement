<!DOCTYPE html>   

<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Visitor Management System</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
            integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
        
    </head>

    <body >
        <div class="vh-100 d-flex justify-content-center align-items-center ">
            <div class="col-md-5 p-5 shadow-sm border rounded-5 border-primary bg-white">
                <h2 class="text-center mb-4 text-primary">Login Form</h2>
                <form action="login" method="POST">
			 		<c:if test="${not empty error}">
			 			<div style="color:red;">
			 				<h3>${error}</h3>
			 			</div>
			 		</c:if>
			 		<c:if test="${not empty register}">
			 			<div style="color:yellow;">
			 				<h3>${register}</h3>
			 			</div>
			 		</c:if>
			 		<div style="color:green;">
			 				<h9>Username is mobilenumber and password is ID number in case of visitor</h9>
			 			</div>
			 		
                    <div class="mb-3">
                        <label for="username" class="form-label">Username</label>
                        <input type="text" class="form-control border border-primary" id="username" name="username" placeholder="Enter Registered Username" required>
                    </div>
                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <input type="password" class="form-control border border-primary" id="password" name="password" placeholder="Enter Password" required>
                    </div>
                    <div class="mb-3">
                    <label for="role" class="form-label">Select Role</label>
                        <select class="form-select" name="role" id="role" required>
                        <option selected>Select Role</option>
                        <option value="1">Visitor</option>
                        <option value="2">Gate</option>
                        <option value="3">Admin</option>
                        </select>
                    </div>
                    
                    <div class="d-grid">
                        <button class="btn btn-primary" type="submit">Login</button>
                    </div>
                </form>
                <div class="mt-3">
                    <p class="mb-0  text-center">New Visitor? <a href="/register"
                            class="text-primary fw-bold">Sign
                            Up</a></p>
                   
                </div>
            </div>
        </div>
    </body>

</html>
