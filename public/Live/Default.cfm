<cfset pagetitle = "Live Camera Feed">
<cfinclude template="../../templates/Header.cfm">

<meta http-equiv="refresh" content="5">
<style>
	.content {
		margin: 0 10px;
	}
	.content h3 {
		color: #3A7FF1;
		margin: 0;
		margin-bottom: 10px;
	}
</style>

<div class="content">
	<h3>Here you can view a Live video feed of our office.</h3>
	<img src="/Live/Thumb.jpg" width="160" height="120">
</div>

<cfinclude template="../../templates/Footer.cfm">
