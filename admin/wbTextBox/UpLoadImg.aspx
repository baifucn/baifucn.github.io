﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UpLoadImg.aspx.cs" Inherits="WangQi.wbTextBox.UpLoadImg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
			<table style="PADDING-LEFT: 10px" cellSpacing="10" cellPadding="0" align="center" border="0">
				<tr>
					<td align="center" colSpan="2"><font style="FONT-SIZE: 12pt">上传图片</font>
						<hr width="100%">
						图片：<INPUT id="myFile" type="file" runat="server">
					</td>
				</tr>
				<tr>
					<td align="center" colSpan="2"><asp:button id="btnUp" runat="server" Text="上传" OnClick="btnUp_Click"></asp:button>&nbsp;<BUTTON onclick="window.returnValue ='';window.close();" type="button">取消</BUTTON>
					</td>
				</tr>
			</table>
    </div>
    </form>
</body>
</html>
