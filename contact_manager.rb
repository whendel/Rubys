# contact_manager.rb

require_relative 'contact'

class ContactManager
  FILE_NAME = 'contacts.txt'

  def initialize
    @contacts = load_contacts
  end

  def add_contact(contact)
    @contacts << contact
    save_contacts
  end

  def list_contacts
    @contacts.each_with_index do |contact, index|
      puts "#{index + 1}. #{contact}"
    end
  end

  def delete_contact(index)
    @contacts.delete_at(index - 1)
    save_contacts
  end

  private

  def load_contacts
    return [] unless File.exist?(FILE_NAME)

    File.read(FILE_NAME).split("\n").map do |line|
      Contact.from_csv(line)
    end
  end

  def save_contacts
    File.open(FILE_NAME, 'w') do |file|
      @contacts.each do |contact|
        file.puts contact.to_csv
      end
    end
  end
end
