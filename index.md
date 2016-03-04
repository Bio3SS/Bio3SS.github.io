---
layout: page
title: Overview
---

# Updates (newest at top)
<!-- # [Updates](updates.html) -->

<ul class="post-list">
	{% for post in site.posts limit:4 %}
		<li>
			<span class="post-meta">{{ post.date | date: "%b %-d, %Y" }}: </span>
				<a class="post-mini" href="{{ post.url | prepend: site.baseurl }}">{{ post.title }}</a>
		</li>
	{% endfor %}
</ul>

# [Older updates](updates.html)


# Course information

* [Official course outline](materials/outline.pdf)
* [Class participation](participation.html)
* [Course calendar](https://calendar.google.com/calendar/embed?src=f9g0s57fganutu9q5ugp5jhmuo%40group.calendar.google.com&ctz=America/Toronto)
* [Facebook group](https://www.facebook.com/groups/456104641239578/)
* [About note-taking](http://www.vox.com/2014/6/4/5776804/note-taking-by-hand-versus-laptop)
* [This course on Avenue](https://avenue.cllmcmaster.ca/d2l/home/174426)

# Course content

* [Introductory unit](intro.html)
* [Unit 1: Linear population models](linear.html)
* [Unit 2: Non-linear population models](nonlinear.html)
* [Unit 3: Structured populations models](structure.html)
* [Unit 4: Life history](life_history.html)

# Tests and assignments
* [Assignments](assignments.html)
* [Midterm 1](midterm1.html)
* [Midterm 2](midterm2.html)

# Policies

* [Tutorial policy](Tutorials.html)
* [Excuses for missed tests and missed work](Excuses.html)
* [Access to the course](Access.html)
* [Collaboration guidelines](Collaboration.html)
