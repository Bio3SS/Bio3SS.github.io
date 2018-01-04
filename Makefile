# http://localhost:4913/
# http://bio3ss.github.io
# https://avenue.cllmcmaster.ca/d2l/lms/news/newedit.d2l?ou=201446&global=0

current: target
-include target.mk

##################################################################

# make files

Sources += Makefile .gitignore README.md sub.mk LICENSE.md TODO.md

include sub.mk
-include $(ms)/perl.def

##################################################################

## Content

Sources += $(wildcard *.md) updates.html

Sources += $(wildcard materials/*.*)

######################################################################

## Logo

zebras.jpg:
	wget -O $@ "http://www.webmastergrade.com/wp-content/uploads/2009/09/Animal-Group-01.jpg"

zebras.crop.jpg: zebras.jpg
	convert -crop 800x440+0+60 $< $@

caribou.jpg:
	wget -O $@ "https://upload.wikimedia.org/wikipedia/commons/8/86/Mech_06.jpg"

caribou.crop.jpg: caribou.jpg 
	convert -crop 600x180+0+170 $< $@

##################################################################

dinosaur.jpg:
	wget -O $@ "https://upload.wikimedia.org/wikipedia/commons/9/92/Edmontonia_dinosaur.png"

######################################################################

# Posts

# Posts are made from drafts as a side effect of making *.post
Sources += $(wildcard _posts/*.*)
Sources += post.pl

%.post: %.md post.pl
	$(PUSH)
	$(shell_execute)

announce.post: announce.md

######################################################################

## Restarting the year

Sources += 2017_posts.list
post_archive:
	git mv _posts _2017_posts
	ls _2017_posts/* > 2017_posts.list
	git rm 2016_posts.list 
	mkdir _posts

Sources += $(wildcard materials/2017/*.*)
Sources += $(wildcard materials/2016/*.*)
materials_archive:
	mkdir materials/2017
	git mv materials/*.* materials/2017

Sources += wayback

wayback:
	git submodule add -b 2017 https://github.com/Bio3SS/Bio3SS.github.io.git $@

######################################################################

# Jekyll

not:
	$(RMF) about.md feed.xml

Sources += _config.yml $(wildcard Gemfile_*)

Sources += _includes/* _layouts/* css/* _sass/*

orig:
	$(LN) Gemfile_orig Gemfile

sb:
	$(LN) Gemfile_sb Gemfile

######################################################################

-include $(ms)/git.mk
-include $(ms)/visual.mk

# -include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
