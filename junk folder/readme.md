<!-- code for out of stock on product details STARTS -->
<div class="sidebar-widget hot-deals wow fadeInUp">
	<h3 class="section-title">hot deals</h3>
	<div class="owl-carousel sidebar-carousel custom-carousel owl-theme outer-top-xs">
		
								   <?php
$ret=mysqli_query($con,"select * from products order by rand() limit 4 ");
while ($rws=mysqli_fetch_array($ret)) {

?>

								        
													<div class="item">
					<div class="products">
						<div class="hot-deal-wrapper">
							<div class="image">
								<img src="admin/productimages/<?php echo htmlentities($rws['id']);?>/<?php echo htmlentities($rws['productImage1']);?>"  width="200" height="334" alt="">
							</div>
							
						</div>/.hot-deal-wrapper

						<div class="product-info text-left m-t-20">
							<h3 class="name"><a href="product-details.php?pid=<?php echo htmlentities($rws['id']);?>"><?php echo htmlentities($rws['productName']);?></a></h3>
							<div class="rating rateit-small"></div>

							<div class="product-price">	
								<span class="price">
									Rs. <?php echo htmlentities($rws['productPrice']);?>.00
								</span>
									
							    <span class="price-before-discount">Rs.<?php echo htmlentities($row['productPriceBeforeDiscount']);?></span>					
							
							</div><!-- /.product-price -->
							
						</div><!-- /.product-info -->

						<div class="cart clearfix animate-effect">
							<div class="action">
								
								<div class="add-cart-button btn-group">
									<button class="btn btn-primary icon" data-toggle="dropdown" type="button">
								<?php if($row['productAvailability']=='In Stock'){?>
										<button class="btn btn-primary icon" data-toggle="dropdown" type="button">
								<i class="fa fa-shopping-cart"></i>													
							</button>
							<a href="category.php?page=product&action=add&id=<?php echo $row['id']; ?>">
							<button class="btn btn-primary" type="button">Add to cart</button></a>
								<?php } else {?>
							<div class="action" style="color:red">Out of Stock</div>
					<?php } ?>
															
								</div>
								
							</div><!-- /.action -->
						</div><!-- /.cart -->
					</div>	
					</div>		
					<?php } ?>        
						
	    
    </div><!-- /.sidebar-widget -->
</div>
<!-- code for out of stock on product details ENDS -->

