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
<%@page import="com.yantra.yfs.ui.backend.YFSUIBackendConsts" %>
<%@page import="com.yantra.yfc.ui.backend.YFCUIBackendInstance"%>
<%
	String errorMsg = (String)getParameter("ErrorMsg");
        String errorMsgDetail = (String)getParameter("ErrorMsgDetail");
	YFCUIBackendInstance.getInstance().setContextPath(request.getContextPath());
	String url = "http://www.ibm.com";
	if(!YFCCommon.isVoid(pageContext.getServletContext().getInitParameter("sci-aboutbox-url")))
	{
		url = pageContext.getServletContext().getInitParameter("sci-aboutbox-url");
	}
%>
<style>
.page {
	background-color:#ffffff;
	width:300px;
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#ffffff, endColorstr=#c0c0c0);
}
.bottompanel	{
	height:325px;
	width:100%;
}
.bottompanel1	{
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr=#ffffff, endColorstr=#ffffff );
	font: normal normal bold 12pt Arial;
	color: #000000;
}
.logleft1	{
	width :100%;
	height:100%;
	border:0;
}
.logleft2	{
	height:25px;
}
.logleft3	{
	height:141px;
}
.logleft4	{
	vertical-align:top;
}
.logleft5	{
	height:141px;
	width:100%;
	padding:0;
}
.logleft6	{
	height:86px;
	width:100%;
	padding:0;
}

.copyright {
    font: normal normal normal 9pt Arial;
    border-width:0px; 
    border-style:solid; 
}

a:visited{color:#0000CC}
a:hover{color:#0000CC}
a:link{color:#0000CC}
a:active{color:#0000CC}

</style>
<script language="javascript">
    var contextPath="<%=request.getContextPath()%>";
	var urlString = "<%=url%>";
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
<html>
	<head>
		<title><yfc:i18n>Yantra_7x</yfc:i18n></title>
		<link rel="icon" href="/smcfs/extn/console/icons/kohlsicon.jpg" type="image/x-icon" />
        <link rel="shortcut icon" href="/smcfs/extn/console/icons/kohlsicon.jpg" />
	</head>
	<body style="margin:0;">
			<TABLE  width=100% height=100%>
				<TR>
					<TD align=center valign=bottom colspan=3>
						<img src="/smcfs/extn/console/icons/kohlslogo.jpg" />
					</TD>
				</TR>
				<TR>
					<TD  align=center valign=middle colspan=3>
					<jsp:include page='<%=getActualPath("/console/logininputs.jsp")%>' flush="true" />
					</TD>
				</TR>
				<TR>
				<TD width="30%"></TD>
					<TD align=center valign=top>
						<TABLE >
							<TR>
								<TD align=center class="bottompanel1" valign=bottom>
										Solutions for Fulfillment Excellence<br>							
								</TD>
							</TR>
							<TR>
								<TD align=center class="copyright" valign=top>
									&copy; <yfc:i18n>_Copyright_</yfc:i18n>  <a style=":visited:#0000CC;:link:#0000CC;:active:#0000CC;:hover:#0000CC;" href="#"><yfc:i18n>Company_name</yfc:i18n></a>
									&nbsp;<yfc:i18n>Copyright_year</yfc:i18n>
									&nbsp;<yfc:i18n>All_rights_reserved</yfc:i18n>
								</TD>
								
							</TR>
							<TR>
								<TD align=center class="copyright" valign=top>
									<yfc:i18n>Logo_Registered_Trademark</yfc:i18n>
									&nbsp;<yfc:i18n>Java_based_Trademark</yfc:i18n>
								</TD>
							</TR>
						</TABLE>
					</TD>
					<TD width="30%" align=left valign=top>
						<img width="54px" height="95px" src="<%=YFSUIBackendConsts.JAVA_COMPATIBILITY_LOGO%>" />
					</TD>
				</TR>
				
			</TABLE>
	</body>
</html>
