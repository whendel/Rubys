# contact.rb

class Contact
    attr_accessor :name, :phone, :email
  
    def initialize(name, phone, email)
      @name = name
      @phone = phone
      @email = email
    end
  
    def to_s
      "Name: #{@name}, Phone: #{@phone}, Email: #{@email}"
    end
  
    def to_csv
      "#{@name},#{@phone},#{@email}"
    end
  
    def self.from_csv(csv_line)
      name, phone, email = csv_line.strip.split(',')
      Contact.new(name, phone, email)
    end
  end
  