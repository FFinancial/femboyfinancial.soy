<cfset pagetitle = "Our Subsidiaries">
<cfinclude template="../../templates/Header.cfm">

<style>
	.content {
		margin: 40px;
		color: #3A7FF1;
	}
	table {
		margin: 0;
	}
	td img {
		padding: 10px 5px;
	}
	td.howfeed img {
		padding-left: 5px;
		padding-right: 5px;
	}
	td.law {
		position: relative;
	}
	td.law img {
		position: absolute;
		top: -40px;
	}
	td.law span {
		position: absolute;
		left: 75px;
		top: 70px;
		width: 300px;
		display: block;
	}
</style>

<div class="content">
	<h3>Our Subsidiaries</h3>
	<table cellpadding="5" border="0">
	<tbody>
		<tr>
			<td class="howfeed" valign="top" width="50%">
				<a href="//howfeed.biz"><img src="/assets/howfeeddither.png" width="200"></a>
				<span>Howfeed.biz LLC offers 21st century How-To's for 21st century issues the average person may face. While remaining somewhat independent from FemboyFinancial, Howfeed.biz closely follows our core mission statement and vision as a modern business.</span>
			</td>
			<td class="law" valign="top" width="50%">
				<img src="/assets/LawDither.png" width="400">
				<span>Over the past decade FemboyFinancial has become aware of a growing need for affordable and easy legal advice and an experienced team of attorneys. We've since met this demand with our very own board of legal advisors in respect to both criminal and civil law.</span>
			</td>
		</tr>
		<tr>
			<td valign="top" width="50%">
				<a href="//fembooru.jp"><img src="/assets/Fembooru.gif" width="250"></a>
				<span>Explore our vast file sharing page, as this sample shows you, we use the most up to date file indexing technology to upload and access images and videos at lightning speeds.</span>
			</td>
			<td valign="top" width="50%"></td>
		</tr>
	</tbody>
	</table>
</div>


<cfinclude template="../../templates/Footer.cfm">
