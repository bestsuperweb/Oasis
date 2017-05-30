module ExternalHelper
  def ExternalHelper.gw_to_data 
   data_store = Hash.new() 
   data_store = { 
     "data" => {
       "bw_mean" => 313,
       "bw_stdev" => 139,
       "cr_length" => 18,
       "cr_stdev" => 2,
       "ch_length" => 24.9,
       "ch_stdev" => 0.6
     }
   }
    return data_store
  end
end
