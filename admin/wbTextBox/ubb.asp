<%
Public function Ubbcode(strContent)


dim re,ii,po
dim reContent
Set re=new RegExp
re.IgnoreCase =true
re.Global=True

	strContent=Replace(strContent,"file:","file :")
	strContent=Replace(strContent,"files:","files :")
	strContent=Replace(strContent,"script:","script :")
	strContent=Replace(strContent,"js:","js :")

re.Pattern="\[IMG\](http|https|ftp):\/\/(.[^\[]*)\[\/IMG\]"
strContent=re.Replace(strContent,"<a onfocus=this.blur() href=""$1://$2"" target=_blank><IMG SRC=""$1://$2"" border=0 alt=�������´������ͼƬ onload=""javascript:if(this.width>screen.width-333)this.width=screen.width-333""></a>")

re.Pattern="\[UPLOAD=(gif|jpg|jpeg|bmp)\](.[^\[]*)(gif|jpg|jpeg|bmp)\[\/UPLOAD\]"
strContent= re.Replace(strContent,"<br><IMG SRC=""image/$1.gif"" border=0>����������������£�<br><A HREF=""$2$1"" TARGET=_blank><IMG SRC=""$2$1"" border=0 alt=�������´������ͼƬ onload=""javascript:if(this.width>screen.width-333)this.width=screen.width-333""></A>")

re.Pattern="\[UPLOAD=(doc|xls|ppt|htm|swf|rar|zip|exe)\](.[^\[]*)(doc|xls|ppt|htm|swf|rar|zip|exe)\[\/UPLOAD\]"
strContent= re.Replace(strContent,"<br><IMG SRC=""image/$1.gif"" border=0>����������������£�<br><a href=""$2$1"" target='_blank'>���������ļ�</a>")


re.Pattern="(\[FLASH\])(http://.[^\[]*(.swf))(\[\/FLASH\])"
strContent= re.Replace(strContent,"<a href=""$2"" TARGET=_blank><IMG SRC=image/swf.gif border=0 alt=������´������͸�FLASH����! height=16 width=16>[ȫ������]</a><br><center><OBJECT codeBase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0 classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 width=500 height=400><PARAM NAME=movie VALUE=""$2""><PARAM NAME=quality VALUE=high><embed src=""$2"" quality=high pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width=500 height=400>$2</embed></OBJECT></center>")

re.Pattern="(\[FLASH=*([0-9]*),*([0-9]*)\])(http://.[^\[]*(.swf))(\[\/FLASH\])"
strContent= re.Replace(strContent,"<a href=""$4"" TARGET=_blank><IMG SRC=image/swf.gif border=0 alt=������´������͸�FLASH����! height=16 width=16>[ȫ������]</a><br><center><OBJECT codeBase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0 classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 width=$2 height=$3><PARAM NAME=movie VALUE=""$4""><PARAM NAME=quality VALUE=high><embed src=""$4"" quality=high pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width=$2 height=$3>$4</embed></OBJECT></center>")


re.Pattern="(\[URL\])(.[^\[]*)(\[\/URL\])"
strContent= re.Replace(strContent,"<A HREF=""$2"" TARGET=_blank>$2</A>")
re.Pattern="(\[URL=(.[^\[]*)\])(.[^\[]*)(\[\/URL\])"
strContent= re.Replace(strContent,"<A HREF=""$2"" TARGET=_blank>$3</A>")

re.Pattern="(\[EMAIL\])(\S+\@.[^\[]*)(\[\/EMAIL\])"
strContent= re.Replace(strContent,"<img align=absmiddle src=image/email1.gif><A HREF=""mailto:$2"">$2</A>")
re.Pattern="(\[EMAIL=(\S+\@.[^\[]*)\])(.[^\[]*)(\[\/EMAIL\])"
strContent= re.Replace(strContent,"<img align=absmiddle src=image/email1.gif><A HREF=""mailto:$2"" TARGET=_blank>$3</A>")

