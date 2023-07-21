<?php

include_once 'config/init.php';
$voucher = new Vouchers();


if (!$auth->isLoggedIn()){
    header('Location: login.php');
}


$user = new User();
$u = $user->getUserData();
$page = "settings";
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Account Settings | <?= APP_NAME ?></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

<nav class="navbar navbar-expand-lg bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#"> Rental Wifi</a>
    </div>
</nav>


<div class="container py-5">
    <div class="row">
        <div class="col-md-3">
            <?php

            include_once __DIR__ . '/views/sidebar.php';

            ?>
        </div>
        <div class="col-md-9">

            <div class="card">
                <div class="card-body">
                    <ul class="nav nav-tabs" id="myTab" role="tablist">
                        <li class="nav-item" role="presentation">
                            <button class="nav-link active" id="password-tab" data-bs-toggle="tab" data-bs-target="#password-tab-pane" type="button" role="tab" aria-controls="password-tab-pane" aria-selected="true">Password</button>
                        </li>
                        <li class="nav-item" role="presentation">
                            <button class="nav-link" id="delete_account" data-bs-toggle="modal" data-bs-target="#exampleModal" type="button" role="tab" aria-controls="delete-tab-pane" aria-selected="false">Delete Account</button>
                        </li>
                    </ul>

                    <div class="tab-content" id="myTabContent">
                        <div class="tab-pane show active" id="password-tab-pane" role="tabpanel" aria-labelledby="password-tab" tabindex="0">

                            <div class="container py-3">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label for="oldpassword">Old Password</label>
                                                    <input type="password" id="oldpassword" placeholder="Please enter your old password" name="oldpassword" class="form-control" autofocus required>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label for="newpassword">New Password</label>
                                                    <input type="password" id="newpassword" placeholder="Please enter your new password" name="newpassword" class="form-control" required>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <label for="repeatpassword">Confirm New Password</label>
                                                    <input type="password" id="repeatpassword" placeholder="Please repeat your new password" name="repeatpassword" class="form-control" required>
                                                </div>

                                            </div>
                                        </div>
                                        <div class="mb-3">
                                            <button class="btn btn-primary" name="changepasswordbtn" id="changepasswordbtn">Change Password</button>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Delete your account</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>To continue, please enter your password. <br> Before deleting your account make sure you have saved all the purchased vouchers.</p>

                <div class="mb-3">
                    <label for="delete_account_verify">Confirm your identity</label>
                    <input type="password" id="delete_account_verify" name="password" class="form-control" placeholder="Please enter your password">
                </div>

            </div>
            <div class="modal-footer">
                <button id="delete_account_btn" class="btn btn-danger">Delete my Account</button>
            </div>
        </div>
    </div>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="assets/js/sha512.js"></script>
<script>
    $(document).ready(function() {

        $("#changepasswordbtn").on("click", function(e){
            e.preventDefault();

            var data = {
                oldpassword: $("#oldpassword").val(),
                newpassword: $("#newpassword").val(),
                repeatpassword: $("#repeatpassword").val()
            }

            if (data.oldpassword.trim() === "") {
                alert("Please enter your old password")
                return false;
            }

            if (data.newpassword.trim() !== data.repeatpassword.trim()){
                alert("Password does not match");
                return false;
            }

            data.oldpassword = CryptoJS.SHA512(data.oldpassword).toString();
            data.repeatpassword = CryptoJS.SHA512(data.repeatpassword).toString();

            $.ajax({
                type: "POST",
                url: 'config/Ajax.php',
                data: {
                    action: "changePassword",
                    oldpassword: data.oldpassword,
                    newpassword: data.repeatpassword
                },
                success: function(res) {
                    if (res){
                        alert("Password changed successfully");
                    } else{
                        alert(res)
                    }
                }
            })




        })

        $("#delete_account_btn").on("click", function(){

            var password = $("#delete_account_verify").val();
            password = CryptoJS.SHA512(password).toString();

            if(confirm("Are you sure you want to delete this account")){

                $.ajax({
                    type: "POST",
                    url: "config/Ajax.php",
                    data: {
                        action: "deleteAccount",
                        password: password
                    },
                    success: function(res){
                        if(res === "true"){
                            window.location.href = "login.php?del=true";
                        } else {
                            alert(res)
                        }
                    }
                })
            }





        })


    });
</script>
</body>
</html>