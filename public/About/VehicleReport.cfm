<!DOCTYPE HTML>
<html>
    <head>
        <meta charset="utf-8">
        <title>Company Vehicles - FemboyFinancial Online Webportal</title>
        <style>
			html, body {
				margin: 0;
				width: 640px;
				height: 480px;
			}
            body {
                background-image: url('/assets/Downloads.gif');
				background-color: #1600FF;
                background-repeat: no-repeat;
                color: #EE2D24;
            }
            .copyright, .footerlinks a {
                color: #EE2D24;
            }
			.carlist {
				font-size: 12px;
				margin: 0 8px;
			}
			h1 {
				font-size: 16px;
			}
			h3 {
				margin-top: 30px;
				margin-bottom: 0;
			}
			p.graph {
				text-align: center;
			}
			
			.copyright {
				margin: 0;
			}
			.footer {
				margin-top: 20px;
				font-size: 12px;
				text-align: center;
			}
			.footerlinks a {
				margin: 0 24px;
				font-size: 12px;
			}
        </style>
		<script src="/js/swfobject.js"></script>
    </head>
    <body>
		<h1><img src="/assets/GasPumppe.gif"> Company Vehicles</h1>
        <div class="carlist">

			<p>In the interest of Environmental preservation and lower operating costs, FemboyFinancial have chosen only the most fuel-efficient vehicles for their fleet.</p>
			<p>For the sake of transparency the vehicles' mileage data is periodically published on this webbe page.</p>
			
			<h3>1983 Honda Civic</h3>
			<table border="0" cellpadding="0">
				<tbody>
				<tr>
					<td width="90%">
						<p><strong>Fast Facts</strong></p>
						<ul>
							<li><strong>COLOUR:</strong> Creme</li>
							<li><strong>ENGINE DISPLACEMENT:</strong> 1300cc</li>
							<li><strong>TRIM:</strong> Based model</li>
							<li><strong>TRANSMISSION:</strong> 5-speed manual</li>
							<li><strong>MANUFACTURED IN:</strong> Suzuka, Japan</li>
							<li><strong>FUEL ECONOMY:</strong> Basically 80 myles per gallonne</li>
						</ul>
					</td>
					<td>
						<img height="100" src="/assets/HondaCivic.gif"> 
					</td>
				</tr>
				</tbody>
			</table>
			
			<p class="graph">
				<cfgraph type="Line" backgroundcolor="white" title="Vehicular Mileage Log" valueColumn="Total Miles Travelled" itemColumn="Unix Timestamppe"
						 fileFormat="jpg" titleFont="Times" lineColor="red" graphHeight="300" itemLabelFont="Times" scaleFrom="116010" gridLines=5>
					<cfgraphdata item="2020-06-27" value=116021>
					<cfgraphdata item="2020-07-31" value=116021>
					<cfgraphdata item="2020-08-21" value=116023.3>
					<cfgraphdata item="2020-08-23" value=116023.4>
					<cfgraphdata item="2020-09-04" value=116028>
					<cfgraphdata item="2020-09-11" value=116032.3>
					<cfgraphdata item="2020-09-12" value=116033.5>
					<cfgraphdata item="2020-10-14" value=116041>
					<cfgraphdata item="2020-10-18" value=116089.9>
					<cfgraphdata item="2020-10-21" value=116116.4>
					<cfgraphdata item="2020-10-26" value=116150>
					<cfgraphdata item="2020-11-04" value=116356.7>
					<cfgraphdata item="2020-11-05" value=116386>
					<cfgraphdata item="2020-11-06" value=116427.3>
					<cfgraphdata item="2020-11-07" value=116451.7>
					<cfgraphdata item="2020-11-09" value=116470.6>
					<cfgraphdata item="2020-11-10" value=116518.7>
					<cfgraphdata item="2020-11-12" value=116549.5>
					<cfgraphdata item="2020-11-14" value=116553.7>
					<cfgraphdata item="2020-11-15" value=116584.8>
					<cfgraphdata item="2020-11-16" value=116627.3>
					<cfgraphdata item="2020-11-17" value=116726.4>
					<cfgraphdata item="2020-11-19" value=116800.6>
					<cfgraphdata item="2020-11-21" value=116806>
					<cfgraphdata item="2020-11-22" value=116918.2>
					<cfgraphdata item="2020-11-24" value=116940>
					<cfgraphdata item="2020-11-25" value=116970>
					<cfgraphdata item="2020-11-29" value=116998.3>
					<cfgraphdata item="2020-11-30" value=117002.3>
					<cfgraphdata item="2020-12-01" value=117095>
					<cfgraphdata item="2020-12-04" value=117223.9>
					<cfgraphdata item="2020-12-05" value=117395.1>
					<cfgraphdata item="2020-12-06" value=117407.9>
					<cfgraphdata item="2020-12-12" value=117460.5>
					<cfgraphdata item="2020-12-14" value=117518.9>
				</cfgraph>
			</p>
			<p>Make sure to check back regularly for updates!</p>
			
        </div>

<cfinclude template="../../templates/Footer.cfm">
