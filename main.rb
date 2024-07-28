# main.rb

require_relative 'contact_manager'

def print_menu
  puts "\nContact Manager"
  puts "1. Add Contact"
  puts "2. List Contacts"
  puts "3. Delete Contact"
  puts "4. Exit"
  print "Choose an option: "
end

manager = ContactManager.new

loop do
  print_menu
  choice = gets.chomp.to_i

  case choice
  when 1
    print "Enter name: "
    name = gets.chomp
    print "Enter phone: "
    phone = gets.chomp
    print "Enter email: "
    email = gets.chomp

    contact = Contact.new(name, phone, email)
    manager.add_contact(contact)
    puts "Contact added successfully."
  when 2
    manager.list_contacts
  when 3
    manager.list_contacts
    print "Enter the number of the contact to delete: "
    index = gets.chomp.to_i

    if index > 0 && index <= manager.list_contacts.length
      manager.delete_contact(index)
      puts "Contact deleted successfully."
    else
      puts "Invalid contact number."
    end
  when 4
    puts "Goodbye!"
    break
  else
    puts "Invalid option. Please try again."
  end
end
