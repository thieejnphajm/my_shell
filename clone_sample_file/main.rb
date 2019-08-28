
# :TODO exclude the directory with the dot (hidden files)
# directories = Dir.entries(".") - ['.', '..']
directories = Dir.glob("*")

# directories = ['one', 'two', 'three']

directories.each do |dir|
  directory = "#{dir}.html"
  File.exist?(directory) && !File.directory?(directory) && File.delete(directory)
end

require 'erb'

template = ERB.new <<-EOF
  The template is very complicated
  This is line one <%= directory %>
  So complicated here
EOF

directories.each do |directory|
  file = File.new("#{directory}.html", 'w+')
  file.write(template.result(binding))
  file.close
end
