---
title: Rails 3 Custom Scaffolding
layout: note
---

I've been building an application using Rails 3.1.1 that I keep adding models too. Everytime I do I need to customize the HTML for the scaffolding to use Bootstrap-specific HTML and general adjustments that I like better. I decided it was finally time to look into providing my own scaffolding templates so I don't have to do this every time.

Rails looks in `lib/templates/erb/scaffold` for scaffolding templates. If they don't exist it uses the built-in ones provided by Rails.

You can see the built-in scaffolding ERB templates for Rails 3.1 here: [https://github.com/rails/rails/tree/3-1-stable/railties/lib/rails/generators/erb/scaffold/templates](https://github.com/rails/rails/tree/3-1-stable/railties/lib/rails/generators/erb/scaffold/templates)

First I created a branch to develop this in:

{% highlight bash %}
$ git checkout -b scaffolding
{% endhighlight %}

I made the directory `lib/templates/erb/scaffold` since it doesn't exist by default:

{% highlight bash %}
$ mkdir -p lib/templates/erb/scaffold
{% endhighlight %}

Then I created `lib/templates/erb/scaffold/index.html.erb` and populated it with the following:

{% highlight erb %}
<h1><%= class_name %></h1>

<p><%%= add_button(<%= class_name %>) %></p>

<table id="<%= plural_table_name %>" class="table table-striped table-condensed table-bordered">
  <colgroup>
<% attributes.each do |attribute| -%>
    <col />
<% end -%>
    <col class="actions" />
  </colgroup>
  <thead>
  <tr>
<% attributes.each do |attribute| -%>
      <th><%= attribute.human_name %></th>
<% end -%>
      <th>Actions</th>
  </tr>
  </thead>
  <tbody>
<%% @<%= plural_table_name %>.each do |<%= singular_table_name %>| %>
  <tr>
<% attributes.each do |attribute| -%>
    <td><%%= <%= singular_table_name %>.<%= attribute.name %> %></td>
<% end -%>
    <td><%%= edit_button(<%= singular_table_name %>) %></td>
  </tr>
<%% end %>
  </tbody>
</table>
{% endhighlight %}

The `<%%= ... %>` prevents an expression from being evaluated, resulting in `<%= ... %>` in the generated scaffolding.

So when I run the following:

    rails generate scaffold Thing name:string description:text
    
It generates the following for `app/views/things/index.html.erb`:

{% highlight erb %}
<h1>Thing</h1>

<p><%= add_button(Thing) %></p>

<table id="things" class="table table-striped table-condensed table-bordered">
  <colgroup>
    <col />
    <col />
    <col class="actions" />
  </colgroup>
  <thead>
  <tr>
      <th>Name</th>
      <th>Description</th>
      <th>Actions</th>
  </tr>
  </thead>
  <tbody>
<% @things.each do |thing| %>
  <tr>
    <td><%= thing.name %></td>
    <td><%= thing.description %></td>
    <td><%= edit_button(thing) %></td>
  </tr>
<% end %>
  </tbody>
</table>
{% endhighlight %}

There are a number of methods/parameters available to use through your templates. From looking through several templates I saw the following:

* `class_name`
* `table_name`
* `plural_table_name`
* `singular_table_name`
* `attributes`
* `attribute.human_name`

I haven't yet found where I can see a full listing of the available methods/variables.

I repeated the following steps as I tested out my changes:

    # Create Scaffolding
    rails generate scaffold Thing name:string description:text
    rake db:migrate

    # Test Changes
    # ...

    # Tear Down Scaffolding
    rake db:rollback
    rails destroy scaffold Thing
    
    # Makes Changes and Repeat

## Resources

* [Customizing Your Workflow by Changing Generators Templates](http://guides.rubyonrails.org/generators.html#customizing-your-workflow-by-changing-generators-templates)
* [RailsCast #216: Generators in Rails 3](http://railscasts.com/episodes/216-generators-in-rails-3)

