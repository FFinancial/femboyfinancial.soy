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
            .dllist a {
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

            <h6>FemBanking Desktop Application</h6>
            <p><img width="16" height="16" src="/assets/DownloadIcon.gif"> <a href="/downloads/FemboyBanking.exe">Download (<cfoutput>#sizeKb#</cfoutput> KB)</a></p>

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
			<p>The FUN clicking game that's taking company break rooms by storm!</p>
            <p><img width="16" height="16" src="/assets/DownloadIcon.gif"> <a href="/downloads/FemboyCliquere.exe">Download V1.0 (<cfoutput>#sizeKb#</cfoutput> KB)</a></p>


        </div>

<cfinclude template="../../templates/Footer.cfm">
