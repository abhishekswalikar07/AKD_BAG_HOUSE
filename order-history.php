<?php 
session_start();
error_reporting(0);
include('includes/config.php');
if(strlen($_SESSION['login'])==0)
{   
    header('location:login.php');
} else {

    if(isset($_GET['del']) && isset($_GET['id'])) {
        $orderId = intval($_GET['id']);
        $userId = intval($_SESSION['id']);

        // First delete from ordertrackhistory
        $deleteTrack = mysqli_query($con, "DELETE FROM ordertrackhistory WHERE orderId = '$orderId'");

        // Then delete from orders
        if ($deleteTrack) {
            $deleteOrder = mysqli_query($con, "DELETE FROM orders 
                WHERE id = '$orderId' 
                AND userId = '$userId' 
                AND paymentMethod IS NOT NULL");

            if ($deleteOrder) {
                echo "<script>alert('Order deleted successfully.');</script>";
                echo "<script>window.location.href='order-history.php';</script>";
            } else {
                echo "<script>alert('Failed to delete the order from orders table.');</script>";
            }
        } else {
            echo "<script>alert('Failed to delete from ordertrackhistory.');</script>";
        }
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta name="keywords" content="MediaCenter, Template, eCommerce">
    <meta name="robots" content="all">
    <title>Order History</title>
    <link rel="stylesheet" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/css/main.css">
    <link rel="stylesheet" href="assets/css/green.css">
    <link rel="stylesheet" href="assets/css/owl.carousel.css">
    <link rel="stylesheet" href="assets/css/owl.transitions.css">
    <link href="assets/css/lightbox.css" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/animate.min.css">
    <link rel="stylesheet" href="assets/css/rateit.css">
    <link rel="stylesheet" href="assets/css/bootstrap-select.min.css">
    <link rel="stylesheet" href="assets/css/font-awesome.min.css">
    <link href='http://fonts.googleapis.com/css?family=Roboto:300,400,500,700' rel='stylesheet' type='text/css'>
    <link rel="shortcut icon" href="assets/images/favicon.ico">
  <script language="javascript" type="text/javascript">
var popUpWin=0;
function popUpWindow(URLStr, left, top, width, height)
{
 if(popUpWin)
{
if(!popUpWin.closed) popUpWin.close();
}
popUpWin = open(URLStr,'popUpWin', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=no,copyhistory=yes,width='+600+',height='+600+',left='+left+', top='+top+',screenX='+left+',screenY='+top+'');
}

</script>

</head>
<body class="cnt-home">
<header class="header-style-1">
<?php include('includes/top-header.php');?>
<?php include('includes/main-header.php');?>
<?php include('includes/menu-bar.php');?>
</header>

<div class="breadcrumb">
    <div class="container">
        <div class="breadcrumb-inner">
            <ul class="list-inline list-unstyled">
                <li><a href="#">Home</a></li>
                <li class='active'>Order History</li>
            </ul>
        </div>
    </div>
</div>

<div class="body-content outer-top-xs">
    <div class="container">
        <div class="row inner-bottom-sm">
            <div class="shopping-cart">
                <div class="col-md-12 col-sm-12 shopping-cart-table">
                    <div class="table-responsive">
                        <form name="cart" method="post">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>#</th>
                                        <th>Image</th>
                                        <th>Product Name</th>
                                        <th>Quantity</th>
                                        <th>Price Per Unit</th>
                                        <th>Grand Total</th>
                                        <th>Payment Method</th>
                                        <th>Order Date</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
<?php 
$query = mysqli_query($con,"SELECT products.productImage1 as pimg1, products.productName as pname, products.id as proid, orders.productId as opid, orders.quantity as qty, products.productPrice as pprice, orders.paymentMethod as paym, orders.orderDate as odate, orders.id as orderid FROM orders JOIN products ON orders.productId=products.id WHERE orders.userId='".$_SESSION['id']."' AND orders.paymentMethod IS NOT NULL ORDER BY orders.orderDate DESC");
$cnt = 1;
while($row = mysqli_fetch_array($query)) {
?>
<tr>
    <td><?php echo $cnt;?></td>
    <td><img src="admin/productimages/<?php echo $row['proid'];?>/<?php echo $row['pimg1'];?>" alt="" width="84" height="146"></td>
    <td><a href="product-details.php?pid=<?php echo $row['opid'];?>"><?php echo $row['pname'];?></a></td>
    <td><?php echo $qty = $row['qty']; ?></td>
    <td><?php echo $price = $row['pprice']; ?></td>
    <td><?php echo $qty * $price; ?></td>
    <td><?php echo $row['paym']; ?></td>
    <td><?php echo $row['odate']; ?></td>
    <td>
        <a href="javascript:void(0);" onClick="popUpWindow('track-order.php?oid=<?php echo htmlentities($row['orderid']);?>');">Track</a>
        | 
        <a href="order-history.php?del=delete&id=<?php echo $row['orderid']; ?>" onClick="return confirm('Are you sure you want to delete this order?')">Delete</a>
    </td>
</tr>
<?php $cnt++; } ?>
                                </tbody>
                            </table>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<?php include('includes/footer.php'); ?>

<script src="assets/js/jquery-1.11.1.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/bootstrap-hover-dropdown.min.js"></script>
<script src="assets/js/owl.carousel.min.js"></script>
<script src="assets/js/echo.min.js"></script>
<script src="assets/js/jquery.easing-1.3.min.js"></script>
<script src="assets/js/bootstrap-slider.min.js"></script>
<script src="assets/js/jquery.rateit.min.js"></script>
<script src="assets/js/lightbox.min.js"></script>
<script src="assets/js/bootstrap-select.min.js"></script>
<script src="assets/js/wow.min.js"></script>
<script src="assets/js/scripts.js"></script>

<?php } ?>
