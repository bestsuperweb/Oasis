input = File.open(ARGV[0])
section = ARGV[1]

master_name = "@description.internal"

puts " <div class=\"col-sm-3\">
         <div class=\"panel panel-internal squarish\">
             <div class=\"panel-heading panel-heading-internal small-heading squarish\">
               #{section.capitalize}
             </div>
         <div class=\"panel-body panel-body-internal squarish\">"

input.each_line do |line|
  columns = line.split("\t")
  field_name = columns[0].downcase.gsub(" ","_")
  type = columns[1]
  if !columns[2].nil?
    extras = columns[2].chomp.gsub("\"","").gsub("[","").gsub("]","").split(",")
    extras.map!(&:intern.to_sym)
  end
  if !columns[3].nil?
    dependents = columns[3].chomp.split(",")
    dependents.map!(&:intern.to_sym)
  end
  if type == "text"
    puts "
            <div class=\"row\">
              <div class=\"col-sm-6 custom-prop\">
                <strong>#{field_name.capitalize} : </strong>
              </div>
              <div class=\"col-sm-6 custom-val\">
                 <%= @description.internal.#{field_name}%>               
              </div>
	    </div>
	 "
  elsif type == "number"
    puts "
            <div class=\"row\">
              <div class=\"col-sm-6 custom-prop\">
                <strong>#{field_name.capitalize} : </strong>
              </div>
              <div class=\"col-sm-6 custom-val\">
                 <%= @description.internal.#{field_name}%>               
              </div>
	    </div>
         "
  elsif type == "select"
    if dependents.length == 0 or dependents.nil?
      puts " 
            <div class=\"row\">
              <div class=\"col-sm-6 custom-prop\">
                <strong>#{field_name.capitalize} : </strong>
              </div>
              <div class=\"col-sm-6 custom-val\">
                 <%= @description.internal.#{field_name}%>               
              </div>
	    </div>
           "
    else
      puts "
            <div class=\"row\">
               <div class=\"col-sm-6 custom-prop\">
                  <strong>#{field_name.capitalize}: </strong>
               </div>
               <div class=\"col-sm-6 custom-val\">
                  <%= ( @description.internal.#{field_name}_specify.nil? or @description.internal.#{field_name}_specify == \"\" ) ?  @description.internal.#{field_name} :  @description.internal.#{field_name}_specify 
                  %>  
               </div> 
             </div>
           "
    end
    #    elsif type == "checkbox"
    #	     puts " 
    #	     <div class=\"row\">
    #	      <div class=\"col-sm-6 no-pad small custom-prop\">
    #                     <%= f.label  :Normal, class: \"small\" %><br>
    #              </div>		     
    #              <div class=\"col-sm-6 no-pad custom-val\">
    #                 <%= f.check_box :#{field_name}, { class: \"form-control input-sm\" , :onchange => \"makeNormal(this, '.#{section}')\" } %>
    #	      </div>
    #	     </div>
    #	     "
  end
  #puts field_name, type, extras
end

puts "</div>"
puts "</div>"
puts "</div>"
