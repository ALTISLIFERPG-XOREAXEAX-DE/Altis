UPDATE = git pull origin master

PUSH = $(UPDATE) && git add -A && git commit -a && git push origin master

all: update

update:
	cd ../Deployment && $(UPDATE)
	cd ../Mission && $(UPDATE)
	cd ../Mapping && $(UPDATE)
	cd ../Textures && $(UPDATE)
	cd ../Upstream && $(UPDATE)
	cd ../Altis && $(UPDATE)

push:
	cd ../Deployment && $(PUSH); echo
	cd ../Mission && $(PUSH); echo
	cd ../Mapping && $(PUSH); echo
	cd ../Textures && $(PUSH); echo
	cd ../Upstream && $(PUSH); echo
	cd ../Altis && $(PUSH); echo

