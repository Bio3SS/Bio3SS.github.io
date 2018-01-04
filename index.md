---
layout: page
title: Overview
---

{% comment %} 
__This page currently reflects (mostly) information from 2017.__ Updates are coming.
{% endcomment %} 

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

{% comment %} 
# [Older updates](updates.html)

{% endcomment %} 

# Course information

* [Official course outline](outline.html)
{% comment %} 
* [Class participation](participation.html)
* [Course calendar](https://calendar.google.com/calendar/embed?src=f9g0s57fganutu9q5ugp5jhmuo%40group.calendar.google.com&ctz=America/Toronto)
{% endcomment %} 
* [About note-taking](http://www.vox.com/2014/6/4/5776804/note-taking-by-hand-versus-laptop)

{% comment %} 
	outline.md
{% endcomment %} 

# Course content

{% comment %} 
* [Introductory unit](intro.html)
* [Unit 1: Linear population models](linear.html)
* [Unit 2: Non-linear population models](nonlinear.html)
* [Unit 3: Structured populations models](structure.html)
* [Unit 4: Life history](life_history.html)
* [Unit 5: Competition](competition.html)
* [Unit 6: Exploitation](exploitation.html)
* [Unit 7: Disease](disease.html)
{% endcomment %} 

{% comment %} 
	intro.md
	linear.md
	nonlinear.md
	structure.md
	life_history.md
	competition.md
	exploitation.md
	disease.md
{% endcomment %} 

# Tests and assignments
{% comment %} 
* [Assignments](assignments.html)
* [Midterm 1](midterm1.html)
* [Midterm 2](midterm2.html)
* [Final exam](final.html)
{% endcomment %} 

{% comment %} 
assignments.md
midterm1.md
midterm2.md
{% endcomment %} 




# Policies

* [Tutorial policy](Tutorials.html)
* [Excuses for missed tests and missed work](Excuses.html)
* [Access to the course](Access.html)
* [Collaboration guidelines](Collaboration.html)
* [Regrades](Regrades.html)

# Links

{% comment %} 
* [This course on Avenue](https://avenue.cllmcmaster.ca/d2l/home/201446)
{% endcomment %} 
* [Facebook group](https://www.facebook.com/groups/{{site.facebook_group}})
