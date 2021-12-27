<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8">
		<title><cfoutput># pagetitle #</cfoutput> - FemboyFinancial Online Webportal</title>
		<link rel="stylesheet" href="/css/main.css">
		<link rel="shortcut icon" href="/favicon.ico" type="image/icon">
		<link rel="icon" type="image/icon" href="/favicon.ico">
	</head>
	<body>
		<img height="69" width="640" src="/assets/Welcome.gif">
		<marquee></marquee>
		<div class="toplinks">
			<cfif cgi.script_name IS "/Default.cfm">
				<a style="font-weight: bold;" href="/">Home Page</a>
			<cfelse>
				<a href="/">Home Page</a>
			</cfif>
			<cfif cgi.script_name IS "/Events.cfm">
				<a style="font-weight: bold;" href="/Events.cfm">New Company Events</a>
			<cfelse>
				<a href="/Events.cfm">New Company Events</a>
			</cfif>
			<cfif cgi.script_name IS "/Products.cfm">
				<a style="font-weight: bold;" href="/Products.cfm">Our Products</a>
			<cfelse>
				<a href="/Products.cfm">Our Products</a>
			</cfif>
			<cfif cgi.script_name IS "/Help.cfm">
				<a style="font-weight: bold;" href="/Help.cfm">Help</a>
			<cfelse>
				<a href="/Help.cfm">Help</a>
			</cfif>
			<cfif cgi.script_name IS "/About/Default.cfm">
				<a style="font-weight: bold;" href="/About">About Us</a>
			<cfelse>
				<a href="/About">About Us</a>
			</cfif>
			<cfif cgi.script_name IS "/Contact.cfm">
				<a style="font-weight: bold;" href="/Contact.cfm">Contact Us</a>
			<cfelse>
				<a href="/Contact.cfm">Contact Us</a>
			</cfif>
			<cfif cgi.script_name IS "/Sitemap.cfm">
				<a style="font-weight: bold;" href="/Sitemap.cfm">Site Map</a>
			<cfelse>
				<a href="/Sitemap.cfm">Site Map</a>
			</cfif>
		</div>
		<hr>
