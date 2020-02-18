use "lib:curl"

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
  let curl:_CurlRef
    
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
    var r:U32
    
    curl = @curl_easy_init()
    if curl.is_null() then error end
    
    if eml.useSSL then
      r = @curl_easy_setopt(curl, _CurloptionEnum.use_ssl(), _CurlUsesslEnum.all())
      if r != _CurlcodeEnum.ok() then error r end
    end
    
    if eml.username.size() > 0 then
      r = @curl_easy_setopt(curl, _CurloptionEnum.username(), eml.username.cstring())
      if r != _CurlcodeEnum.ok() then error r end
    end
    
    if eml.password.size() > 0 then
      r = @curl_easy_setopt(curl, _CurloptionEnum.password(), eml.password.cstring())
      if r != _CurlcodeEnum.ok() then error r end
    end
    
    r = @curl_easy_setopt(curl, _CurloptionEnum.url(), eml.smtpAddress.cstring())
    if r != _CurlcodeEnum.ok() then error r end
    
    r = @curl_easy_setopt(curl, _CurloptionEnum.mail_from(), eml.fromAddress.cstring())
    if r != _CurlcodeEnum.ok() then error r end
    
    var recipients = _CurlSlistRef
    recipients = @curl_slist_append(recipients, eml.toAddress.cstring())
    r = @curl_easy_setopt(curl, _CurloptionEnum.mail_rcpt(), recipients)
    if r != _CurlcodeEnum.ok() then error r end
    
    r = @curl_easy_setopt(curl, _CurloptionEnum.readfunction(), addressof_usize this.payload_fn)
    if r != _CurlcodeEnum.ok() then error r end
    
    var payload = PayloadStruct(eml.lines())
    var payloadPtr = NullablePointer[PayloadStruct](payload)
    r = @curl_easy_setopt(curl, _CurloptionEnum.readdata(), payloadPtr )
    if r != _CurlcodeEnum.ok() then error r end
    
    r = @curl_easy_setopt(curl, _CurloptionEnum.upload(), USize(1))
    if r != _CurlcodeEnum.ok() then error r end
    
	  r = @curl_easy_perform(curl)
    if r != _CurlcodeEnum.ok() then error r end
    
    @curl_slist_free_all(recipients)
    
    @curl_easy_cleanup(curl)
    