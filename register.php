<?php

include_once 'config/init.php';

if ($auth->isLoggedIn()){
    header('Location: index.php');
}


?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <title>Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>

<body>
<section class="h-100">
    <div class="container h-100">
        <div class="row justify-content-sm-center h-100">
            <div class="col-xxl-4 col-xl-5 col-lg-5 col-md-7 col-sm-9">

                <div class="card my-5 shadow-lg">
                    <div class="card-body p-5">
                        <h1 class="fs-4 card-title fw-bold mb-4">Register</h1>
                        <form id="loginform" enctype="multipart/form-data">
                            <div class="mb-3">
                                <label class="mb-2 text-muted" for="username">Username</label>
                                <input id="username" type="text" class="form-control" name="username" value="" required autofocus>
                            </div>

                            <div class="mb-3">
                                <label class="mb-2 text-muted" for="username">Email Address</label>
                                <input id="email" type="text" class="form-control" name="email" value="" required>
                            </div>

                            <div class="mb-3">
                                    <label class="text-muted" for="password">Password</label>
                                <input id="password" type="password" class="form-control" name="password" required>
                            </div>

                            <div class="mb-3">
                                    <label class="text-muted" for="password">Repeat Password</label>
                                <input id="repeat_password" type="password" class="form-control" name="repeat_password" required>
                            </div>

                            <div class="d-flex align-items-center">
                                <button type="submit" class="btn btn-primary ms-auto">
                                    Register
                                </button>
                            </div>
                        </form>
                    </div>
                    <div class="card-footer py-3 border-0">
                        <div class="text-center">
                            Already have an account? <a href="login.php" class="text-dark">Login</a>
                        </div>
                    </div>
                </div>
                <div class="text-center mt-5 text-muted">
                    Copyright &copy; 2023 &mdash; Your Company
                </div>
            </div>
        </div>
    </div>
</section>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="assets/js/sha512.js"></script>
<script>

        $("#loginform").on('submit', function(e) {
            e.preventDefault();

            var data = {
                username: $("#username").val(),
                password: $("#password").val(),
                repeat_password: $("#repeat_password").val(),
                email: $("#email").val()
            }

            if (data.password.trim() !== data.repeat_password.trim()) {
                alert("Password does not match");
            }

            data.password = CryptoJS.SHA512(data.password).toString();


            $.ajax({
                type: "POST",
                url: "config/Ajax.php",
                data: {
                    action: 'userRegister',
                    username: data.username,
                    password: data.password,
                    email: data.email
                },
                success: function(response){
                    if(response === "true"){
                        window.location.href = 'login.php';
                    } else {
                        alert(response)
                    }
                }

            })

        })

</script>
</body>
</html>