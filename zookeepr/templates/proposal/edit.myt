<h2>Edit proposal <% c.proposal.id %></h2>

<div id="proposal">

<&| @zookeepr.lib.form:fill, defaults=defaults, errors=errors &>

<% h.form(h.url()) %>
<& form.myt &>
<% h.submit('Update') %>
<% h.end_form() %>

</&>

</div>

<%args>
defaults
errors
</%args>

<%init>
# Working around a bug in formencode, we need to set the defaults to the c.proposal
# values
if not defaults:
	defaults = {'proposal.title': c.proposal.title,
		    'proposal.type': c.proposal.type.id,
		    'proposal.abstract': c.proposal.abstract,
                    'proposal.experience': c.proposal.experience,
                    'proposal.url': c.proposal.url,
                   }
</%init>