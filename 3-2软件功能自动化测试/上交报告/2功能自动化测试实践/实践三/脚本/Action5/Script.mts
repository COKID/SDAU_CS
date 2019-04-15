 @@ hightlight id_;_2450390_;_script infofile_;_ZIP::ssf5.xml_;_

Window("Flight Reservation").WinMenu("Menu").Select "File;Open Order..."
Window("Flight Reservation").Dialog("Open Order").WinCheckBox("Order No.").Set "ON" @@ hightlight id_;_10509590_;_script infofile_;_ZIP::ssf6.xml_;_
'从数据表中选订单号
Window("Flight Reservation").Dialog("Open Order").WinEdit("Edit").Set DataTable("orderNo", dtGlobalSheet) @@ hightlight id_;_1926086_;_script infofile_;_ZIP::ssf7.xml_;_
Window("Flight Reservation").Dialog("Open Order").WinButton("OK").Click @@ hightlight id_;_17652762_;_script infofile_;_ZIP::ssf8.xml_;_

'软件里的数据
Dim dateOfFlight,flyFrom,FlyTo,name
dateOfFlight=Window("Flight Reservation").ActiveX("MaskEdBox").GetROProperty("cliptext")
flyFrom=Window("Flight Reservation").WinComboBox("Fly From:").GetROProperty("text")
flyTo=Window("Flight Reservation").WinComboBox("Fly TO:").GetROProperty("text")
name=Window("Flight Reservation").WinEdit("Name:").GetROProperty("text")

'数据表内的数据
Dim t_dateOfFlight,t_flyFrom,t_FlyTo,t_name
t_dateOfFlight=DataTable("DateOfFlight", dtGlobalSheet)
t_flyFrom=DataTable("FlyFrom", dtGlobalSheet)
t_FlyTo=DataTable("FlyTo", dtGlobalSheet)
t_name=DataTable("Name", dtGlobalSheet)

If (dateOfFlight=t_dateOfFlight and flyFrom=t_flyFrom and flyTo=t_FlyTo and name=t_name) Then
	Reporter.ReportEvent micPass,"比较结果","一致！！！"
else
	Reporter.ReportEvent micPass,"比较结果","不一致！！！"	
End If



 @@ hightlight id_;_20144752_;_script infofile_;_ZIP::ssf1.xml_;_
