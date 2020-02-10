all:
	stable env /Volumes/Development/Development/pony/ponyc/build/release/ponyc -o ./build/ ./sendmail
	./build/sendmail

test:
	stable env /Volumes/Development/Development/pony/ponyc/build/release/ponyc -V=0 -o ./build/ ./sendmail
	./build/sendmail

server:
	sudo python -m smtpd -n -c DebuggingServer localhost:25