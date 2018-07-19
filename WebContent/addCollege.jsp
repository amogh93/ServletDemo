<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Add College</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="https://fonts.googleapis.com/css?family=Raleway" rel="stylesheet">
<style type="text/css">
body { 
	font-size:17px !important;
	font-family: 'Raleway', sans-serif !important;
}
label{
	font-weight:normal!important;
}
.errorMessage{
	color: #ff0000;
}

@media (max-width: 1100px) {
.sidebar-nav-fixed.affix {position: static;}
.sidebar-nav-fixed>div.well {height: 80px;}
}

.footer {
  	text-align:center;
  	font-size:17px;
	font-family: 'Raleway', sans-serif;
}
</style>
<script>

$(document).ready(function() {
	$("#dob").datepicker({
		changeYear: true,
		yearRange: "1930:2018",
		dateFormat: "yy-mm-dd",
		changeMonth: true
	});
});
		
function loadCities(stateId)
{
	if(stateId==0)
	{
		$('#city').empty();
		$("#city").prop('disabled',true);
	}
	else
	{
		$('#city').empty();
		$("#city").prop('disabled', false);
	    
	    var selectedItemValue = $("#state").val();
	    $.ajax({
	        url:'getCities',
	        type:'GET',
	        data: 'query=' +stateId ,
	        dataType: 'json',
	        success: function( json ) {
	            $.each(json, function(i, value) {
	                $('#city').append($('<option>').text(value.name).attr('value', value.id));
	            });
	        }
	    });
	}
	
}

function loadStates(countryId)
{
	if(countryId==0)
	{
		$('#state').empty();
		$("#state").prop('disabled',true);
		$('#city').empty();
		$("#city").prop('disabled',true);
	}
	else
	{
		$('#state').empty();
		$("#state").prop('disabled', false);
	    
	    var selectedItemValue = $("#country").val();
	    $.ajax({
	        url:'getCities',
	        type:'GET',
	        data: 'query=' +country ,
	        dataType: 'json',
	        success: function( json ) {
	            $.each(json, function(i, value) {
	                $('#state').append($('<option>').text(value.name).attr('value', value.id));
	            });
	        }
	    });
	}
	
}
</script>
</head>
<body>
<div class="wrap">
<div class="container-fluid text-center" style="margin-top:40px;">
	<div class="row content">
		<!-- Form begins -->
		<div class=" sidebar-nav-fixed col-md-12 col-sm-12 col-xs-12">
			<h1><u>Add user</u></h1><br/>
			<div class="table-responsive" align="center" style="margin-top:10px;">
			<form method="post" action="addUser.do">
				<table class="table" style="width:80%;">
					<tr>
						<td class="text-left">
							<span class="title">User ID:</span>
							<span class="glyphicon glyphicon-info-sign" data-toggle="tooltip" data-placement="bottom" title="User ID"></span>
						</td>
						<td>
							<input type="text" id="id" name="id" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td class="text-left">
							<span class="title">User name:</span>
							<span class="glyphicon glyphicon-info-sign" data-toggle="tooltip" data-placement="bottom" title="Name of user"></span>
						</td>
						<td>
							<input type="text" id="name" name="name" class="form-control"/><br /><br />
						</td>
					</tr>
					<tr>
						<td class="text-left">
							<span class="title">DOB:</span>
							<span class="glyphicon glyphicon-info-sign" data-toggle="tooltip" data-placement="bottom" title="Name of user"></span>
						</td>
						<td>
							<input type="text" id="dob" class="form-control" name="dob" placeholder="yyyy-mm-dd"><br /><br />
						</td>
					</tr>
					<tr>
						<td class="text-left">
							<span class="title">Address:</span>
							<span class="glyphicon glyphicon-info-sign" data-toggle="tooltip" data-placement="bottom" title="Name of user"></span>
						</td>
						<td>
							<label>Country:</label>
							<select id="country" class="form-control" onchange="loadStates(this.value);">
								<option value="0">--Select country--</option>
								<option value="1">MAH</option>
								<option value="1">GJ</option>
							</select><br />
							
							<label>State:</label>
							<select id="state" class="form-control" disabled="true" onchange="loadCities(this.value);">
								<option value="0">--Select state--</option>
							</select><br/>
							
							<label>City:</label>
							<select id="city" class="form-control" disabled="true">
								<option value="0">--Select city--</option>
							</select><br/>
						</td>
					</tr>
					<tr>
						<td class="text-left">
							<span class="title">Contact number:</span>
							<span class="glyphicon glyphicon-info-sign" data-toggle="tooltip" data-placement="bottom" title="Contact number of the college with area code"></span>
						</td>
						<td>
							<input type="text" path="contact" id="contact" class="form-control"/>
						</td>
					</tr>
					<tr>
						<td class="text-left">
							<span class="title">Hobbies:</span>
							<span class="glyphicon glyphicon-info-sign" data-toggle="tooltip" data-placement="bottom" title="Medium of transport available for students"></span>
						</td>
						<td>
							<input type="checkbox" value="Municipal transport"/>Cricket<br/>
							<input type="checkbox" value="Share auto"/>Music<br/>
							<input type="checkbox" value="Private bus"/>Movies<br/>
							<input type="checkbox" value="College bus"/>Reading<br/>
							<input type="checkbox" value="State transport"/>NA
						</td>
					</tr>
				</table>
				<button class="btn btn-primary" style="width:120px;">ADD</button>
			</form>
			</div>
		</div>
		<!-- Form ends -->
	</div>
</div>
<br/><br/>
</div>
<!-- <div class="footer">
      <div class="container">
        <p class="text-muted" style="margin:auto;">Copyright&#x24B8; 2017</p>
      </div>
</div>
-->
</body>
</html>