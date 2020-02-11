type CurlOptionCode is U32

primitive CurlUseSsl
  fun none():USize => 0    /* do not attempt to use ssl */
  fun attempt():USize => 1     /* try using ssl, proceed anyway otherwise */
  fun control():USize => 2 /* ssl for the control connection or fail */
  fun all():USize => 3     /* ssl for all communication or fail */
  fun last():USize => 4     /* not an option, never use */

primitive CurlOption
  /* this is the file * or void * the regular output should be written to. */
  fun file():CurlOptionCode => 10000 + 1
  fun writedata():CurlOptionCode => 10000 + 1

  /* the full url to get/put */
  fun url():CurlOptionCode => 10000 + 2

  /* port number to connect to, if other than default. */
  fun port():CurlOptionCode => 0 + 3

  /* name of proxy to use. */
  fun proxy():CurlOptionCode => 10000 + 4

  /* "name:password" to use when fetching. */
  fun userpwd():CurlOptionCode => 10000 + 5

  /* "name:password" to use with proxy. */
  fun proxyuserpwd():CurlOptionCode => 10000 + 6

  /* range to get, specified as an ascii string. */
  fun range():CurlOptionCode => 10000 + 7

  /* not used */

  /* specified file stream to upload from (use as input): */
  fun infile():CurlOptionCode => 10000 + 9
  fun readdata():CurlOptionCode => 10000 + 9

  /* buffer to receive error messages in, must be at least curl_error_size
   * bytes big. if this is not used, error messages go to stderr instead: */
  fun errorbuffer():CurlOptionCode => 10000 + 10

  /* function that will be called to store the output (instead of fwrite). the
   * parameters will use fwrite() syntax, make sure to follow them. */
  fun writefunction():CurlOptionCode => 20000 + 11

  /* function that will be called to read the input (instead of fread). the
   * parameters will use fread() syntax, make sure to follow them. */
  fun readfunction():CurlOptionCode => 20000 + 12

  /* time-out the read operation after this amount of seconds */
  fun timeout():CurlOptionCode => 0 + 13

  /* if the curlopt_infile is used, this can be used to inform libcurl about
   * how large the file being sent really is. that allows better error
   * checking and better verifies that the upload was successful. -1 means
   * unknown size.
   *
   * for large file support, there is also a _large version of the key
   * which takes an off_t type, allowing platforms with larger off_t
   * sizes to handle larger files.  see below for infilesize_large.
   */
  fun infilesize():CurlOptionCode => 0 + 14

  /* post static input fields. */
  fun postfields():CurlOptionCode => 10000 + 15

  /* set the referrer page (needed by some cgis) */
  fun referer():CurlOptionCode => 10000 + 16

  /* set the ftp port string (interface name, named or numerical ip address)
     use i.e '-' to use default address. */
  fun ftpport():CurlOptionCode => 10000 + 17

  /* set the user-agent string (examined by some cgis) */
  fun useragent():CurlOptionCode => 10000 + 18

  /* if the download receives less than "low speed limit" bytes/second
   * during "low speed time" seconds, the operations is aborted.
   * you could i.e if you have a pretty high speed connection, abort if
   * it is less than 2000 bytes/sec during 20 seconds.
   */

  /* set the "low speed limit" */
  fun low_speed_limit():CurlOptionCode => 0 + 19

  /* set the "low speed time" */
  fun low_speed_time():CurlOptionCode => 0 + 20

  /* set the continuation offset.
   *
   * note there is also a _large version of this key which uses
   * off_t types, allowing for large file offsets on platforms which
   * use larger-than-32-bit off_t's.  look below for resume_from_large.
   */
  fun resume_from():CurlOptionCode => 0 + 21

  /* set cookie in request: */
  fun cookie():CurlOptionCode => 10000 + 22

  /* this points to a linked list of headers, struct curl_slist kind */
  fun httpheader():CurlOptionCode => 10000 + 23
  fun rtspheader():CurlOptionCode => 10000 + 23

  /* this points to a linked list of post entries, struct curl_httppost */
  fun httppost():CurlOptionCode => 10000 + 24

  /* name of the file keeping your private ssl-certificate */
  fun sslcert():CurlOptionCode => 10000 + 25

  /* password for the ssl or ssh private key */
  fun keypasswd():CurlOptionCode => 10000 + 26

  /* send type parameter? */
  fun crlf():CurlOptionCode => 0 + 27

  /* send linked-list of quote commands */
  fun quote():CurlOptionCode => 10000 + 28

  /* send file * or void * to store headers to, if you use a callback it
     is simply passed to the callback unmodified */
  fun writeheader():CurlOptionCode => 10000 + 29
  fun headerdata():CurlOptionCode => 10000 + 29

  /* point to a file to read the initial cookies from, also enables
     "cookie awareness" */
  fun cookiefile():CurlOptionCode => 10000 + 31

  /* what version to specifically try to use.
     see curl_sslversion defines below. */
  fun sslversion():CurlOptionCode => 0 + 32

  /* what kind of http time condition to use, see defines */
  fun timecondition():CurlOptionCode => 0 + 33

  /* time to use with the above condition. specified in number of seconds
     since 1 jan 1970 */
  fun timevalue():CurlOptionCode => 0 + 34

  /* 35 = obsolete */

  /* custom request, for customizing the get command like
     http: delete, trace and others
     ftp: to use a different list command
     */
  fun customrequest():CurlOptionCode => 10000 + 36

  /* http request, for odd commands like delete, trace and others */
  fun stderr():CurlOptionCode => 10000 + 37

  /* 38 is not used */

  /* send linked-list of post-transfer quote commands */
  fun postquote():CurlOptionCode => 10000 + 39

  fun writeinfo():CurlOptionCode => 10000 + 40 /* deprecated, do not use! */

  fun verbose():CurlOptionCode => 0 + 41      /* talk a lot */
  fun header():CurlOptionCode => 0 + 42       /* throw the header out too */
  fun noprogress():CurlOptionCode => 0 + 43   /* shut off the progress meter */
  fun nobody():CurlOptionCode => 0 + 44       /* use head to get http document */
  fun failonerror():CurlOptionCode => 0 + 45  /* no output on http error codes >= 300 */
  fun upload():CurlOptionCode => 0 + 46       /* this is an upload */
  fun post():CurlOptionCode => 0 + 47         /* http post method */
  fun dirlistonly():CurlOptionCode => 0 + 48  /* bare names when listing directories */

  fun append():CurlOptionCode => 0 + 50       /* append instead of overwrite on upload! */

  /* specify whether to read the user+password from the .netrc or the url.
   * this must be one of the curl_netrc_* enums below. */
  fun netrc():CurlOptionCode => 0 + 51

  fun followlocation():CurlOptionCode => 0 + 52  /* use location: luke! */

  fun transfertext():CurlOptionCode => 0 + 53 /* transfer data in text/ascii format */
  fun put():CurlOptionCode => 0 + 54          /* http put */

  /* 55 = obsolete */

  /* function that will be called instead of the internal progress display
   * function. this function should be defined as the curl_progress_callback
   * prototype defines. */
  fun progressfunction():CurlOptionCode => 20000 + 56

  /* data passed to the progress callback */
  fun progressdata():CurlOptionCode => 10000 + 57

  /* we want the referrer field set automatically when following locations */
  fun autoreferer():CurlOptionCode => 0 + 58

  /* port of the proxy, can be set in the proxy string as well with:
     "[host]:[port]" */
  fun proxyport():CurlOptionCode => 0 + 59

  /* size of the post input data, if strlen() is not good to use */
  fun postfieldsize():CurlOptionCode => 0 + 60

  /* tunnel non-http operations through a http proxy */
  fun httpproxytunnel():CurlOptionCode => 0 + 61

  /* set the interface string to use as outgoing network interface */
  fun net_interface():CurlOptionCode => 10000 + 62

  /* set the krb4/5 security level, this also enables krb4/5 awareness.  this
   * is a string, 'clear', 'safe', 'confidential' or 'private'.  if the string
   * is set but doesn't match one of these, 'private' will be used.  */
  fun krblevel():CurlOptionCode => 10000 + 63

  /* set if we should verify the peer in ssl handshake, set 1 to verify. */
  fun ssl_verifypeer():CurlOptionCode => 0 + 64

  /* the capath or cafile used to validate the peer certificate
     this option is used only if ssl_verifypeer is true */
  fun cainfo():CurlOptionCode => 10000 + 65

  /* 66 = obsolete */
  /* 67 = obsolete */

  /* maximum number of http redirects to follow */
  fun maxredirs():CurlOptionCode => 0 + 68

  /* pass a long set to 1 to get the date of the requested document (if
     possible)! pass a zero to shut it off. */
  fun filetime():CurlOptionCode => 0 + 69

  /* this points to a linked list of telnet options */
  fun telnetoptions():CurlOptionCode => 10000 + 70

  /* max amount of cached alive connections */
  fun maxconnects():CurlOptionCode => 0 + 71

  fun closepolicy():CurlOptionCode => 0 + 72 /* deprecated, do not use! */

  /* 73 = obsolete */

  /* set to explicitly use a new connection for the upcoming transfer.
     do not use this unless you're absolutely sure of this, as it makes the
     operation slower and is less friendly for the network. */
  fun fresh_connect():CurlOptionCode => 0 + 74

  /* set to explicitly forbid the upcoming transfer's connection to be re-used
     when done. do not use this unless you're absolutely sure of this, as it
     makes the operation slower and is less friendly for the network. */
  fun forbid_reuse():CurlOptionCode => 0 + 75

  /* set to a file name that contains random data for libcurl to use to
     seed the random engine when doing ssl connects. */
  fun random_file():CurlOptionCode => 10000 + 76

  /* set to the entropy gathering daemon socket pathname */
  fun egdsocket():CurlOptionCode => 10000 + 77

  /* time-out connect operations after this amount of seconds, if connects
     are ok within this time, then fine... this only aborts the connect
     phase. [only works on unix-style/sigalrm operating systems] */
  fun connecttimeout():CurlOptionCode => 0 + 78

  /* function that will be called to store headers (instead of fwrite). the
   * parameters will use fwrite() syntax, make sure to follow them. */
  fun headerfunction():CurlOptionCode => 20000 + 79

  /* set this to force the http request to get back to get. only really usable
     if post, put or a custom request have been used first.
   */
  fun httpget():CurlOptionCode => 0 + 80

  /* set if we should verify the common name from the peer certificate in ssl
   * handshake, set 1 to check existence, 2 to ensure that it matches the
   * provided hostname. */
  fun ssl_verifyhost():CurlOptionCode => 0 + 81

  /* specify which file name to write all known cookies in after completed
     operation. set file name to "-" (dash) to make it go to stdout. */
  fun cookiejar():CurlOptionCode => 10000 + 82

  /* specify which ssl ciphers to use */
  fun ssl_cipher_list():CurlOptionCode => 10000 + 83

  /* specify which http version to use! this must be set to one of the
     curl_http_version* enums set below. */
  fun http_version():CurlOptionCode => 0 + 84

  /* specifically switch on or off the ftp engine's use of the epsv command. by
     default, that one will always be attempted before the more traditional
     pasv command. */
  fun ftp_use_epsv():CurlOptionCode => 0 + 85

  /* type of the file keeping your ssl-certificate ("der", "pem", "eng") */
  fun sslcerttype():CurlOptionCode => 10000 + 86

  /* name of the file keeping your private ssl-key */
  fun sslkey():CurlOptionCode => 10000 + 87

  /* type of the file keeping your private ssl-key ("der", "pem", "eng") */
  fun sslkeytype():CurlOptionCode => 10000 + 88

  /* crypto engine for the ssl-sub system */
  fun sslengine():CurlOptionCode => 10000 + 89

  /* set the crypto engine for the ssl-sub system as default
     the param has no meaning...
   */
  fun sslengine_default():CurlOptionCode => 0 + 90

  /* non-zero value means to use the global dns cache */
  fun dns_use_global_cache():CurlOptionCode => 0 + 91 /* deprecated, do not use! */

  /* dns cache timeout */
  fun dns_cache_timeout():CurlOptionCode => 0 + 92

  /* send linked-list of pre-transfer quote commands */
  fun prequote():CurlOptionCode => 10000 + 93

  /* set the debug function */
  fun debugfunction():CurlOptionCode => 20000 + 94

  /* set the data for the debug function */
  fun debugdata():CurlOptionCode => 10000 + 95

  /* mark this as start of a cookie session */
  fun cookiesession():CurlOptionCode => 0 + 96

  /* the capath directory used to validate the peer certificate
     this option is used only if ssl_verifypeer is true */
  fun capath():CurlOptionCode => 10000 + 97

  /* instruct libcurl to use a smaller receive buffer */
  fun buffersize():CurlOptionCode => 0 + 98

  /* instruct libcurl to not use any signal/alarm handlers, even when using
     timeouts. this option is useful for multi-threaded applications.
     see libcurl-the-guide for more background information. */
  fun nosignal():CurlOptionCode => 0 + 99

  /* provide a curlshare for mutexing non-ts data */
  fun share():CurlOptionCode => 10000 + 100

  /* indicates type of proxy. accepted values are curlproxy_http (default
     curlproxy_socks4, curlproxy_socks4a and curlproxy_socks5. */
  fun proxytype():CurlOptionCode => 0 + 101

  /* set the accept-encoding string. use this to tell a server you would like
     the response to be compressed. before 7.21.6, this was known as
     curlopt_encoding */
  fun accept_encoding():CurlOptionCode => 10000 + 102

  /* set pointer to private data */
  fun private():CurlOptionCode => 10000 + 103

  /* set aliases for http 200 in the http response header */
  fun http200aliases():CurlOptionCode => 10000 + 104

  /* continue to send authentication (user+password) when following locations,
     even when hostname changed. this can potentially send off the name
     and password to whatever host the server decides. */
  fun unrestricted_auth():CurlOptionCode => 0 + 105

  /* specifically switch on or off the ftp engine's use of the eprt command (
     it also disables the lprt attempt). by default, those ones will always be
     attempted before the good old traditional port command. */
  fun ftp_use_eprt():CurlOptionCode => 0 + 106

  /* set this to a bitmask value to enable the particular authentications
     methods you like. use this in combination with curlopt_userpwd.
     note that setting multiple bits may cause extra network round-trips. */
  fun httpauth():CurlOptionCode => 0 + 107

  /* set the ssl context callback function, currently only for openssl ssl_ctx
     in second argument. the function must be matching the
     curl_ssl_ctx_callback proto. */
  fun ssl_ctx_function():CurlOptionCode => 20000 + 108

  /* set the userdata for the ssl context callback function's third
     argument */
  fun ssl_ctx_data():CurlOptionCode => 10000 + 109

  /* ftp option that causes missing dirs to be created on the remote server.
     in 7.19.4 we introduced the convenience enums for this option using the
     curlftp_create_dir prefix.
  */
  fun ftp_create_missing_dirs():CurlOptionCode => 0 + 110

  /* set this to a bitmask value to enable the particular authentications
     methods you like. use this in combination with curlopt_proxyuserpwd.
     note that setting multiple bits may cause extra network round-trips. */
  fun proxyauth():CurlOptionCode => 0 + 111

  /* ftp option that changes the timeout, in seconds, associated with
     getting a response.  this is different from transfer timeout time and
     essentially places a demand on the ftp server to acknowledge commands
     in a timely manner. */
  fun ftp_response_timeout():CurlOptionCode => 0 + 112

  /* set this option to one of the curl_ipresolve_* defines (see below) to
     tell libcurl to resolve names to those ip versions only. this only has
     affect on systems with support for more than one, i.e ipv4 _and_ ipv6. */
  fun ipresolve():CurlOptionCode => 0 + 113

  /* set this option to limit the size of a file that will be downloaded from
     an http or ftp server.

     note there is also _large version which adds large file support for
     platforms which have larger off_t sizes.  see maxfilesize_large below. */
  fun maxfilesize():CurlOptionCode => 0 + 114

  /* see the comment for infilesize above, but in short, specifies
   * the size of the file being uploaded.  -1 means unknown.
   */
  fun infilesize_large():CurlOptionCode => 30000 + 115

  /* sets the continuation offset.  there is also a long version of this;
   * look above for resume_from.
   */
  fun resume_from_large():CurlOptionCode => 30000 + 116

  /* sets the maximum size of data that will be downloaded from
   * an http or ftp server.  see maxfilesize above for the long version.
   */
  fun maxfilesize_large():CurlOptionCode => 30000 + 117

  /* set this option to the file name of your .netrc file you want libcurl
     to parse (using the curlopt_netrc option). if not set, libcurl will do
     a poor attempt to find the user's home directory and check for a .netrc
     file in there. */
  fun netrc_file():CurlOptionCode => 10000 + 118

  /* enable ssl/tls for ftp, pick one of:
     curlftpssl_try     - try using ssl, proceed anyway otherwise
     curlftpssl_control - ssl for the control connection or fail
     curlftpssl_all     - ssl for all communication or fail
  */
  fun use_ssl():CurlOptionCode => 0 + 119

  /* the _large version of the standard postfieldsize option */
  fun postfieldsize_large():CurlOptionCode => 30000 + 120

  /* enable/disable the tcp nagle algorithm */
  fun tcp_nodelay():CurlOptionCode => 0 + 121

  /* 122 obsolete, used in 7.12.3. gone in 7.13.0 */
  /* 123 obsolete. gone in 7.16.0 */
  /* 124 obsolete, used in 7.12.3. gone in 7.13.0 */
  /* 125 obsolete, used in 7.12.3. gone in 7.13.0 */
  /* 126 obsolete, used in 7.12.3. gone in 7.13.0 */
  /* 127 obsolete. gone in 7.16.0 */
  /* 128 obsolete. gone in 7.16.0 */

  /* when ftp over ssl/tls is selected (with curlopt_use_ssl this option
     can be used to change libcurl's default action which is to first try
     "auth ssl" and then "auth tls" in this order, and proceed when a ok
     response has been received.

     available parameters are:
     curlftpauth_default - let libcurl decide
     curlftpauth_ssl     - try "auth ssl" first, then tls
     curlftpauth_tls     - try "auth tls" first, then ssl
  */
  fun ftpsslauth():CurlOptionCode => 0 + 129

  fun ioctlfunction():CurlOptionCode => 20000 + 130
  fun ioctldata():CurlOptionCode => 10000 + 131

  /* 132 obsolete. gone in 7.16.0 */
  /* 133 obsolete. gone in 7.16.0 */

  /* zero terminated string for pass on to the ftp server when asked for
     "account" info */
  fun ftp_account():CurlOptionCode => 10000 + 134

  /* feed cookies into cookie engine */
  fun cookielist():CurlOptionCode => 10000 + 135

  /* ignore content-length */
  fun ignore_content_length():CurlOptionCode => 0 + 136

  /* set to non-zero to skip the ip address received in a 227 pasv ftp server
     response. typically used for ftp-ssl purposes but is not restricted to
     that. libcurl will then instead use the same ip address it used for the
     control connection. */
  fun ftp_skip_pasv_ip():CurlOptionCode => 0 + 137

  /* select "file method" to use when doing ftp, see the curl_ftpmethod
     above. */
  fun ftp_filemethod():CurlOptionCode => 0 + 138

  /* local port number to bind the socket to */
  fun localport():CurlOptionCode => 0 + 139

  /* number of ports to try, including the first one set with localport.
     thus, setting it to 1 will make no additional attempts but the first.
  */
  fun localportrange():CurlOptionCode => 0 + 140

  /* no transfer, set up connection and let application use the socket by
     extracting it with curlinfo_lastsocket */
  fun connect_only():CurlOptionCode => 0 + 141

  /* function that will be called to convert from the
     network encoding (instead of using the iconv calls in libcurl) */
  fun conv_from_network_function():CurlOptionCode => 20000 + 142

  /* function that will be called to convert to the
     network encoding (instead of using the iconv calls in libcurl) */
  fun conv_to_network_function():CurlOptionCode => 20000 + 143

  /* function that will be called to convert from utf8
     (instead of using the iconv calls in libcurl)
     note that this is used only for ssl certificate processing */
  fun conv_from_utf8_function():CurlOptionCode => 20000 + 144

  /* if the connection proceeds too quickly then need to slow it down */
  /* limit-rate: maximum number of bytes per second to send or receive */
  fun max_send_speed_large():CurlOptionCode => 30000 + 145
  fun max_recv_speed_large():CurlOptionCode => 30000 + 146

  /* pointer to command string to send if user/pass fails. */
  fun ftp_alternative_to_user():CurlOptionCode => 10000 + 147

  /* callback function for setting socket options */
  fun sockoptfunction():CurlOptionCode => 20000 + 148
  fun sockoptdata():CurlOptionCode => 10000 + 149

  /* set to 0 to disable session id re-use for this transfer, default is
     enabled (== 1) */
  fun ssl_sessionid_cache():CurlOptionCode => 0 + 150

  /* allowed ssh authentication methods */
  fun ssh_auth_types():CurlOptionCode => 0 + 151

  /* used by scp/sftp to do public/private key authentication */
  fun ssh_public_keyfile():CurlOptionCode => 10000 + 152
  fun ssh_private_keyfile():CurlOptionCode => 10000 + 153

  /* send ccc (clear command channel) after authentication */
  fun ftp_ssl_ccc():CurlOptionCode => 0 + 154

  /* same as timeout and connecttimeout, but with ms resolution */
  fun timeout_ms():CurlOptionCode => 0 + 155
  fun connecttimeout_ms():CurlOptionCode => 0 + 156

  /* set to zero to disable the libcurl's decoding and thus pass the raw body
     data to the application even when it is encoded/compressed */
  fun http_transfer_decoding():CurlOptionCode => 0 + 157
  fun http_content_decoding():CurlOptionCode => 0 + 158

  /* permission used when creating new files and directories on the remote
     server for protocols that support it, sftp/scp/file */
  fun new_file_perms():CurlOptionCode => 0 + 159
  fun new_directory_perms():CurlOptionCode => 0 + 160

  /* set the behaviour of post when redirecting. values must be set to one
     of curl_redir* defines below. this used to be called curlopt_post301 */
  fun postredir():CurlOptionCode => 0 + 161

  /* used by scp/sftp to verify the host's public key */
  fun ssh_host_public_key_md5():CurlOptionCode => 10000 + 162

  /* callback function for opening socket (instead of socket(2)). optionally,
     callback is able change the address or refuse to connect returning
     curl_socket_bad.  the callback should have type
     curl_opensocket_callback */
  fun opensocketfunction():CurlOptionCode => 20000 + 163
  fun opensocketdata():CurlOptionCode => 10000 + 164

  /* post volatile input fields. */
  fun copypostfields():CurlOptionCode => 10000 + 165

  /* set transfer mode (;type=<a|i>) when doing ftp via an http proxy */
  fun proxy_transfer_mode():CurlOptionCode => 0 + 166

  /* callback function for seeking in the input stream */
  fun seekfunction():CurlOptionCode => 20000 + 167
  fun seekdata():CurlOptionCode => 10000 + 168

  /* crl file */
  fun crlfile():CurlOptionCode => 10000 + 169

  /* issuer certificate */
  fun issuercert():CurlOptionCode => 10000 + 170

  /* (ipv6) address scope */
  fun address_scope():CurlOptionCode => 0 + 171

  /* collect certificate chain info and allow it to get retrievable with
     curlinfo_certinfo after the transfer is complete. (unfortunately) only
     working with openssl-powered builds. */
  fun certinfo():CurlOptionCode => 0 + 172

  /* "name" and "pwd" to use when fetching. */
  fun username():CurlOptionCode => 10000 + 173
  fun password():CurlOptionCode => 10000 + 174

    /* "name" and "pwd" to use with proxy when fetching. */
  fun proxyusername():CurlOptionCode => 10000 + 175
  fun proxypassword():CurlOptionCode => 10000 + 176

  /* comma separated list of hostnames defining no-proxy zones. these should
     match both hostnames directly, and hostnames within a domain. for
     example, local.com will match local.com and www.local.com, but not
     notlocal.com or www.notlocal.com. for compatibility with other
     implementations of this, .local.com will be considered to be the same as
     local.com. a single * is the only valid wildcard, and effectively
     disables the use of proxy. */
  fun noproxy():CurlOptionCode => 10000 + 177

  /* block size for tftp transfers */
  fun tftp_blksize():CurlOptionCode => 0 + 178

  /* socks service */
  fun socks5_gssapi_service():CurlOptionCode => 10000 + 179

  /* socks service */
  fun socks5_gssapi_nec():CurlOptionCode => 0 + 180

  /* set the bitmask for the protocols that are allowed to be used for the
     transfer, which thus helps the app which takes urls from users or other
     external inputs and want to restrict what protocol(s) to deal
     with. defaults to curlproto_all. */
  fun protocols():CurlOptionCode => 0 + 181

  /* set the bitmask for the protocols that libcurl is allowed to follow to,
     as a subset of the curlopt_protocols ones. that means the protocol needs
     to be set in both bitmasks to be allowed to get redirected to. defaults
     to all protocols except file and scp. */
  fun redir_protocols():CurlOptionCode => 0 + 182

  /* set the ssh knownhost file name to use */
  fun ssh_knownhosts():CurlOptionCode => 10000 + 183

  /* set the ssh host key callback, must point to a curl_sshkeycallback
     function */
  fun ssh_keyfunction():CurlOptionCode => 20000 + 184

  /* set the ssh host key callback custom pointer */
  fun ssh_keydata():CurlOptionCode => 10000 + 185

  /* set the smtp mail originator */
  fun mail_from():CurlOptionCode => 10000 + 186

  /* set the smtp mail receiver(s) */
  fun mail_rcpt():CurlOptionCode => 10000 + 187

  /* ftp: send pret before pasv */
  fun ftp_use_pret():CurlOptionCode => 0 + 188

  /* rtsp request method (options, setup, play, etc...) */
  fun rtsp_request():CurlOptionCode => 0 + 189

  /* the rtsp session identifier */
  fun rtsp_session_id():CurlOptionCode => 10000 + 190

  /* the rtsp stream uri */
  fun rtsp_stream_uri():CurlOptionCode => 10000 + 191

  /* the transport: header to use in rtsp requests */
  fun rtsp_transport():CurlOptionCode => 10000 + 192

  /* manually initialize the client rtsp cseq for this handle */
  fun rtsp_client_cseq():CurlOptionCode => 0 + 193

  /* manually initialize the server rtsp cseq for this handle */
  fun rtsp_server_cseq():CurlOptionCode => 0 + 194

  /* the stream to pass to interleavefunction. */
  fun interleavedata():CurlOptionCode => 10000 + 195

  /* let the application define a custom write method for rtp data */
  fun interleavefunction():CurlOptionCode => 20000 + 196

  /* turn on wildcard matching */
  fun wildcardmatch():CurlOptionCode => 0 + 197

  /* directory matching callback called before downloading of an
     individual file (chunk) started */
  fun chunk_bgn_function():CurlOptionCode => 20000 + 198

  /* directory matching callback called after the file (chunk)
     was downloaded, or skipped */
  fun chunk_end_function():CurlOptionCode => 20000 + 199

  /* change match (fnmatch-like) callback for wildcard matching */
  fun fnmatch_function():CurlOptionCode => 20000 + 200

  /* let the application define custom chunk data pointer */
  fun chunk_data():CurlOptionCode => 10000 + 201

  /* fnmatch_function user pointer */
  fun fnmatch_data():CurlOptionCode => 10000 + 202

  /* send linked-list of name:port:address sets */
  fun resolve():CurlOptionCode => 10000 + 203

  /* set a username for authenticated tls */
  fun tlsauth_username():CurlOptionCode => 10000 + 204

  /* set a password for authenticated tls */
  fun tlsauth_password():CurlOptionCode => 10000 + 205

  /* set authentication type for authenticated tls */
  fun tlsauth_type():CurlOptionCode => 10000 + 206

  /* set to 1 to enable the "te:" header in http requests to ask for
     compressed transfer-encoded responses. set to 0 to disable the use of te:
     in outgoing requests. the current default is 0, but it might change in a
     future libcurl release.

     libcurl will ask for the compressed methods it knows of, and if that
     isn't any, it will not ask for transfer-encoding at all even if this
     option is set to 1.

  */
  fun transfer_encoding():CurlOptionCode => 0 + 207

  /* callback function for closing socket (instead of close(2)). the callback
     should have type curl_closesocket_callback */
  fun closesocketfunction():CurlOptionCode => 20000 + 208
  fun closesocketdata():CurlOptionCode => 10000 + 209

  /* allow gssapi credential delegation */
  fun gssapi_delegation():CurlOptionCode => 0 + 210

  /* set the name servers to use for dns resolution */
  fun dns_servers():CurlOptionCode => 10000 + 211

  /* time-out accept operations (currently for ftp only) after this amount
     of miliseconds. */
  fun accepttimeout_ms():CurlOptionCode => 0 + 212

  /* set tcp keepalive */
  fun tcp_keepalive():CurlOptionCode => 0 + 213

  /* non-universal keepalive knobs (linux, aix, hp-ux, more) */
  fun tcp_keepidle():CurlOptionCode => 0 + 214
  fun tcp_keepintvl():CurlOptionCode => 0 + 215

  /* enable/disable specific ssl features with a bitmask, see curlsslopt_* */
  fun ssl_options():CurlOptionCode => 0 + 216

  /* set the smtp auth originator */
  fun mail_auth():CurlOptionCode => 10000 + 217

