use "time"


class Eml is Stringable
  """
  Helper to construct EML text for sending emails
  """
  
  /*
static const char *payload_text[] = {
  "Date: Mon, 29 Nov 2010 21:54:29 +1100\r\n",
  "To: " TO_MAIL "\r\n",
  "From: " FROM_MAIL "\r\n",
  "Cc: " CC_MAIL "\r\n",
  "Message-ID: <dcd7cb36-11db-487a-9f3a-e652a9458efd@"
  "rfcpedant.example.org>\r\n",
  "Subject: SMTP example message\r\n",
  "\r\n",
  "The body of the message starts here.\r\n",
  "\r\n",
  "It could be a lot of lines, could be MIME encoded, whatever.\r\n",
  "Check RFC5322.\r\n",
  NULL
};
*/
  var smtpAddress:String = ""
  
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
  
  fun string(): String iso^ =>
    let eml = recover iso String(1024) end
    
    eml.append("Date: ")
    try eml.append(PosixDate(Time.seconds()).format("%Y-%m-%d %H:%M:%S")?) end
    eml.append("\r\n")
    
    if toAddress.size() > 0 then
      eml.append("To: ")
      eml.append(toAddress)
      eml.append("\r\n")
    end
    
    if fromAddress.size() > 0 then
      eml.append("From: ")
      eml.append(fromAddress)
      eml.append("\r\n")
    end
    
    if ccAddress.size() > 0 then
      eml.append("Cc: ")
      eml.append(ccAddress)
      eml.append("\r\n")
    end
    
    if messageID.size() > 0 then
      eml.append("Message-ID: ")
      eml.append(messageID)
      eml.append("\r\n")
    end
    
    eml.append("Subject: ")
    eml.append(subject)
    eml.append("\r\n")
    
    eml.append("\r\n")
    eml.append(body)
    eml.append("\r\n")
    
    consume eml
