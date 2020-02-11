use "lib:curl"

use @curl_easy_init[CurlRef]()
use @curl_easy_cleanup[None](curl:CurlRef tag)

use @curl_easy_setopt[CurlErrorCode](curl:CurlRef tag, option:CurlOptionCode, parameter:USize tag)
use @curl_slist_append[CurlSlistRef](list:CurlSlistRef tag, string:Pointer[U8] tag)
use @curl_slist_free_all[None](list:CurlSlistRef tag)
use @curl_easy_perform[CurlErrorCode](curl:CurlRef tag)

primitive Curl

type CurlRef is Pointer[None]
type CurlSlistRef is Pointer[None]

struct PayloadStruct
	var current_line:USize
	let lines:Array[String] val

	new create(lines':Array[String] val) =>
		lines = lines'
    current_line = 0
  

actor SendMail
  """
  Use libcurl to connect to a SMTP server to send an email. Based on example:
  https://curl.haxx.se/libcurl/c/smtp-mail.html
  """
  let curl:CurlRef
    
	fun @payload_fn(dst:Pointer[None], size:USize, nmemb:USize, payloadPtr:NullablePointer[PayloadStruct]):USize =>
    if (size == 0) or (nmemb == 0) or ((size*nmemb) < 1) then
      return 0
    end
    try
      let payload = payloadPtr()?
      let line = payload.lines(payload.current_line)?
      @memcpy[Pointer[None]](dst, line.cpointer(0), line.size())
      payload.current_line = payload.current_line + 1
      return line.size()
    end
	  0
  
  // TODO: keep the setup on create, move the eml send to a separate behaviour
  new create(eml:Eml val)? =>
    var r:CurlErrorCode
    
    curl = @curl_easy_init()
    if curl.is_null() then error end
    
    if eml.useSSL then
      r = @curl_easy_setopt(curl, CurlOption.use_ssl(), CurlUseSsl.all())
      if r != CurlError.ok() then error r end
    end
    
    if eml.username.size() > 0 then
      r = @curl_easy_setopt(curl, CurlOption.username(), eml.username.cstring().usize())
      if r != CurlError.ok() then error r end
    end
    
    if eml.password.size() > 0 then
      r = @curl_easy_setopt(curl, CurlOption.password(), eml.password.cstring().usize())
      if r != CurlError.ok() then error r end
    end
    
    r = @curl_easy_setopt(curl, CurlOption.url(), eml.smtpAddress.cstring().usize())
    if r != CurlError.ok() then error r end
    
    r = @curl_easy_setopt(curl, CurlOption.mail_from(), eml.fromAddress.cstring().usize())
    if r != CurlError.ok() then error r end
    
    var recipients = CurlSlistRef
    recipients = @curl_slist_append(recipients, eml.toAddress.cstring())
    r = @curl_easy_setopt(curl, CurlOption.mail_rcpt(), recipients.usize())
    if r != CurlError.ok() then error r end
    
    r = @curl_easy_setopt(curl, CurlOption.readfunction(), addressof_usize this.payload_fn)
    if r != CurlError.ok() then error r end
    
    var payload = PayloadStruct(eml.lines())
    var payloadPtr = NullablePointer[PayloadStruct](payload)
    r = @curl_easy_setopt(curl, CurlOption.readdata(), payloadPtr.usize() )
    if r != CurlError.ok() then error r end
    
    r = @curl_easy_setopt(curl, CurlOption.upload(), 1)
    if r != CurlError.ok() then error r end
    
	  r = @curl_easy_perform(curl)
    if r != CurlError.ok() then error r end
    
    @curl_slist_free_all(recipients)
    
    @curl_easy_cleanup(curl)
    