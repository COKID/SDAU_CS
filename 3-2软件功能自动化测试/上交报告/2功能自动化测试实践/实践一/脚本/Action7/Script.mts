'copyright @cokid
Window("Flight Reservation").ActiveX("MaskEdBox").Click 2,9
Window("Flight Reservation").ActiveX("MaskEdBox").Type "111118"
Window("Flight Reservation").WinComboBox("Fly From:").Select "Denver"
Window("Flight Reservation").WinComboBox("Fly To:").Select "Frankfurt"
Window("Flight Reservation").WinButton("FLIGHT").Click
Window("Flight Reservation").Dialog("Flights Table").WinButton("OK").Click


Window("Flight Reservation").WinEdit("Tickets:").Set RandomNumber(1, 9)
tickets=Window("Flight Reservation").WinEdit("Tickets:").GetROProperty("text")
price=Window("Flight Reservation").WinEdit("Price:").GetROProperty("text")
total=Window("Flight Reservation").WinEdit("Total:").GetROProperty("text")


tickets=cint(tickets)
price=cdbl(mid(price,2))
total=cdbl(mid(total,2))
If tickets*price=total Then
	reporter.ReportEvent micPass,"pass","tickets*price=total"
else
reporter.ReportEvent micPass,"fail","tickets*price!=total"
End If
Window("Flight Reservation").WinEdit("Name:").Set "123"
Window("Flight Reservation").WinButton("Insert Order").Click
wait 10

