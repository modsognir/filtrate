Filtrate
========


Controller

```ruby
@filtered = User.filtered(params[:filters]).all
```


Views

```ruby
<%= filtrate users_path do |f|%>
  <%= f.filter :name %>
  <%= f.submit "Submit" %>
<% end %>
```