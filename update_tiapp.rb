filename="../meine.tui/tiapp.xml"
text = File.read(filename)
puts=text.gsub(/name\>meine\ TUI/,"name\>meineTUI")
File.open(filename, "w") { |file| file << puts }
