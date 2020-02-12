## This is Bio3SS.github.io, a screens project directory
## 3SS/web
## makestuff/project.Makefile

current: target
-include target.mk

-include makestuff/perl.def

######################################################################

## Local
# http://localhost:4913/
# make serve ##

## Posting
# https://avenue.cllmcmaster.ca/d2l/lms/news/newedit.d2l?ou=315235
# http://bio3ss.github.io?version=233

## Avenue main
# https://avenue.cllmcmaster.ca/d2l/home/315235

## To CP using keyboard?
## works with shift-arrows, V seems not helpful
## To get out of trappy text box, top corner and double-tab

##################################################################

## Content

Sources += $(wildcard *.md) updates.html

Ignore += materials/*.final.*
Sources += $(wildcard materials/*.*)

subdirs += competition
Ignore += $(subdirs) 

## Was this necessary?
alldirs += $(subdirs)
alldirs += makestuff

######################################################################

# Posts

# Posts are made from drafts as a side effect of making *.post
Sources += $(wildcard _posts/*.*)
Sources += post.pl

%.post: %.md post.pl
	$(MAKE) _posts
	$(PUSH)
	$(shell_execute)

Ignore += announce.post
announce.post: announce.md

######################################################################

## Logos

zebras.jpg:
	wget -O $@ "http://www.webmastergrade.com/wp-content/uploads/2009/09/Animal-Group-01.jpg"

zebras.crop.jpg: zebras.jpg
	convert -crop 800x440+0+60 $< $@
Sources += caribou.crop.jpg

dinosaur.jpg:
	wget -O $@ "https://upload.wikimedia.org/wikipedia/commons/9/92/Edmontonia_dinosaur.png"

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

######################################################################

## Restarting the year

Sources += 2019_posts.list
post_archive:
	git mv _posts _2019_posts
	ls _2019_posts/* > 2019_posts.list
	git rm 2018_posts.list 

_posts:
	$(mkdir)

## git rm -r materials/2017/ ##
materials_archive:
	mkdir materials/2019
	git mv materials/*.* materials/2019
Sources += $(wildcard materials/2018/*.*)
Sources += $(wildcard materials/2019/*.*)

######################################################################

## R resources

# competition/ directory apparently not tracked
# linear/ directory under development

# linear deprecated for now. Doing that stuff in Homework instead. 
# Which also seems awkward
Sources += linear/bd.mw

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

vim_session:
	bash -cl "vmt index.md announce.md"

### Makestuff

Sources += Makefile README.md LICENSE.md TODO.md

Sources += content.mk

Ignore += makestuff
msrepo = https://github.com/dushoff
Makefile: makestuff/Makefile
makestuff/Makefile:
	git clone $(msrepo)/makestuff
	ls $@

-include makestuff/os.mk
-include makestuff/git.mk
-include makestuff/visual.mk
-include makestuff/projdir.mk
