Window("Flight Reservation").WinMenu("Menu").Select "File;Fax Order..."

'数据表内的数据(open_order)
Dim name,orderNo,flightNo,total
name=DataTable("o_name", dtGlobalSheet)
orderNo=DataTable("o_orderNo", dtGlobalSheet)
flightNo=DataTable("o_flightNo", dtGlobalSheet)
total=DataTable("o_total", dtGlobalSheet)
'处理一下$符号
total=mid(total,2)

'软件界面的数据
Dim f_name,f_orderNo,f_flightNo,f_total
f_name=Window("Flight Reservation").Dialog("Fax Order No").WinEdit("Name:").GetROProperty("text")
f_orderNo=Window("Flight Reservation").Dialog("Fax Order No").WinEdit("Order:").GetROProperty("text")
f_flightNo=Window("Flight Reservation").Dialog("Fax Order No").WinEdit("Flight:").GetROProperty("text")
f_total=Window("Flight Reservation").Dialog("Fax Order No").WinEdit("Total:").GetROProperty("text")

If (name=f_name and orderNo=f_orderNo and flightNo=f_flightNo and total=f_total) Then
	Reporter.ReportEvent micPass,"传真订单窗口上信息与打开订单的信息比较结果","一致！！！"
else
	Reporter.ReportEvent micPass,"传真订单窗口上信息与打开订单的信息比较结果","不一致！！！"	
End If

'-----------------------------------
Dim f_tickets,f_price
f_tickets=Window("Flight Reservation").Dialog("Fax Order No").WinEdit("# Tickets:").GetROProperty("text")
f_price=Window("Flight Reservation").Dialog("Fax Order No").WinEdit("Ticket Price:").GetROProperty("text")
f_tickets=cint(f_tickets)
f_price=cdbl(f_price)
f_total=cdbl(f_total)

If f_tickets*f_price=f_total Then
	Reporter.ReportEvent micPass,"priceCal","f_tickets*f_price=f_total！！！"
else
	Reporter.ReportEvent micPass,"priceCal","f_tickets*f_price!=f_total！！！"
End If
 @@ hightlight id_;_20470810_;_script infofile_;_ZIP::ssf7.xml_;_
Window("Flight Reservation").Dialog("Fax Order No").ActiveX("MaskEdBox").Type "0101231234" @@ hightlight id_;_5531196_;_script infofile_;_ZIP::ssf3.xml_;_
Window("Flight Reservation").Dialog("Fax Order No").WinButton("Send").Click @@ hightlight id_;_6906852_;_script infofile_;_ZIP::ssf4.xml_;_
wait 5 @@ hightlight id_;_15663546_;_script infofile_;_ZIP::ssf5.xml_;_
Window("Flight Reservation").ActiveX("Threed Panel Control").Check CheckPoint("Threed Panel Control") @@ hightlight id_;_14377050_;_script infofile_;_ZIP::ssf8.xml_;_
