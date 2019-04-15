'copyright @cokid
'启动
Systemutil.Run("D:\ProgramFiles\UFT\samples\flight\app\flight4a.exe")
'点击help
Dialog("Login").WinButton("Help").Click @@ hightlight id_;_5333560_;_script infofile_;_ZIP::ssf44.xml_;_
'检查
Dialog("Login").Dialog("Flight Reservations").Check CheckPoint("Meshow") @@ hightlight id_;_7691990_;_script infofile_;_ZIP::ssf45.xml_;_
Dialog("Login").Dialog("Flight Reservations").WinButton("确定").Click @@ hightlight id_;_11164748_;_script infofile_;_ZIP::ssf46.xml_;_
 @@ hightlight id_;_1074306_;_script infofile_;_ZIP::ssf51.xml_;_

Dialog("Login").WinEdit("Agent Name").Set "admin" @@ hightlight id_;_9175690_;_script infofile_;_ZIP::ssf41.xml_;_
Dialog("Login").WinEdit("Password").Set "mercury" @@ hightlight id_;_3040102_;_script infofile_;_ZIP::ssf42.xml_;_
Dialog("Login").WinButton("OK").Click @@ hightlight id_;_23158730_;_script infofile_;_ZIP::ssf43.xml_;_
