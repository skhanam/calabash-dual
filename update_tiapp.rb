filename="#{ARGV[0]}/tiapp.xml"
text = File.read(filename)

puts ARGV[1]

puts=text.gsub(/name\>meine\ TUI/,"name\>meineTUI") if ARGV[1]=="meinetui"

puts=text.gsub(/name\>meine\ TUI\ Tablet/,"name\>meineTUITablet") if ARGV[1]=="meineTuiTablet"
puts=text.gsub(/name\>MyThomson\ Tablet/,"name\>MyThomsonTablet") if ARGV[1]=="MyThomsonTablet"
puts=text.gsub(/name\>MyFirstChoice\ Tablet/,"name\>MyFirstChoiceTablet") if ARGV[1]=="MyFirstChoiceTablet"
File.open(filename, "w") { |file| file << puts }

