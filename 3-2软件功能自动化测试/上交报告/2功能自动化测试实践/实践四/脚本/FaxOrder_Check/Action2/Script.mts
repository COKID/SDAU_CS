'声明变量
Dim  datestr,flyFrom,flyTo,name

Window("Flight Reservation").ActiveX("MaskEdBox").Type DataTable("Date", dtGlobalSheet) @@ hightlight id_;_5461944_;_script infofile_;_ZIP::ssf3.xml_;_

Window("Flight Reservation").WinComboBox("Fly From:").Select DataTable("FlyFrom", dtGlobalSheet) @@ hightlight id_;_10486202_;_script infofile_;_ZIP::ssf4.xml_;_
Window("Flight Reservation").WinComboBox("Fly To:").Select DataTable("FlyTo", dtGlobalSheet) @@ hightlight id_;_27088924_;_script infofile_;_ZIP::ssf5.xml_;_
'---------------------------------------------------------------------------------------


Window("Flight Reservation").WinButton("FLIGHT").Click @@ hightlight id_;_12539388_;_script infofile_;_ZIP::ssf6.xml_;_
Window("Flight Reservation").Dialog("Flights Table").WinButton("OK").Click @@ hightlight id_;_11231180_;_script infofile_;_ZIP::ssf7.xml_;_

Window("Flight Reservation").WinEdit("Name:").Set DataTable("Name", dtGlobalSheet) @@ hightlight id_;_10224270_;_script infofile_;_ZIP::ssf8.xml_;_
'---------------------------------------------------------------------------------------

Window("Flight Reservation").WinEdit("Tickets:").SetSelection 0,1 @@ hightlight id_;_10771088_;_script infofile_;_ZIP::ssf9.xml_;_

Window("Flight Reservation").WinEdit("Tickets:").Set DataTable("Tickets", dtGlobalSheet) @@ hightlight id_;_10771088_;_script infofile_;_ZIP::ssf10.xml_;_
'---------------------------------------------------------------------------------------

Window("Flight Reservation").WinButton("Insert Order").Click @@ hightlight id_;_12648874_;_script infofile_;_ZIP::ssf11.xml_;_



wait 10
'获取订单号,写入数据库中
datatable.Value("orderNo","Global")=Window("Flight Reservation").WinEdit("Order No:").GetROProperty("text")

