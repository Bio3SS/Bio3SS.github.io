---
layout: page
title: Overview
---

{% comment %} 
__This page currently reflects (mostly) information from 2018.__ Updates are coming.
{% endcomment %} 

# Updates (newest at top)
<!-- # [Updates](updates.html) -->
{% comment %} 
{% endcomment %} 

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
* [Class participation](participation.html)
* [About note-taking](http://www.vox.com/2014/6/4/5776804/note-taking-by-hand-versus-laptop)
* [Teaching team](team.html)
{% comment %} 
* [Office hours](office.html) ## Deprecate for teaching team?
* [Note takers](notes.html)
{% endcomment %} 
{% comment %} 
* [Course calendar](https://calendar.google.com/calendar/embed?src=f9g0s57fganutu9q5ugp5jhmuo%40group.calendar.google.com&ctz=America/Toronto)
{% endcomment %} 


# Course content

* [Unit 1: Course introduction](intro.html)
* [Unit 2: Linear population models](linear.html)
* [Unit 3: Non-linear population models](nonlinear.html)
{% comment %} 
* [Unit 4: Structured populations models](structure.html)
* [Unit 5: Life history](life_history.html)
* [Unit 6: Competition](competition.html)
* [Unit 7: Exploitation](exploitation.html)
* [Unit 8: Disease](disease.html)
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

{% comment %} 
REVIEW test issues from FB and post warnings
{% endcomment %} 

# Tests and assignments
* [Assignments](assignments.html)
{% comment %} 
* [Midterm 1](midterm1.html)
* [Midterm 2](midterm2.html)
* [Final exam](final.html)
{% endcomment %} 

# Policies

* [Tutorial policy](Tutorials.html)
* [Excuses for missed tests and missed work](Excuses.html)
* [Access to the course](Access.html)
* [Collaboration guidelines](Collaboration.html)
* [Regrades](Regrades.html)
* [Classroom announcements](/announcements.html)

{% comment %} 
# Links

* [This course on Avenue]({{site.avenue}})
* [Facebook group]({{site.facebook}})
{% endcomment %} 