'�Զ�ʶ����ַ
re.Pattern = "^((http|https|ftp|rtsp|mms):(\/\/|\\\\)[A-Za-z0-9\./=\?%\-&_~`@[\]\':+!]+)"
strContent = re.Replace(strContent,"<img align=absmiddle src=image/url.gif border=0><a target=_blank href=$1>$1</a>")
re.Pattern = "((http|https|ftp|rtsp|mms):(\/\/|\\\\)[A-Za-z0-9\./=\?%\-&_~`@[\]\':+!]+)$"
strContent = re.Replace(strContent,"<img align=absmiddle src=image/url.gif border=0><a target=_blank href=$1>$1</a>")
re.Pattern = "([^>=""])((http|https|ftp|rtsp|mms):(\/\/|\\\\)[A-Za-z0-9\./=\?%\-&_~`@[\]\':+!]+)"
strContent = re.Replace(strContent,"$1<img align=absmiddle src=image/url.gif border=0><a target=_blank href=$2>$2</a>")

'�Զ�ʶ��www�ȿ�ͷ����ַ
re.Pattern = "([^(http://|http:\\)])((www|cn)[.](\w)+[.]{1,}(net|com|cn|org|cc)(((\/[\~]*|\\[\~]*)(\w)+)|[.](\w)+)*(((([?](\w)+){1}[=]*))*((\w)+){1}([\&](\w)+[\=](\w)+)*)*)"
strContent = re.Replace(strContent,"<img align=absmiddle src=image/url.gif border=0><a target=_blank href=http://$2>$2</a>")


re.Pattern="\[color=(.[^\[]*)\](.[^\[]*)\[\/color\]"
strContent=re.Replace(strContent,"<font color=$1>$2</font>")
re.Pattern="\[face=(.[^\[]*)\](.[^\[]*)\[\/face\]"
strContent=re.Replace(strContent,"<font face=$1>$2</font>")
re.Pattern="\[align=(center|left|right)\](.*)\[\/align\]"
strContent=re.Replace(strContent,"<div align=$1>$2</div>")

re.Pattern="\[SHADOW=*([0-9]*),*(#*[a-z0-9]*),*([0-9]*)\](.[^\[]*)\[\/SHADOW]"
strContent=re.Replace(strContent,"<table width=$1 ><tr><td style=""filter:shadow(color=$2, strength=$3)"">$4</td></tr></table>")
re.Pattern="\[GLOW=*([0-9]*),*(#*[a-z0-9]*),*([0-9]*)\](.[^\[]*)\[\/GLOW]"
strContent=re.Replace(strContent,"<table width=$1 ><tr><td style=""filter:glow(color=$2, strength=$3)"">$4</td></tr></table>")

re.Pattern="\[MP=*([0-9]*),*([0-9]*)\](.[^\[]*)\[\/MP]"
strContent=re.Replace(strContent,"<object align=middle classid=CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95 class=OBJECT id=MediaPlayer width=$1 height=$2 ><param name=ShowStatusBar value=-1><param name=Filename value=$3><embed type=application/x-oleobject codebase=http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701 flename=mp src=$3  width=$1 height=$2></embed></object>")


re.Pattern="\[RM=*([0-9]*),*([0-9]*)\](.[^\[]*)\[\/RM]"
strContent=re.Replace(strContent,"<OBJECT classid=clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA class=OBJECT id=RAOCX width=$1 height=$2><PARAM NAME=SRC VALUE=$3><PARAM NAME=CONSOLE VALUE=Clip1><PARAM NAME=CONTROLS VALUE=imagewindow><PARAM NAME=AUTOSTART VALUE=true></OBJECT><br><OBJECT classid=CLSID:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA height=32 id=video2 width=$1><PARAM NAME=SRC VALUE=$3><PARAM NAME=AUTOSTART VALUE=-1><PARAM NAME=CONTROLS VALUE=controlpanel><PARAM NAME=CONSOLE VALUE=Clip1></OBJECT>")

re.Pattern="\[CENTER](.[^\[]*)\[\/CENTER]"
strContent=re.Replace(strContent,"<center>$1</center>")
re.Pattern="\[i\](.[^\[]*)\[\/i\]"
strContent=re.Replace(strContent,"<i>$1</i>")
re.Pattern="\[u\](.[^\[]*)(\[\/u\])"
strContent=re.Replace(strContent,"<u>$1</u>")
re.Pattern="\[b\](.[^\[]*)(\[\/b\])"
strContent=re.Replace(strContent,"<b>$1</b>")
re.Pattern="\[size=([1-4])\](.[^\[]*)\[\/size\]"
strContent=re.Replace(strContent,"<font size=$1>$2</font>")
strContent=replace(strContent,"<I></I>","")
set re=Nothing
Ubbcode=strContent
end function
%>