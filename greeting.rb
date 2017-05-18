def greeting
    first= ARGV.shift
    ARGV.each do |arg|
        puts "#{first} #{arg}"
    end
end

greeting