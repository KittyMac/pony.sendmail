use "lib:curl"

use @curl_easy_init[CurlRef]()
use @curl_easy_cleanup[None](curl:CurlRef)

use @curl_easy_setopt[CurlErrorCode](curl:CurlRef, option:CurlOptionCode, parameter:USize tag)
use @curl_slist_append[CurlSlistRef](list:CurlSlistRef tag, string:Pointer[U8] tag)
use @curl_slist_free_all[None](list:CurlSlistRef tag)
use @curl_easy_perform[CurlErrorCode](curl:CurlRef)


type CurlRef is Pointer[None]
type CurlSlistRef is Pointer[None]

type CurlOptionCode is U32

primitive CurlOption
  // LONG
  fun port():CurlOptionCode => 0 + 3                      /* Port number to connect to, if other than default. */
  fun timeout():CurlOptionCode => 0 + 13                  /* Time-out the read operation after this amount of seconds */
  fun upload():CurlOptionCode => 0 + 46                   /* this is an upload */
  
  // OBJECTPOINT
  fun url():CurlOptionCode => 10000 + 2
  fun readData():CurlOptionCode => 10000 + 9
  fun mailFrom():CurlOptionCode => 10000 + 186
  fun mailRecipients():CurlOptionCode => 10000 + 187
  
  // FUNCTIONPOINT
  fun readFunction():CurlOptionCode => 20000 + 12

struct PayloadStruct
	var offset:USize
  var len:USize
	let data:Pointer[U8] tag

	new create(len':USize, data':Pointer[U8] tag) =>
		data = data'
    len = len'
    offset = 0
  
  fun ref copyMore(dst:Pointer[None], max:USize):USize =>
    var n = (len - offset).min(max)
    @memcpy[Pointer[None]](dst, data.offset(offset), n)
    offset = offset + n
    n

actor SendMail
  """
  Use libcurl to connect to a SMTP server to send an email. Based on example:
  https://curl.haxx.se/libcurl/c/smtp-mail.html
  """
  let curl:CurlRef
  
	fun @payload_fn(ptr:Pointer[None], size:USize, nmemb:USize, payloadPtr:NullablePointer[PayloadStruct]):USize =>
    if (size == 0) or (nmemb == 0) or ((size*nmemb) < 1) then
      return 0
    end
    try
      return payloadPtr()?.copyMore(ptr, (size*nmemb))
    end
	  0
  
  new create(eml:Eml val)? =>
    var r:CurlErrorCode
    
    curl = @curl_easy_init()
    if curl.is_null() then error end
    
    r = @curl_easy_setopt(curl, CurlOption.url(), eml.smtpAddress.cstring().usize())
    if r != CurlError.ok() then error r end
    
    r = @curl_easy_setopt(curl, CurlOption.mailFrom(), eml.fromAddress.cstring().usize())
    if r != CurlError.ok() then error r end
    
    var recipients = CurlSlistRef
    recipients = @curl_slist_append(recipients, eml.toAddress.cstring())
    r = @curl_easy_setopt(curl, CurlOption.mailRecipients(), recipients.usize())
    if r != CurlError.ok() then error r end
    
    r = @curl_easy_setopt(curl, CurlOption.readFunction(), addressof_usize this.payload_fn)
    if r != CurlError.ok() then error r end
    
    
    let emlString = eml.string()
    var payload = PayloadStruct(emlString.size(), emlString.cstring())
    var payloadPtr = NullablePointer[PayloadStruct](payload)
    r = @curl_easy_setopt(curl, CurlOption.readData(), payloadPtr.usize() )
    
    if r != CurlError.ok() then error r end
    
    r = @curl_easy_setopt(curl, CurlOption.upload(), 1)
    if r != CurlError.ok() then error r end
    
	  r = @curl_easy_perform(curl)
    if r != CurlError.ok() then error r end
    
    @curl_slist_free_all(recipients)
    
    @curl_easy_cleanup(curl)
    