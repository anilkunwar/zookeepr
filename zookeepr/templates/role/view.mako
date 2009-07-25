<%inherit file="/base.mako" />
<h1>View role</h1>

<table>
  <tr class="odd">
    <td>Name:</td>
    <td>${ c.role.name }</td>
  </tr>
  <tr class="even">
    <td>Pretty Name:</td>
    <td>${ c.role.pretty_name }</td>
  </tr>
  <tr class="odd">
    <td>Display Order:</td>
    <td>${ c.role.display_order }</td>
  </tr>
</table>

<hr>
<p>
<ul>
  <li>${ h.link_to('Edit', url=h.url_for(action='edit',id=c.role.id)) }</li>
  <li>${ h.link_to('Back', url=h.url_for(action='index', id=None)) }</li>
</ul>
</p>
