# This is the competition subdirectory of Bio3SS web
# http://localhost:4913/
# http://localhost:4913/announce.html
# http://bio3ss.github.io
# https://avenue.cllmcmaster.ca/d2l/lms/news/newedit.d2l?ou=235353
# https://avenue.cllmcmaster.ca/d2l/home/235353

current: target
-include target.mk

##################################################################

# make files

Sources += Makefile

ms = makestuff
-include local.mk
-include $(ms)/os.mk

Makefile: $(ms)
$(ms): 
	ls -d ../makestuff && /bin/ln -fs ../makestuff .

Ignore += $(ms)

-include $(ms)/perl.def

##################################################################

## Content

Sources += index.md 

Ignore += index.R
index.R: index.md
	codedown R < $< > $@

index.Rout: index.md

indexFiles += index.Rout-0.png index.Rout-1.png index.Rout-2.png index.Rout-3.png index.Rout-4.png

### Temporarily disable (need codedown)
Sources += $(indexFiles)
index.update: index.md $(indexFiles) ;

######################################################################

-include $(ms)/git.mk
-include $(ms)/visual.mk

-include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
