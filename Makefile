# http://localhost:4913/
# http://localhost:4913/announce.html
# HTTP://BIO3SS.GIthub.io
# https://avenue.cllmcmaster.ca/d2l/lms/news/newedit.d2l?ou=235353
# https://avenue.cllmcmaster.ca/d2l/home/235353

# make serve
# jekyll build

current: target
-include target.mk

##################################################################

# make files

Sources += Makefile .ignore README.md sub.mk LICENSE.md TODO.md

include sub.mk
-include $(ms)/perl.def

##################################################################

## Content

Sources += $(wildcard *.md) updates.html

Sources += $(wildcard materials/*.*)

######################################################################

## Logos

zebras.jpg:
	wget -O $@ "http://www.webmastergrade.com/wp-content/uploads/2009/09/Animal-Group-01.jpg"

zebras.crop.jpg: zebras.jpg
	convert -crop 800x440+0+60 $< $@
Sources += caribou.crop.jpg

##################################################################

dinosaur.jpg:
	wget -O $@ "https://upload.wikimedia.org/wikipedia/commons/9/92/Edmontonia_dinosaur.png"

######################################################################

## Facebook images

Ignore += caribou*.jpg
caribou.jpg:
	wget -O $@ "https://upload.wikimedia.org/wikipedia/commons/8/86/Mech_06.jpg"

caribou.crop.jpg: caribou.jpg 
	convert -crop 600x180+0+170 $< $@

Ignore += mara*.jpg
mara.jpg:
	wget -O $@ "https://upload.wikimedia.org/wikipedia/en/3/3f/Herds_Maasi_Mara_%28cropped_and_straightened%29.jpg"

mara.crop.jpg: mara.jpg Makefile
	convert -crop 966x360+0+100 $< $@


# Posts

# Posts are made from drafts as a side effect of making *.post
Sources += $(wildcard _posts/*.*)
Sources += post.pl

%.post: %.md post.pl
	$(PUSH)
	$(shell_execute)

Ignore += announce.post
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

## Can't have this be a submodule!
## Need to just clone statically
## Branch is 2017
## Or was the problem just that it was in Sources?
wayback:

######################################################################

# Jekyll

not:
	$(RMF) about.md feed.xml

Sources += _config.yml $(wildcard Gemfile_*)

Sources += _includes/* _layouts/* css/* _sass/*

Ignore += .sass-cache/ Gemfile Gemfile.lock _site/

orig:
	$(LN) Gemfile_orig Gemfile

sb:
	$(LN) Gemfile_sb Gemfile

######################################################################

-include $(ms)/git.mk
-include $(ms)/visual.mk

# -include $(ms)/wrapR.mk
# -include $(ms)/oldlatex.mk
