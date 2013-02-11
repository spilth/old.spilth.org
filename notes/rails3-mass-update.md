---
title: Mass Editing and Updating with Ruby on Rails 3
layout: note
---

I'm developing a Ruby on Rails project at work that has a large number of different resources that need to be managed. One important feature that users would like is the ability to update multiple resources at once when they all share the common value for an attribute.

This is covered in [Railscasts #165 - Edit Multiple](http://railscasts.com/episodes/165-edit-multiple) but there are a few things needed to make it Rails 3 friendly.

First let's generate a simple model:

	$ rails g scaffold Book title price:integer
    $ rake db:migrate

Yes, price should really be the decimal type for the price but I want to keep it simple so we can focus on solving one problem.
	
There's few things we want to accomplish:

- let the user select multiple items that they want to edit in bulk
- provide them with a form to change only the fields they want update
- return them to the list of items when done updating

In addition I'm looking to:

- prevent the user from mass editing fields that require unique values
- avoid duplication the form html for single and multiple edits if possible

So we'll
- update the list of items to include checkbox for selecting which items you want to edit
- provide a Edit Checked button that's only enabled when multiple items are checked
- create a controller action to find the items you want to update and provide a form to edit them
- create a form builder that let's us re-use the single edit form that already exists
- create a controller action to process the updates and ignores blank values

## Routing

First we'll add the two new routes we require for providing an mass edit form and for processing the mass update. Edit your `routes.rb` and add the following to the `books` resource:

	resources :books do
	  collection do
	    post 'mass_edit'
	    put 'mass_update'
	  end
	end
	
Running `rake routes` should show you your new routes:

	$ rake routes
      mass_edit_books POST   /books/mass_edit(.:format)   books#mass_edit
	mass_update_books PUT    /books/mass_update(.:format) books#mass_update

## Mass Edit Item Selection

To provide checkboxes we will:

- wrap the item table in a form that posts to our new action
- add a TD with a checkbox for each item ID
- add a Submit button

Update `app/views/books/index.html.erb` to look like this:

	<h1>Listing books</h1>

	<%= form_tag mass_edit_books_path %>
	<table>
	  <tr>
	    <th>Select</th>
	    <th>Title</th>
	    <th>Price</th>
	    <th></th>
	    <th></th>
	    <th></th>
	  </tr>

	<% @books.each do |book| %>
	  <tr>
	    <td><%= check_box_tag "ids[]", book.id %></td>
	    <td><%= book.title %></td>
	    <td><%= book.price %></td>
	    <td><%= link_to 'Show', book %></td>
	    <td><%= link_to 'Edit', edit_book_path(book) %></td>
	    <td><%= link_to 'Destroy', book, method: :delete, data: { confirm: 'Are you sure?' } %></td>
	  </tr>
	<% end %>
	</table>

	<input type="submit" value="Bulk Edit">

	</form>

	<br />

	<%= link_to 'New Book', new_book_path %>

We now have a form that posts to `mass_edit_books_path` and check boxes that have the IDs of the items we want to edit.

## Mass Edit Action

Let's add the `mass_edit` action to our `app/controllers/books_controller.rb` to handle posting the list of item IDs we want to edit.

	def mass_edit
	  if params[:ids].nil?
	    redirect_to books_path
	  else
	    @books = Book.find(params[:ids])
	  end
	end

If we post to the controller with no IDs just return back to the list of books, otherwise find all the books we want to edit and render the `mass_edit` page.

## Mass Edit View

The normal `app/views/books/edit.html.erb` scaffolding is pretty straight forward - it provides a title and includes the `app/views/books/_form.html.erb` partial which contains the form for creating/editing books.

	<%= form_for(@book) do |f| %>
	  <% if @book.errors.any? %>
	    <div id="error_explanation">
	      <h2><%= pluralize(@book.errors.count, "error") %> prohibited this book from being saved:</h2>

	      <ul>
	        <% @book.errors.full_messages.each do |msg| %>
	          <li><%= msg %></li>
	        <% end %>
	      </ul>
	    </div>
	  <% end %>

	  <div class="field">
	    <%= f.label :title %><br />
	    <%= f.text_field :title %>
	</div>
	<div class="field">
	  <%= f.label :price %><br />
	  <%= f.number_field :price %>
	</div>
	<div class="actions">
	  <%= f.submit %>
	</div>
	<% end %>

This isn't going to work for us because when we're doing a mass update we need to post to a different action. We also can't re-use the error block because we're editing multiple books not just one. What we'll end up doing is:

- move the fields into another partial named `_form_fields.html.erb`
- render that partial in the original `_form.html.erb`
- create a new `app/views/books/mass_edit.html.erb` to display a form with a different action
- render the `_form_fields.html.erb` partial in the mass edit form as well

Our `_form_fields.html.erb` will contain:

	<div class="field">
	  <%= f.label :title %><br />
	  <%= f.text_field :title %>
	</div>
	<div class="field">
	  <%= f.label :price %><br />
	  <%= f.number_field :price %>
	</div>
	<div class="actions">
	  <%= f.submit %>
	</div>

The `_form.html.erb` is updated to include that partial:

	<%= form_for(@book) do |f| %>
	  <% if @book.errors.any? %>
	    <div id="error_explanation">
	      <h2><%= pluralize(@book.errors.count, "error") %> prohibited this book from being saved:</h2>

	      <ul>
	        <% @book.errors.full_messages.each do |msg| %>
	          <li><%= msg %></li>
	        <% end %>
	      </ul>
	    </div>
	  <% end %>

	  <%= render 'form_fields', :f => f %>
	<% end %>
	
We create the new mass edit view to point to the `mass_update_books_path`, provide the list of book IDs in hidden fields and include the form fields as well.

	<h1>Mass Edit</h1>

	<%= form_for @book, :url => mass_update_books_path, :method => :put do |f| %>
	  Editing the following:
	  <ul>
	    <% @books.each do |book| %>
	      <li><%= book.title %><%= hidden_field_tag "ids[]", book.id %></li>
	    <% end %>
	  </ul>

	  <%= render 'form_fields', :f => f %>
	<% end %>
	
## Mass Update Action

	def mass_update
	  @books = Book.find(params[:ids])

	  # Remove params with blank values
	  params[:book].delete_if {|k,v| v.empty?}

	  @books.each do |book|
	    book.update_attributes(params[:book])
	  end

	  redirect_to books_path, :notice => "Book updated!"
	end

## Further Tweaks

### Smart Bulk Edit Button

### Prevent Mass Editing Unique Fields

If we happen to have a field in our model that requires unique values then we probably don't want users editing that field for multiple objects. The way the controller currently works, the first item will get the update and the rest will silently fail, preventing all the other fields from being updated as well.

Let's set the `title` field of the book to be unique. Edit `app/models/book.rb`:

	class Book < ActiveRecord::Base
	  attr_accessible :price, :title

	  validates :title, :uniqueness => true
	end

#### Mass Edit Form Builder

	class MassFormBuilder < ActionView::Helpers::FormBuilder
	  def text_field(attribute, options={})
	    label(attribute) + super
	  end
	end

	<%= form_for @book, :builder => MassFormBuilder do |f| %>
	  <%= f.text_field :first_name %>
	<% end %>


## Resources

- <http://railscasts.com/episodes/165-edit-multiple>
- <http://railscasts.com/episodes/198-edit-multiple-individually>
- <http://railscasts.com/episodes/311-form-builders>

