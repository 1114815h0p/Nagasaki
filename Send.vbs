On Error Resume Next
Set sCDO = CreateObject("CDO.Message")
sCDO.From = WScript.Arguments(0)
sCDO.To = WScript.Arguments(1)
sCDO.Subject = WScript.Arguments(2)
sCDO.Textbody = WScript.Arguments(3)
with sCDO.Configuration.Fields
  .Item ("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2 ' not local, smtp
	.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver") = WScript.Arguments(4)
	.Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 465
	.Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1 ' cdobasic
	.Item ("http://schemas.microsoft.com/cdo/configuration/sendusername") = WScript.Arguments(5)
	.Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword") = WScript.Arguments(6)
	.Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl") = True
	.Item ("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 25
	.Update
end with
sCDO.Send
