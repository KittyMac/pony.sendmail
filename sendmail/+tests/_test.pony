use "ponytest"

actor Main is TestList
	new create(env: Env) => PonyTest(env, this)
	new make() => None

	fun tag tests(test: PonyTest) =>
		test(_Test1)

class iso _Test1 is UnitTest
	fun name(): String => "test 1 - send email using libcurl"

	fun apply(h: TestHelper) =>
    try
    
      let eml = recover iso Eml end
      eml.smtpAddress = "smtp://localhost"
      eml.toAddress = "to@chimerasw.com"
      eml.fromAddress = "from@chimerasw.com"
      eml.subject = "Test subject line from Pony"
      eml.body = "Test email body from Pony"
			SendMail(consume eml)?
      
      h.complete( true )
    else
      @fprintf[I32](@pony_os_stdout[Pointer[U8]](), "\nRun ```make server``` to ensure you have a local smtp server to run the tests against\n\n".cstring())
      @fprintf[I32](@pony_os_stdout[Pointer[U8]](), "[%d] %s\n".cstring(), __error_code, __error_loc)
			h.complete( false )
    end
