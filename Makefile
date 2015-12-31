# http://Bio3SS.github.io

### Hooks for the editor to set the default target
current: target

target pngtarget pdftarget vtarget acrtarget: welcome.post 

##################################################################

# make files

Sources = Makefile .gitignore README.md stuff.mk LICENSE.md
include stuff.mk
include $(ms)/perl.def

##################################################################

## Content

Sources += $(wildcard *.md) updates.html

Sources += $(wildcard materials/*.*)
Sources += $(wildcard _posts/*.*)
Sources += $(wildcard _drafts/*.md)

######################################################################

# Posts

welcome.post: _drafts/welcome.md post.pl
	$(PUSH)
	$(shell_execute)

%.post: _drafts/%.md post.pl
	$(PUSH)

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
