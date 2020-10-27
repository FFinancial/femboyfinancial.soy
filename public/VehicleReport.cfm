<!DOCTYPE HTML>
<html>
    <head>
        <meta charset="utf-8">
        <title>Company Vehicles - FemboyFinancial Online Webportal</title>
        <link rel="stylesheet" href="/css/main.css">
        <style>
            body {
                background-image: url('/assets/Downloads.gif');
				background-color: #1600FF;
                background-repeat: no-repeat;
                color: #EE2D24;
            }
            .copyright, .footerlinks a {
                color: #EE2D24;
            }
        </style>
    </head>
    <body>
        <img width="177" height="112" src="/assets/GasPumppe.gif">
		<h1>Company Vehicles</h1>
        <div class="carlist">

			<p>In the interest of Environmental preservation and lower operating costs, FemboyFinancial have chosen only the most fuel-efficient vehicles for their fleet.</p>
			<p>For the sake of transparency we publish our vehicles' mileage data on this webbe page.</p>
			
			<h6><img src="/assets/HondaCivic.gif"> 1983 Honda Civic</h6>
			<p><strong>Fast Facts</strong></p>
			<ul>
				<li><strong>COLOUR:</strong> Creme</li>
				<li><strong>ENGINE DISPLACEMENT:</strong> 1300cc</li>
				<li><strong>TRIM:</strong> Based model</li>
				<li><strong>TRANSMISSION:</strong> 5-speed manual</li>
				<li><strong>MANUFACTURED IN:</strong> Suzuka, Japan</li>
				<li><strong>FUEL EFFICIENCY:</strong> Basically 80 myles per gallonne</li>
			</ul>
			<cfchart showborder="yes" chartheight="300" chartwidth="300" yaxistitle="Total Miles Travelled" xaxistitle="Unix Timestamppe">
				<cfchartseries type="line" serieslabel="1983 Honda Civic">
					<cfchartdata item="1596258780" value="116021">
					<cfchartdata item="1598061960" value="116023.3">
					<cfchartdata item="1598234156" value="116023.4">
					<cfchartdata item="1599270360" value="116028">
					<cfchartdata item="1599877020" value="116032.3">
					<cfchartdata item="1599895817" value="116033.5">
					<cfchartdata item="1603069135" value="116089.9">
				</cfchartseries>
			</cfchart>
			
        </div>

<cfinclude template="../../templates/Footer.cfm">
