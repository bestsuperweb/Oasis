module FullReportHelper
  def nil.capitalize
    return nil
  end
  def get_view_from_array prop,value,specify
	   return(
	     ERB.new("<tr>
		       <td>
		        <strong>
		         <%= prop %>
		        </strong>
		       </td>
		       <td>
		        <%= value %>
		       </td>
		       <td>
		        <i>
		          <%= specify %>
		        </i>
                       </td>
		      </tr>").result(binding))
  end
end
