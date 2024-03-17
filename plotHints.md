---
layout: page
title: Plotting hints
---

rstudio is weird about plot size. You're supposed to be able to make the window bigger (and therefore make nice plots) by manually adjusting the plot window, or using the Zoom button. It can also help to use the rstudio "restart R" option, or to actually restart rstudio. It's also possible that this will not work for you.

There is a reliable way to make nice plots, but it might be a bit annoying.

If you restart R and load stuff (source commands and library commands), it should always work to do something like:

```
pdf()
[Simulation commands]
dev.off()
``` 

This will save a file called "Rplots.pdf" to your current directory, and it should be beautifully proportioned. You can open it by clicking on the rstudio Files tab (typically part of the lower right group).

You should be able to do as many plots as you want between the pdf() command and the dev.off() command and just get a lot of pages in your Rplots file. Or you can do pdf("filename.pdf") to make different pdf files (change "filename" to what you want).

The pdf files are written when you say dev.off() (or leave rstudio),
not necessarily when you make a plot.
