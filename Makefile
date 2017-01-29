# http://bio3ss.github.io
# http://localhost:4000/
# http://localhost:4000/announce.html
# https://avenue.cllmcmaster.ca/d2l/home/201446

### hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: announce.post 

##################################################################

# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md TODO.md
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

caribou.jpg:
	wget -O $@ "https://upload.wikimedia.org/wikipedia/commons/8/86/Mech_06.jpg"

caribou.crop.jpg: caribou.jpg 
	convert -crop 600x180+0+170 $< $@

##################################################################
# Posts

# Posts are made from drafts as a side effect of making *.post
Sources += $(wildcard _posts/*.*)
Sources += post.pl
Sources += 2016_posts.list

%.post: %.md post.pl
	$(PUSH)
	$(shell_execute)

announce.post: announce.md

######################################################################

# Jekyll

not:
	$(RMF) about.md feed.xml

Sources += _config.yml $(wildcard Gemfile_*)

Sources += _includes/* _layouts/* css/* _sass/*

######################################################################

-include $(ms)/git.mk
-include $(ms)/visual.mk

# -include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
