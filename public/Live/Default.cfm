<cfset pagetitle = "Live Camera Feed">
<cfinclude template="../../templates/Header.cfm">

<!--<meta http-equiv="refresh" content="5">-->
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
	<!--- <cfhttp method="GET" url="http://192.168.0.205/snapshot.jpg" path="C:/Inetpub/FemboyFinancial.soy/public/Live/" /> --->
	<!-- <img src="/Live/snapshot.jpg" width="640" height="360"> -->
	<!-- <video preload="auto" style="width: 320px; height: 240px;" src="blob:https://cwwp2.dot.ca.gov/8f6d14de-37bb-4a8a-9121-b757a8742eab"></video> -->
	<img width="320" height="240" src="//cwwp2.dot.ca.gov/data/d4/cctv/image/tvb70i680kingroad/tvb70i680kingroad.jpg">
</div>

<cfinclude template="../../templates/Footer.cfm">
