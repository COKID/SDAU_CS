

Window("Flight Reservation").WinMenu("Menu").Select "File;Open Order..." @@ hightlight id_;_6841398_;_script infofile_;_ZIP::ssf3.xml_;_
Window("Flight Reservation").Dialog("Open Order").WinCheckBox("Order No.").Set "ON"
'从数据表中选订单号
Window("Flight Reservation").Dialog("Open Order").WinEdit("Edit").Set DataTable("orderNo", dtGlobalSheet)
Window("Flight Reservation").Dialog("Open Order").WinButton("OK").Click
 
'软件里的数据 名称、订单号、航班、总计
Dim name,orderNo,flightNo,total
name=Window("Flight Reservation").WinEdit("Name:").GetROProperty("text")
orderNo=Window("Flight Reservation").WinEdit("Order No:").GetROProperty("text")
flightNo=Window("Flight Reservation").WinEdit("Flight No:").GetROProperty("text")
total=Window("Flight Reservation").WinEdit("Total:").GetROProperty("text")

'保存到表里面
datatable.Value("o_name","Global")=name
datatable.Value("o_orderNo","Global")=orderNo
datatable.Value("o_flightNo","Global")=flightNo
datatable.Value("o_total","Global")=total






