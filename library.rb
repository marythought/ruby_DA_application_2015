# Use object-oriented Ruby to model a public library
# (w/ three classes: Library, Shelf, & Book). *
# The library should be aware of a number of distinct shelves. --CHECK
# Each shelf should know what books it contains. --CHECK
#Create methods to add and remove a book from a self. --CHECK
#The library should have a method to report all books it contains. --CHECK
#Note: this should *not* be a Rails app - just a single file with three classes
# (plus commands at the bottom showing it works) is all that is needed.
#In addition to pushing this ruby file to your Github account, please also
# setup your code at http://repl.it/languages/Ruby (so it runs) and enter
#the saved URL here so we can take a look.

class Library
  def initialize
      puts "Welcome to the library!"
  end

  def list_shelves
    puts "Library contains #{Shelf.number_of_instances} shelves:"
    puts "#{Shelf.shelf_list}"
  end

  def list_all_books
    puts "Library contains #{Book.number_of_instances} books:"
    puts "#{Book.book_list}"
  end
end

class Shelf
  attr_accessor :contents, :name
  @@shelf_count = 0
  @@shelf_list = []

  def initialize(name)
    @name = name
    @@shelf_count += 1
    @@shelf_list << @name
    @contents = []
    puts "#{name.capitalize} shelf created."
  end

  def list_books
    puts "#{name} shelf contains #{@contents}."
  end

  def shelve(book_name)
    @contents << book_name.name
    puts "#{book_name.name} added to shelf #{self.name}."
    book_name.shelved = true
  end

  def unshelve(book_name)
    @contents.delete(book_name.name)
    book_name.shelved = false
    puts "#{book_name.name} removed from shelf #{self.name}."
  end

  def self.number_of_instances
    return @@shelf_count
  end

  def self.shelf_list
    return @@shelf_list
  end
end

class Book
  attr_accessor :name, :shelved
  @@book_count = 0
  @@book_list = []

  def initialize(name)
    @name = name
    @@book_count += 1
    @@book_list << @name
    @shelved = false
    puts "#{name} added to the library."
  end

  def self.number_of_instances
    return @@book_count
  end

  def self.book_list
    return @@book_list
  end

  def remove
    puts "Attempting to delete #{name}..."
    if @shelved
      puts "You must first unshelve the book #{@name}."
    else
      @@book_list.delete(@name)
      @@book_count -= 1
      puts "Deleted #{name} from library."
    end
  end
end


my_library = Library.new

alice = Book.new("Alice in Wonderland")
wizard = Book.new("The Wonderful Wizard of Oz")
fiction = Shelf.new("fiction")

fiction.shelve(alice)
fiction.list_books
fiction.shelve(wizard)
non_fiction = Shelf.new("non-fiction")

how_to_influence_people = Book.new("How to Make Friends and Influence People")

non_fiction.shelve(how_to_influence_people)
puts fiction.list_books
puts non_fiction.list_books

alice.remove
fiction.unshelve(alice)
alice.remove
puts fiction.list_books

puts ".... ... ..."

my_library.list_shelves
my_library.list_all_books
