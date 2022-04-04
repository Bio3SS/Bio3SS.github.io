# This is the exploitation subdirectory of Bio3SS web
# http://localhost:4913/
# http://localhost:4913/announce.html
# http://bio3ss.github.io
# https://avenue.cllmcmaster.ca/d2l/lms/news/newedit.d2l?ou=235353
# https://avenue.cllmcmaster.ca/d2l/home/235353

current: target
-include target.mk

##################################################################

## Content

Sources += index.md 

Ignore += index.R
index.R: index.md
	codedown R < $< > $@

index.Rout: index.md

indexFiles += index.Rout-0.png index.Rout-1.png index.Rout-2.png index.Rout-3.png

### Temporarily disable (need codedown)
Sources += $(indexFiles)
index.update: index.md $(indexFiles) ;

######################################################################
# make files

Sources += Makefile

ms = makestuff
-include local.mk
-include makestuff/os.mk

Makefile: makestuff
makestuff: 
	ls -d ../makestuff && /bin/ln -fs ../makestuff .

Ignore += makestuff

-include makestuff/perl.def

##################################################################

-include makestuff/git.mk
-include makestuff/visual.mk

-include makestuff/pipeR.mk
