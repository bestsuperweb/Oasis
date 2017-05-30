input = File.open(ARGV[0])

temp = ARGV[0].gsub(".csv","").gsub(".","-")

puts "
   <div class=\"col-sm-3\">
    <h3> #{temp} </h3>"

input.each_line do |line|
  columns = line.split("\t")
  field_name = columns[1].downcase.gsub(" ","_")
  type = columns[2]

  if !columns[3].nil?
    extras = columns[3].chomp.gsub("\"","").gsub("[","").gsub("]","").split(",")
    extras.map!(&:intern.to_sym)
  end
  if !columns[4].nil?
    dependents = columns[4].chomp.split(",")
    dependents.map!(&:intern.to_sym)
  end


  if type == "text"
    puts "<div><span><strong>#{field_name.gsub("_"," ").capitalize}: </strong><%=@description.internal.#{field_name}%></span></div>"
  elsif type == "number"
    puts "<div><span><strong>#{field_name.gsub("_"," ").capitalize}: </strong><%=@description.internal.#{field_name}%></span></div>"
  elsif type == "select"
    if dependents.length == 0 or dependents.nil?
      puts "<div><span><strong>#{field_name.gsub("_"," ").capitalize}: </strong><%=@description.internal.#{field_name}%></span></div>"
    else
      puts "<div><span><strong>#{field_name.gsub("_"," ").capitalize}: </strong><%=@description.internal.#{field_name}%></span></div>"
      puts "<div><span><%=@description.internal.#{field_name}_specify%></span></div>"
    end
  end
end
puts "</div>"
