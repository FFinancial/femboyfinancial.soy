<!DOCTYPE HTML>
<html>
    <head>
        <meta charset="utf-8">
        <title>Download Centre - FemboyFinancial Online Webportal</title>
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
            .dllist {
                margin: 65px 75px;
                height: 200px;
            }
            .dllist p, .dllist h6 {
                margin: 0;
            }
            .dllist h6 {
                margin-bottom: 10px;
            }
            .dllist a, .dllist p {
                color: #EE2D24;
                font-size: 9px;
            }
        </style>
    </head>
    <body>
        <img width="177" height="112" src="/assets/DownloadCentre.gif">
        <div class="dllist">

			<cfset filename = expandpath("FemboyBanking.exe")>
			<cftry>
				<cffile file = "#filename#" action = "read" variable = "content">
				<cfset sizeKb = Round(Len(content) / 1000)>
				<cfcatch type="any">
					<cfoutput>
						<p>#cfcatch.message#</p>
						<p>#cfcatch.detail#</p>
					</cfoutput>
				</cfcatch>
			</cftry>

			<div style="float: left;width:200px;">
				<h6>FemBanking Desktop Application</h6>
				<p>Requires Windows XP or newer.</p>
				<p><img width="16" height="16" src="/assets/DownloadIcon.gif"> <a href="/downloads/FemboyBanking.exe">Download (<cfoutput>#sizeKb#</cfoutput> KB)</a></p>
			</div>
			
			<cfset filename = expandpath("FemboyInstaller.msi")>
			<cftry>
				<cffile file = "#filename#" action = "read" variable = "content">
				<cfset sizeKb = Round(Len(content) / 1000)>
				<cfcatch type="any">
					<cfoutput>
						<p>#cfcatch.message#</p>
						<p>#cfcatch.detail#</p>
					</cfoutput>
				</cfcatch>
			</cftry>

			<div style="margin-left:240px;width:240px;">
				<h6>FemboyWatchdog</h6>
				<p>Requires Windows XP or newer.</p>
				<p><img width="16" height="16" src="/assets/DownloadIcon.gif"> <a href="/downloads/FemboyInstaller.msi">Download V0.4.1 (<cfoutput>#sizeKb#</cfoutput> KB)</a></p>
			</div>
			
			<br>
			
			<cfset filename = expandpath("FemboyCliquere.exe")>
			<cftry>
				<cffile file = "#filename#" action = "read" variable = "content">
				<cfset sizeKb = Round(Len(content) / 1000)>
				<cfcatch type="any">
					<cfoutput>
						<p>#cfcatch.message#</p>
						<p>#cfcatch.detail#</p>
					</cfoutput>
				</cfcatch>
			</cftry>

            <h6>Femboy Cliquere</h6>
			<p>Requires Windows 95 or newer.</p>
			<p><img width="16" height="16" src="/assets/DownloadIcon.gif"> <a href="/downloads/FemboyCliquere.exe">Download V1.0 (<cfoutput>#sizeKb#</cfoutput> KB)</a></p>

			<br>
			
			<cfset filename = expandpath("FemboyGeometry_1.0.0.rar")>
			<cftry>
				<cffile file = "#filename#" action = "read" variable = "content">
				<cfset sizeKb = Round(Len(content) / 1000)>
				<cfcatch type="any">
					<cfoutput>
						<p>#cfcatch.message#</p>
						<p>#cfcatch.detail#</p>
					</cfoutput>
				</cfcatch>
			</cftry>

            <h6>Femboy Geometry</h6>
			<p>Requires Windows 98 SE™ or newer.</p>
            <p><img width="16" height="16" src="/assets/DownloadIcon.gif"> <a href="/downloads/FemboyGeometry_1.0.0.rar">Download V1.0 (<cfoutput>#sizeKb#</cfoutput> KB)</a></p>


        </div>

<cfinclude template="../../templates/Footer.cfm">
