<?php

    include_once 'config/init.php';
    $voucher = new Vouchers();


    if (!$auth->isLoggedIn()){
        header('Location: login.php');
    }
?>
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
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
            <ul class="nav nav-pills flex-column">
                <li class="nav-item">
                    <a class="nav-link active"  href="index.php">My Vouchers</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="buy.php">Buy Voucher</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="settings.php">Account Setting</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="logout.php">Logout</a>
                </li>
            </ul>
        </div>
        <div class="col-md-9">

            <div class="card">
                <div class="card-body">


                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th scope="col">Reference Number</th>
                                <th scope="col">Code</th>
                                <th scope="col">Voucher Information</th>
                                <th scope="col">Duration</th>
                                <th scope="col">Status</th>
                                <th scope="col">Date Purchased</th>
                            </tr>
                            </thead>
                            <tbody>
                            <?php
                                $purchasedVoucher = $voucher->purchasedVoucher();
                                if (!empty($purchasedVoucher)):
                                foreach ($purchasedVoucher as $res):
                            ?>
                            <tr>
                                <th scope="row"><?= $res['reference_number'] ?></th>
                                <td><?= $res['code'] ?></td>
                                <td><?= $res['voucher_description'] ?></td>
                                <td><?= $res['duration'] ?> hours</td>
                                <td><?= $res['purchase_status'] ?></td>
                                <td><?= $res['date_created'] ?></td>
                            </tr>
                            <?php
                                endforeach;
                                else:
                            ?>
                            <tr>
                              <td colspan="4">You have not purchased any vouchers yet.</td>
                            </tr>
                            <?php endif; ?>
                            </tbody>
                        </table>
                    </div>


                </div>
            </div>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>