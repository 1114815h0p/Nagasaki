On Error Resume Next
CreateObject("CDO.Message").From     = WScript.Arguments(0)
CreateObject("CDO.Message").To       = WScript.Arguments(1)
CreateObject("CDO.Message").Subject  = WScript.Arguments(2)
CreateObject("CDO.Message").Textbody = WScript.Arguments(3)
with CreateObject("CDO.Message").Configuration.Fields
  .Item ("http://schemas.microsoft.com/cdo/configuration/sendusing")        = 2 ' not local, smtp
  .Item ("http://schemas.microsoft.com/cdo/configuration/smtpserver")       = objArgs(4)
  .Item ("http://schemas.microsoft.com/cdo/configuration/smtpserverport")   = 465
  .Item ("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1 ' cdobasic
  .Item ("http://schemas.microsoft.com/cdo/configuration/sendusername")     = objArgs(5)
  .Item ("http://schemas.microsoft.com/cdo/configuration/sendpassword")     = objArgs(6)
  .Item ("http://schemas.microsoft.com/cdo/configuration/smtpusessl")       = True
  .Item ("http://schemas.microsoft.com/cdo/configuration/smtpconnectiontimeout") = 25
  .Update
end with
CreateObject("CDO.Message").Send
