use "time"
use "stringext"

class Eml
  """
  Helper to construct EML text for sending emails
  """
  var smtpAddress:String = ""
  
  var useSSL:Bool = false
  var username:String = ""
  var password:String = ""
  
  var toAddress:String = ""
  var fromAddress:String = ""
  var ccAddress:String = ""
  
  var messageID:String = ""
  
  var subject:String = ""
  var body:String = ""
  
  fun clone(): Eml iso^ =>
    let other = recover iso Eml end
    other.smtpAddress = smtpAddress
    other.toAddress = toAddress
    other.fromAddress = fromAddress
    other.ccAddress = ccAddress
    other.messageID = messageID
    other.subject = subject
    other.body = body
    consume other
  
  fun lines(): Array[String] iso^ =>
    let arr = recover iso Array[String](1024) end
    
    try
      arr.push(StringExt.format("Date: %s\r\n", PosixDate(Time.seconds()).format("%Y-%m-%d %H:%M:%S")?))
    end
    
    if toAddress.size() > 0 then
      arr.push(StringExt.format("To: %s\r\n", toAddress))
    end
    
    if fromAddress.size() > 0 then
      arr.push(StringExt.format("From: %s\r\n", fromAddress))
    end
    
    if ccAddress.size() > 0 then
      arr.push(StringExt.format("Cc: %s\r\n", ccAddress))
    end
    
    if messageID.size() > 0 then
      arr.push(StringExt.format("Message-ID: %s\r\n", messageID))
    end
    
    arr.push(StringExt.format("Subject: %s\r\n", subject))
    
    arr.push("\r\n")    
    arr.push(body); arr.push("\r\n")
    arr.push("\r\n")
    
    consume arr
