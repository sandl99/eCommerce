
<head>
<style>
label {
	font-family: QuickSandBook;
	font-size: .5cm;
}

input {
	font-family: "QuicksandBook", Arial, sans-serif;
	font-style: bold;
	font-size: .42cm;
	/* width: 100%; */
}
</style>

<!-- JS Files -->
<script src="js/jquery.min.js"></script>
<script src="js/custom.js"></script>
<script src="js/slides/slides.min.jquery.js"></script>
<script src="js/cycle-slider/cycle.js"></script>
<script src="js/nivo-slider/jquery.nivo.slider.js"></script>
<script src="js/tabify/jquery.tabify.js"></script>
<script src="js/prettyPhoto/jquery.prettyPhoto.js"></script>
<script src="js/twitter/jquery.tweet.js"></script>
<script src="js/scrolltop/scrolltopcontrol.js"></script>
<script src="js/portfolio/filterable.js"></script>
<script src="js/modernizr/modernizr-2.0.3.js"></script>
<script src="js/easing/jquery.easing.1.3.js"></script>
<script src="js/kwicks/jquery.kwicks-1.5.1.pack.js"></script>
<script src="js/swfobject/swfobject.js"></script>
<!-- FancyBox -->
<link rel="stylesheet" type="text/css" href="js/fancybox/jquery.fancybox.css" media="all">
<link rel="stylesheet" type="text/css" media="screen" href="css/column-layout.css">
<script src="js/fancybox/jquery.fancybox-1.2.1.js"></script>
</head>



<div id="container">
  <h1>User Profile</h1>
  <div style="width:25%; float:left; position:relative; padding: 0px 0px;/*  border:1px solid black */">
    <img src= "avatar/Luffys-flag-icon.png" style="max-width:100%;height:auto; /* border:1px solid black; */">
  </div>
  <div style="width:70%; float:right; position:relative; padding: 0px 0px;/* border:1px solid black; */">
  <!-- <div class="one-half-last"> -->
    <ul id="tabify_menu" class="menu_tab" style="margin: 0; font-family: QuickSandBook; font-size: 15px">
      <li class="active"><a href="#fane1">Profile</a></li>
      <li><a href="#fane2">Order lists</a></li>
	  <li><a href="#fane4">Address Book</a></li>
    </ul>
    <div id="fane1" class="tab_content">
			<fieldset>
				<label>Name <span class="required">*</span></label> <input
					type="text" name="name" id="myName" value="${customer.name}"  readonly
					class="text requiredField" style="width: 50%; color:#FF0000">
			</fieldset>
			<fieldset>
				<label>User Name <span class="required">*</span></label> <input
					type="text" name="username" id="myName" value="${customer.getUsername()}" readonly 
					class="text requiredField" style="width: 50%; color:#FF0000">
			</fieldset>
			<fieldset>
				<label>Email <span class="required">*</span></label> <input
					type="text" name="email" id="myEmail"
					value="${customer.getEmail() }" class="text requiredField email" color:#FF0000" readonly
					style="width: 50%">
			</fieldset>
			<fieldset>
				<label>Phone Number <span class="required">*</span></label> <input
					type="text" name="phone" id="myPhone" value="${customer.getPhone() }"  readonly
					class="text requiredField subject" style="width: 50%; color:#FF0000">
			</fieldset>
			<fieldset>
				<label>Address <span class="required">*</span></label> <input
					type="text" name="address" id="myAddress" value="${customer.getAddress()}"
					class="text requiredField subject" style="width: 50%; color:#FF0000">
			</fieldset>
			<fieldset>
				<label>City Region <span class="required">*</span></label> <input
					type="text" name="cityregion" id="myAddress" value="${ customer.getCityRegion() }" readonly
					class="text requiredField subject" style="width: 50%; color:#FF0000">
			</fieldset>
			<fieldset>
				<label>Credit Card Number <span class="required">*</span></label> <input
					type="text" name="ccNumber" id="myccNumber" value="${customer.getCcNumber() }" readonly
					class="text requiredField subject" style="width: 50%; color:#FF0000"> 
			</fieldset>
			
			<fieldset>
				<label>Your Message <span class="required">*</span></label>
				<textarea name="message" id="myMessage" rows="20" cols="30"
					class="text requiredField" style="width: 100%"></textarea>
			</fieldset>

	</div>
	<div id="fane2" class="tab_content">
		<!-- Code here -->
		<table border="0" style="font-size:13px">
			<th>Confirm Number</th>
			<th>Customer</th>
			<th>Date</th>
			<th>Status</th>
			<c:forEach var="customerOrder" items="${customerOrderList }">
				<tr>
				<td><a href="<c:url value='orderDetail?${customerOrder.orderId}'/>">${customerOrder.getConfirmationNumber() }</a></td>
				<td>${customer.getName()}</td>
				<td>${customerOrder.getDateCreated()}</td>
				<c:if test="${customerOrder.status > 0}"><td>Delivered</td></c:if>
				<c:if test="${customerOrder.status < 1}"><td>Waiting to Delivery</td></c:if>
			</tr>
			</c:forEach>
			
		</table>
	</div>
	<div id="fane4" class="tab_content">
		<table border="0" style="font-size: 13px">
			<th>Address</th>
			<th>Phone Number</th>
			<th>City Region</th>
			<c:forEach var="address" items="${addressbook}">
				<tr>
					<td>${address.address }</td>
					<td>${address.phone}</td>
					<td>${address.cityRegion}</td>			
				</tr>
			</c:forEach>
		</table>
		
	</div>
	<div style="clear: both; height: 40px"></div>
</div>
<!-- close container -->