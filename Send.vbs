 On Error Resume Next
 Set objArgs       = WScript.Arguments
 Set objEmail      = CreateObject("CDO.Message")
 objEmail.From     = objArgs(0)
 objEmail.To       = objArgs(1)
 objEmail.Subject  = objArgs(2)
 objEmail.Textbody = objArgs(3)
 with objEmail.Configuration.Fields
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
 objEmail.Send