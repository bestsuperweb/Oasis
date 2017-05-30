input = File.open(ARGV[0])

input.each_line do |line|
  # split lines in columns
  columns = line.split("\t");

  panel_name = columns[0].capitalize
  
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


  #if type == "text"
  #  puts "
  #           <div class=\"row\">
  #      	<div class=\"col-sm-6 nopad custom-prop small\">
  #      	    <%= f.label :#{field_name} , class: \"small\" %>
  #      	</div> 
  #      	<div class=\"col-sm-6 nopad custom-val\">
  #      	    <%= f.text_field :#{field_name}, class: \"form-control input-sm\" %>
  #      	</div> 
  #           </div>"

  #elsif type == "number"
  #  puts "
  #           <div class=\"row\">
  #      	<div class=\"col-sm-6 nopad custom-prop small\">
  #      	    <%= f.label :#{field_name}, class: \"small\" %>
  #      	</div> 
  #      	<div class=\"col-sm-6 nopad custom-val\">
  #      	    <%= f.number_field :#{field_name}, class: \"form-control input-sm\" %>
  #      	</div> 
  #           </div>"
  #elsif type == "select"
  #  if dependents.length == 0 or dependents.nil?
  #    puts " 
  #           <div class=\"row\">
  #      	<div class=\"col-sm-6 nopad custom-prop small drop-down\">
  #      	     <%= f.label  :#{field_name}, class: \"small\" %><br>
  #      	</div> 
  #      	<div class=\"col-sm-6 nopad custom-val\">
  #      	     <%= f.select :#{field_name}, #{extras}, { :prompt => \"Select One\" },{ class: \"form-control input-sm\"} %>
  #      	</div> 
  #           </div>"
  #  else
  #    puts "
  #          <div class=\"row\">
  #      	<div class=\"col-sm-6 nopad custom-prop small drop-down\">
  #                  <%= f.label  :#{field_name}, class: \"small\"%>
  #      	</div>
  #      	<div class=\"col-sm-6 nopad custom-val\">
  #                <%= f.select :#{field_name}, #{extras}, { :prompt => \"Select One\" },{ class: \"form-control input-sm has-dependent\" , \"dependent-selector\" => \"##{field_name}-dependent\", \"when-value\" => \"#{dependents[0]}\", \"dependent-action\" => \"show-hide\"} %>
  #              </div>
  #          </div>
  #          <div class=\"row\" id=\"#{field_name}-dependent\">
  #              <div class=\"col-sm-6 nopad custom-prop small drop-down\">
  #                   <%= f.label  :#{field_name}_specify %><br>
  #              </div>
  #              <div class=\"col-sm-6 nopad custom-val\">
  #                   <%= f.text_field :#{field_name}_specify, { class: \"form-control input-sm\", placeholder: \"If #{dependents[0]}, explain\" } %>
  #              </div>
  #          </div> 
  #       "
  #  end
  #end
end

