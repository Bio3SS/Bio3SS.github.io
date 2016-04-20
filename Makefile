# http://bio3ss.github.io
# HTTPS://avenue.cllmcmaster.ca/d2l/lms/news/newedit.d2l?ou=174426&global=0 not tested much.

### hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: announce.post 

##################################################################

# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk
include $(ms)/os.mk
include $(ms)/perl.def

##################################################################

## Content

Sources += $(wildcard *.md) updates.html

Sources += $(wildcard materials/*.*)
Sources += $(wildcard _drafts/*.md)

######################################################################

zebras.jpg:
	wget -O $@ "http://www.webmastergrade.com/wp-content/uploads/2009/09/Animal-Group-01.jpg"

zebras.crop.jpg: zebras.jpg
	convert -crop 800x440+0+60 $< $@

######################################################################

Archive += caribou.crop.jpg

caribou.jpg:
	wget -O $@ "https://upload.wikimedia.org/wikipedia/commons/8/86/Mech_06.jpg"

caribou.crop.jpg: caribou.jpg 
	convert -crop 600x180+0+170 $< $@

##################################################################
# Posts

# Posts are made from drafts as a side effect of making *.post
Sources += $(wildcard _posts/*.*)
Sources += post.pl

%.post: %.md post.pl
	$(PUSH)
	$(shell_execute)

announce.post: announce.md

######################################################################

# Jekyll

not:
	$(RMF) about.md feed.xml

Sources += _config.yml Gemfile
Sources += _includes/* _layouts/* css/* _sass/*

### Makestuff

## Change this name to download a new version of the makestuff directory
# Makefile: start.makestuff

-include $(ms)/git.mk
-include $(ms)/visual.mk

# -include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
