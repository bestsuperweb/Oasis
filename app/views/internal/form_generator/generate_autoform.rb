input = File.open(ARGV[0])

temp = ARGV[0].gsub(".csv","").gsub(".","-")

puts "<div class=\"panel panel-primary\">
        <div class=\"panel-heading\">
           <h4 class=\"panel-title\">
              <a data-toggle=\"collapse\" data-parent=\"#accordion\" href=\"##{temp}\">#{temp}</a>
           </h4>
        </div>
      <div id=\"#{temp}\" class=\"panel-collapse collapse in\"> "

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
    puts "
	     <div class=\"row\" style=\"width:100%\">
		<div class=\"field col-sm-4\">
		    <%= f.label :#{field_name} %><br>
		    <%= f.text_field :#{field_name}, class: \"form-control\" %>
	     </div> </div>"
  elsif type == "number"
    puts "
	     <div class=\"row\" style=\"width:100%\">
		<div class=\"field col-sm-4\">
		    <%= f.label :#{field_name} %><br>
		<%= f.number_field :#{field_name}, class: \"form-control\" %>
	     </div> </div>"
  elsif type == "select"
    if dependents.length == 0 or dependents.nil?
      puts " <div class=\"row\" style=\"width:100%\">
		  <div class=\"col-sm-4 drop-down\">
		     <%= f.label  :#{field_name} %><br>
		     <%= f.select :#{field_name}, #{extras}, { :prompt => \"Select One\" },{ class: \"form-control\"} %>
		 </div> 
		 </div>"
    else
      puts "<div class=\"row\" style=\"width:100%\">
		   <div class=\"col-sm-6 drop-down\">
		      <%= f.label  :#{field_name} %><br>
		      <%= f.select :#{field_name}, #{extras}, { :prompt => \"Select One\" },{ class: \"form-control\" , onchange: \"myFunction(this,'#{dependents[0]}')\"} %> 
		   </div>

		   <div class=\"col-sm-6\">
		   <% if !@description.internal.nil?  %>
		    <% if @description.internal.#{field_name} == \"#{dependents[0]}\" %>
		      <%= f.label  :please_specify, { id:\"label_internal_#{field_name}_specify\" } %><br>
		      <%= f.text_field :#{field_name}_specify, { class: \"form-control\", placeholder: \"If #{dependents[0]}, explain\" } %>
		    <% else %>
		      <%= f.label  :please_specify, { id:\"label_internal_#{field_name}_specify\" } %><br>
		      <%= f.text_field :#{field_name}_specify, { class: \"form-control\", placeholder: \"If #{dependents[0]}, explain\" , disabled: true } %>
		    <% end %>
		    <% else %>
		      <%= f.label  :please_specify, { id:\"label_internal_#{field_name}_specify\" } %><br>
		      <%= f.text_field :#{field_name}_specify, { class: \"form-control\", placeholder: \"If #{dependents[0]}, explain\" , disabled: true } %>
		   <% end %>
		  </div>
		</div>
      "
    end
  end
      #puts field_name, type, extras
end
		puts "</div>"
		puts "</div>"

