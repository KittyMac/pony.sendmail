
all:
	corral run -- ponyc --print-code -o ./build/ ./sendmail
	./build/sendmail

test:
	corral run -- ponyc -V=0 -o ./build/ ./sendmail
	./build/sendmail

server:
	sudo python -m smtpd -n -c DebuggingServer localhost:25




corral-fetch:
	@corral clean -q
	@corral fetch -q

corral-local:
	-@rm corral.json
	-@rm lock.json
	@corral init -q
	@corral add /Volumes/Development/Development/pony/pony.stringExt -q

corral-git:
	-@rm corral.json
	-@rm lock.json
	@corral init -q
	@corral add github.com/KittyMac/pony.stringExt.git -q

ci: corral-git corral-fetch all
	
dev: corral-local corral-fetch all

