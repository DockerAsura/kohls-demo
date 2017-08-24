<%
/* 
 * Licensed Materials - Property of IBM
 * IBM Sterling Selling and Fulfillment Suite
 * (C) Copyright IBM Corp. 2001, 2013 All Rights Reserved.
 * US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP Schedule Contract with IBM Corp.
 */
%>
<%@include file="/yfc/util.jspf" %>
<%@page import="com.yantra.yfs.ui.backend.*"%>
<%@page import="com.yantra.yfc.dom.YFCElement"%>
<%@page import="com.yantra.ycp.common.VersionManager"%>
<%
	YFCElement versions = VersionManager.getVersionsXML();
	request.setAttribute("Versions", versions);
	String url = "http://www.ibm.com";
	if(!YFCCommon.isVoid(pageContext.getServletContext().getInitParameter("sci-aboutbox-url")))
	{
		url = pageContext.getServletContext().getInitParameter("sci-aboutbox-url");
	}
%>
<script>
	var urlString = "<%=url%>";
	window.dialogHeight="465px";
	document.onclick = function(event) {
		var eventObj = event || window.event;
		var targetNodeName = "";
		if(eventObj.target) {
			targetNodeName = eventObj.target.nodeName;
		} else if(eventObj.srcElement) {
			targetNodeName = eventObj.srcElement.nodeName;
		}
		if(targetNodeName && targetNodeName.toLowerCase() === "a") {
			window.open(urlString, "", "height=600, width=900, left=0, top=0, status=no, toolbar=no, menubar=no, location=no, resizable=yes, scrollbars=yes");
		}
	}
</script>
<html XMLNS:yantra>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" href="<%="../css/"+getTheme()+".css"%>" type="text/css">
		<title><yfc:i18n>Yantra_7x</yfc:i18n></title>
	</head>
	<style>
		A:active { color:#0000CC }
		A:visited { color:#0000CC }
		A:hover { color:#0000CC }
		A:link { color:#0000CC }
	</style>
	
	<body scrolling=no background="<%=YCPUIBackendConsts.getUIIconPath()+YCPUIBackendConsts.YANTRA_ABOUT_BOX%>">
		<form name="containerform" method='POST'>
			<div class="aboutmain">
				<span class="aboutdetailmain">
					<div style="position:absolute;left:100;top:120;font:normal normal bold 12pt Tahoma;color:black;">
						<yfc:i18n>Application_Consoles</yfc:i18n>
					</div>
					<div style="align:center;left:30;position:absolute;top:150;font:normal normal bold 8pt Tahoma;color: black;">
						<table border="5" class="table" ID="Versions">
							<yfc:loopXML name="Versions" binding="xml:/Versions/@Version" id="Version">
							<%
									String sName = resolveValue("xml:/Version/@Name");
									String sVersion = resolveValue("xml:/Version/@Version");
									String sIsPCA = resolveValue("xml:/Version/@IsPCA");
									String sComment = resolveValue("xml:/Version/@Comment");
									if(sVersion != null && !sVersion.equals("") && !sVersion.equals(" ")) {
							%>
									<tr>
										<td style="font-size: 11;font-family: Tahoma;font-weight: bold;color: black;border: 0;height: 17px;background-color: transparent;text-align: center;">
										<yfc:i18ndb><%=sComment%></yfc:i18ndb>
										<yfc:i18n>ver</yfc:i18n> <%=sVersion%>
										</td>
									</tr>
									<% }
							 %>
							</yfc:loopXML>
						</table>
					</div>
					<div style="position:absolute;left:15;top:270;font:normal normal normal 8pt Tahoma;color:black;">
						&copy; <yfc:i18n>_Copyright_</yfc:i18n> <a style=":visited:#0000CC;:link:#0000CC;:active:#0000CC;:hover:#0000CC;" href="#"><yfc:i18n>Company_name</yfc:i18n></a>
						&nbsp;<yfc:i18n>Copyright_year</yfc:i18n>
						&nbsp;<yfc:i18n>All_rights_reserved</yfc:i18n>
					</div>
				</span>
			</div>
		</form>
	</body>
</html>