#read from  brand-ntc-ios/features/strings/languagefolder/file
def read_copy_from_user_details(arg1)
  filename =$g_user_details
#    my_log(arg1 +" " +filename, 5)
  properties = {}
  File.open(filename, 'r') do |properties_file|
    properties_file.read.each_line do |line|
      line.strip!
      if (line[0] != ?# and line[0] != ?=)
        i = line.index('=')
        if (i)
          properties[line[0..i - 1].strip] = line[i + 1..-1].strip
        else
          properties[line] = ''
        end
      end
    end
    return properties[arg1]
  end
end

