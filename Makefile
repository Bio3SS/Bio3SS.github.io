## 3SS/web
## makestuff/project.Makefile

current: target
-include target.mk

-include makestuff/perl.def

######################################################################
## Posting

Ignore += .jekyll-cache
## serve: jekyll.log ##

# http://localhost:4913/
# http://bio3ss.github.io?version=232

## https://cap.mcmaster.ca/mcauth/login.jsp?app_id=1505&app_name=Avenue ##
# https://teams.microsoft.com/l/channel/19%3apv40J-1SM7O8BP6oXpEQ6a0dgaMRzyngCWh62OIyhEQ1%40thread.tacv2/General?groupId=88fcb621-4c4c-4603-b746-737c99b739ad&tenantId=44376307-b429-42ad-8c25-28cd496f4772
# https://avenue.cllmcmaster.ca/d2l/lms/news/newedit.d2l?ou=595825
# http://bio3ss.github.io?version=232

## Avenue main
# https://avenue.cllmcmaster.ca/d2l/home/595825

## To CP using keyboard?
## works with shift-arrows, V seems not helpful
## To get out of trappy text box, top corner and tab

## Usually go to the open Teams window (web or desktop) instead of opening

##################################################################

## Content

Sources += $(wildcard *.md) updates.html

## move competition to compCode next time (already promulgated assignment!)
subdirs += compCode explCode 

Sources += competition/index.md

Ignore += $(subdirs) 
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

Ignore += *.post
announce.post: announce.md

waiting.post: waiting.md

######################################################################

## Template import 2020 Jun 28 (Sun)

## Get template from sources, incorporate immediately into outline
Ignore += template.*

## DON'T use this pipeline; Tania will munge it and their template does not have logical formatting
## template.md: template.docx: pandoc -t gfm -o $@ $< ;
template.gh.html:

## Need to switch to GD (angry face) and follow Rosa's format
## https://docs.google.com/document/d/1c8fLGXmP4OaMiwOlP3LSUKx4R1f50kMgiSqasHiC3yU/edit
## https://www.biology.mcmaster.ca/undergraduate/undergrad-course-outlines.html
## git mv outline.md outline_notes.md ##
Sources += outline.pdf

######################################################################

## Avenue banner 2400x960

Ignore += *.jpg

gazelles.jpg:
	wget -O $@ "https://upload.wikimedia.org/wikipedia/commons/b/ba/Grant%27s-gazelle.jpg"

Sources += gazelles.txt

gazelles.crop.jpg: gazelles.jpg Makefile
	convert -crop 1600x640+18+100 $< $@

## Logos

## Not working
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

## Not working
Ignore += mara*.jpg
mara.jpg:
	wget -O $@ "https://upload.wikimedia.org/wikipedia/en/3/3f/Herds_Maasi_Mara_%28cropped_and_straightened%29.jpg"

mara.crop.jpg: mara.jpg Makefile
	convert -crop 966x360+0+100 $< $@

######################################################################

## Restarting the year

Sources += Oldposts.list
post_archive:
	git rm -r Oldposts
	git mv _posts Oldposts
	ls Oldposts/* > Oldposts.list

_posts:
	$(mkdir)

## Start term by reorganizing what's available; grab a copy of the previous final, since you probably haven't posted that yet.
## 2021 Jan 05 (Tue) Not really sure what's up with 2020 test material since 
## much of it was online
## Ignore += materials/*.final.*
Sources += $(wildcard materials/*.*)
Sources += $(wildcard materials/resources/*.*)
Sources += $(wildcard materials/2020/*.*)
Sources += $(wildcard materials/2019/*.*)
Sources += $(wildcard materials/2018/*.*)
Sources += $(wildcard materials/2017/*.*)
## git rm -r materials/2017/ ##
materials_archive:
	mkdir materials/2020
	git mv materials/*.* materials/2020

######################################################################

## Stuff you want to share from others
Sources += $(wildcard postings/*.*)

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

-include makestuff/pandoc.mk

-include makestuff/projdir.mk

