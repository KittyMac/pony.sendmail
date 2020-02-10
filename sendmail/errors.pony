type CurlErrorCode is U32

primitive CurlError
  fun ok():CurlErrorCode => 0
  fun unsupported_protocol():CurlErrorCode => 1    /* 1 */
  fun failed_init():CurlErrorCode => 2             /* 2 */
  fun url_malformat():CurlErrorCode => 3           /* 3 */
  fun not_built_in():CurlErrorCode => 4            /* 4 */

  fun couldnt_resolve_proxy():CurlErrorCode => 5   /* 5 */
  fun couldnt_resolve_host():CurlErrorCode => 6    /* 6 */
  fun couldnt_connect():CurlErrorCode => 7         /* 7 */
  fun ftp_weird_server_reply():CurlErrorCode => 8  /* 8 */
  fun remote_access_denied():CurlErrorCode => 9    /* 9 */

  fun ftp_accept_failed():CurlErrorCode => 10       /* 10 */

  fun ftp_weird_pass_reply():CurlErrorCode => 11   /* 11 */
  fun ftp_accept_timeout():CurlErrorCode => 12     /* 12 */

  fun ftp_weird_pasv_reply():CurlErrorCode => 13   /* 13 */
  fun ftp_weird_227_format():CurlErrorCode => 14   /* 14 */
  fun ftp_cant_get_host():CurlErrorCode => 15      /* 15 */
  fun obsolete16():CurlErrorCode => 16             /* 16 - not used */
  fun ftp_couldnt_set_type():CurlErrorCode => 17    /* 17 */
  fun partial_file():CurlErrorCode => 18            /* 18 */
  fun ftp_couldnt_retr_file():CurlErrorCode => 19   /* 19 */
  fun obsolete20():CurlErrorCode => 20              /* 20 - not used */
  fun quote_error():CurlErrorCode => 21            /* 21 - quote command failure */
  fun http_returned_error():CurlErrorCode => 22     /* 22 */
  fun write_error():CurlErrorCode => 23             /* 23 */
  fun obsolete24():CurlErrorCode => 24              /* 24 - not used */
  fun upload_failed():CurlErrorCode => 25          /* 25 - failed upload "command" */
  fun read_error():CurlErrorCode => 26             /* 26 - couldn't open/read from file */
  fun out_of_memory():CurlErrorCode => 27          /* 27 */

  fun operation_timedout():CurlErrorCode => 28     /* 28 - the timeout time was reached */
  fun obsolete29():CurlErrorCode => 29              /* 29 - not used */
  fun ftp_port_failed():CurlErrorCode => 30         /* 30 - ftp port operation failed */
  fun ftp_couldnt_use_rest():CurlErrorCode => 31   /* 31 - the rest command failed */
  fun obsolete32():CurlErrorCode => 32             /* 32 - not used */
  fun range_error():CurlErrorCode => 33            /* 33 - range "command" didn't work */
  fun http_post_error():CurlErrorCode => 34         /* 34 */
  fun ssl_connect_error():CurlErrorCode => 35      /* 35 - wrong when connecting with ssl */
  fun bad_download_resume():CurlErrorCode => 36    /* 36 - couldn't resume download */
  fun file_couldnt_read_file():CurlErrorCode => 37  /* 37 */
  fun ldap_cannot_bind():CurlErrorCode => 38       /* 38 */
  fun ldap_search_failed():CurlErrorCode => 39     /* 39 */
  fun obsolete40():CurlErrorCode => 40              /* 40 - not used */
  fun function_not_found():CurlErrorCode => 41      /* 41 */
  fun aborted_by_callback():CurlErrorCode => 42    /* 42 */
  fun bad_function_argument():CurlErrorCode => 43  /* 43 */
  fun obsolete44():CurlErrorCode => 44             /* 44 - not used */
  fun interface_failed():CurlErrorCode => 45        /* 45 - curlopt_interface failed */
  fun obsolete46():CurlErrorCode => 46             /* 46 - not used */
  fun too_many_redirects():CurlErrorCode => 47     /* 47 - catch endless re-direct loops */
  fun unknown_option():CurlErrorCode => 48          /* 48 - user specified an unknown option */
  fun telnet_option_syntax():CurlErrorCode => 49   /* 49 - malformed telnet option */
  fun obsolete50():CurlErrorCode => 50              /* 50 - not used */
  fun peer_failed_verification():CurlErrorCode => 51 /* 51 - peer's certificate or fingerprint */

  fun got_nothing():CurlErrorCode => 52             /* 52 - when this is a specific error */
  fun ssl_engine_notfound():CurlErrorCode => 53     /* 53 - ssl crypto engine not found */
  fun ssl_engine_setfailed():CurlErrorCode => 54   /* 54 - can not set ssl crypto engine as */

  fun send_error():CurlErrorCode => 55             /* 55 - failed sending network data */
  fun recv_error():CurlErrorCode => 56             /* 56 - failure in receiving network data */
  fun obsolete57():CurlErrorCode => 57             /* 57 - not in use */
  fun ssl_certproblem():CurlErrorCode => 58         /* 58 - problem with the local certificate */
  fun ssl_cipher():CurlErrorCode => 59              /* 59 - couldn't use specified cipher */
  fun ssl_cacert():CurlErrorCode => 60             /* 60 - problem with the ca cert (path?) */
  fun bad_content_encoding():CurlErrorCode => 61    /* 61 - unrecognized/bad encoding */
  fun ldap_invalid_url():CurlErrorCode => 62       /* 62 - invalid ldap url */
  fun filesize_exceeded():CurlErrorCode => 63      /* 63 - maximum file size exceeded */
  fun use_ssl_failed():CurlErrorCode => 64         /* 64 - requested ftp ssl level failed */
  fun send_fail_rewind():CurlErrorCode => 65       /* 65 - sending the data requires a rewind */

  fun ssl_engine_initfailed():CurlErrorCode => 66   /* 66 - failed to initialise engine */
  fun login_denied():CurlErrorCode => 67            /* 67 - user, password or similar was not */

  fun tftp_notfound():CurlErrorCode => 68          /* 68 - file not found on server */
  fun tftp_perm():CurlErrorCode => 69              /* 69 - permission problem on server */
  fun remote_disk_full():CurlErrorCode => 70        /* 70 - out of disk space on server */
  fun tftp_illegal():CurlErrorCode => 71           /* 71 - illegal tftp operation */
  fun tftp_unknownid():CurlErrorCode => 72         /* 72 - unknown transfer id */
  fun remote_file_exists():CurlErrorCode => 73     /* 73 - file already exists */
  fun tftp_nosuchuser():CurlErrorCode => 74        /* 74 - no such user */
  fun conv_failed():CurlErrorCode => 75            /* 75 - conversion failed */
  fun conv_reqd():CurlErrorCode => 76              /* 76 - caller must register conversion */

  fun ssl_cacert_badfile():CurlErrorCode => 77      /* 77 - could not load cacert file, missing */

  fun remote_file_not_found():CurlErrorCode => 78  /* 78 - remote file not found */
  fun ssh():CurlErrorCode => 79                    /* 79 - error from the ssh layer, somewhat */

  fun ssl_shutdown_failed():CurlErrorCode => 80    /* 80 - failed to shut down the ssl */

  fun again():CurlErrorCode => 81                  /* 81 - socket is not ready for send/recv, */

  fun ssl_crl_badfile():CurlErrorCode => 82         /* 82 - could not load crl file, missing or */

  fun ssl_issuer_error():CurlErrorCode => 83       /* 83 - issuer check failed.  (added in */

  fun ftp_pret_failed():CurlErrorCode => 84        /* 84 - a pret command failed */
  fun rtsp_cseq_error():CurlErrorCode => 85        /* 85 - mismatch of rtsp cseq numbers */
  fun rtsp_session_error():CurlErrorCode => 86     /* 86 - mismatch of rtsp session ids */
  fun ftp_bad_file_list():CurlErrorCode => 87      /* 87 - unable to parse ftp file list */
  fun chunk_failed():CurlErrorCode => 88           /* 88 - chunk callback reported error */
