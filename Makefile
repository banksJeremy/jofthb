run: compile_coffee
	(sleep 1; open http://localhost:8086/) &
	dev_appserver.py -p 8086 .

push: compile_coffee
	appcfg.py update .
	open http://jofthb.appspot.com/

compile_coffee:
	mkdir -p static/
	coffee --compile static/

.PHONY: run push compile_coffee
