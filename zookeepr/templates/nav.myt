    <ul class="main_menu">
      <!--
        <li><a href="/" <%cls('home')%> >Home</a></li>
        <li><a href="/2008/about" <% cls('about') %>>About</a></li>
        <li><a href="/2008/sponsors-media" <% cls('sponsors-media') %>>Sponsors / Media</a></li>
        <li><a href="/mini-confs" <% cls('mini-confs') %>>Mini-confs</a></li>
        <li><a href="/presentations" <% cls('presentations') %>>Presentations</a></li>
        <li><a href="/2008/contact" <% cls('contact') %>>Contact</a></li>
      -->

% for (t, u, c) in mm:
        <li><a href="<% u %>" <% cls(c) %>><% t %></a></li>
% #endfor

% if 'signed_in_person_id' not in session:
        <li><a href="<% h.url(controller='person', action='signin', id=None)() %>" <% cls('login') %>>sign in</a></li>
% else:
        <li><a href="<% h.url(controller='person', action='signout', id=None)() %>" <% cls('login') %>>sign out</a></li>
% #endif
    </ul>


<%init>
# The current URL can be accessed as h.url()()
url = h.url()()

where = 'home'
map = [
  ('/2008/about', 'about'),				# zookeepr
  ('/2008/sponsors-media', 'sponsors-media'),		# zookeepr
  ('/mini-confs', 'mini-confs'),			# zookeepr?
  ('/cfp', 'mini-confs'),				# zookeepr
  ('/papers', 'presentations'),				# zookeepr
  ('/presentations', 'presentations'),			# 
  ('/registration', 'register'),			# zookeepr
  ('/proposal', 'programme'),				# 
  ('/invoice', 'register'),				# zookeepr
  ('/wiki', 'wiki'),					# 
  ('/2008/contact', 'contact'),				# 
  ('/person', 'login'),					# zookeepr
  ('/error', ''),					#
]

# Import the navbar from Matrix ("mm" stands for "matrix menu")
import re, urllib
# mm = 'http://matrix.mel8ourne.org/_designs/zookeepr-files/menu-list'
mm = 'http://linux.conf.au/_designs/zookeepr-files/menu-list'
try:
  # Don't try to look up our own name in the DNS - apparently,
  # munnari.oz.au is currently having problems.
  #raise 'foo'
  # Now in our own /etc/hosts
  mm = urllib.urlopen(mm).readlines()
except:
  mm = []
mm = [mme.split(',', 2) for mme in mm if ',' in mme]
mm = [(t.strip(' \t"'), re.sub('^http://[^/]*/', '/', u.strip(' \t\n"')))
							  for (t, u) in mm]
mm = [(t, u, u.split('/')[1]) for (t, u) in mm if u!='/person/signin']

if not mm:
  # fallback if fetching the navbar fails
  mm = [
    ('Home', '/home', 'home'),					# zookeepr
    ('About', '/about', 'about'),				# 
    ('Sponsors / Media', '/sponsors-media', 'sponsors-media'),	#
    ('Register', '/register', 'register'),			#
    ('Programme', '/programme', 'programme'),			#
    ('Social Events', '/social-events', 'social-events'),	#
    ('Contact', '/contact', 'contact'),				#
  ]

map = map + [(u, c) for (t, u, c) in mm]

for (u, w) in map:
  if url.startswith(u):
    where = w

def cls(part):
  if part==where:
    return 'class="now"'
  else:
    return 'class=""'
</%init>
