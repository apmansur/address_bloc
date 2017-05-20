require_relative '../models/address_book'
 
 class MenuController
   attr_reader :address_book
 
   def initialize
     @address_book = AddressBook.new
   end
 
   def main_menu
     puts "Main Menu - #{address_book.entries.count} entries"
     puts "1 - View all entries"
     puts "2 - Create an entry"
     puts "3 - Search for an entry"
     puts "4 - Import entries from a CSV"
     puts "5 - Exit"
     puts "6 - View Entry Number n"
     print "Enter your selection: "
    
     selection = gets.to_i
          
     case selection
       when 1
         system "clear"
         view_all_entries
         main_menu
       when 2
         system "clear"
         create_entry
         main_menu
       when 3
         system "clear"
         search_entries
         main_menu
       when 4
         system "clear"
         read_csv
         main_menu
       when 5
         puts "Good-bye!"
         
         exit(0)
       when 6
        system "clear"
        entry_n_submenu
        main_menu

       
       
       else
         system "clear"
         puts "Sorry, that is not a valid input"
         main_menu
     end
   end
   
   def entry_n_submenu
    print "Entry Number"
     entry_number = gets.chomp.to_i
        if entry_number < @address_book.entries.length && entry_number >= 0
         puts @address_book.entries[entry_number]
         puts "Press enter to return to main menu"
         gets.chomp
         system "clear"
        elsif @address_book.entries.length == 0
         puts "there are no entries in the address book"
        else
         puts "value must be less than #{address_book.entries.length} and greater than or equal to 0"
         entry_n_submenu
        end
   end
 
  
   def view_all_entries
       address_book.entries.each do |entry|
       system "clear"
       puts entry.to_s
     
       entry_submenu(entry)
     end
 
     system "clear"
     puts "End of entries"
   end
 
   def create_entry
     system "clear"
     puts "New AddressBloc Entry"
     
     print "Name: "
     name = gets.chomp
     print "Phone number: "
     phone = gets.chomp
     print "Email: "
     email = gets.chomp
 
     
     address_book.add_entry(name, phone, email)
 
     system "clear"
     puts "New entry created"
   end
 
   def search_entries
   end
 
   def read_csv
   end
   
    def entry_submenu(entry)
     
     puts "n - next entry"
     puts "d - delete entry"
     puts "e - edit this entry"
     puts "m - return to main menu"
 
     
     selection = gets.chomp
 
     case selection
    
       when "n"
     
       when "d"
       when "e"
     
       when "m"
         system "clear"
         main_menu
       else
         system "clear"
         puts "#{selection} is not a valid input"
         entry_submenu(entry)
     end
    end
 end