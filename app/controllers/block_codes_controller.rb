class BlockCodesController < ApplicationController

   before_action :set_block_codes, only: [:show, :edit, :update, :destroy, :create ]

   def show
   end

   def new
     @block_code = BlockCode.new
   end

   def update
   end

   def create


    @description = Description.find(params[:id])

    string_to_store = "" #String.new()

    (0...params[:block_code][:block_number].size).each do |i| 
      string_to_store << "#{params[:block_code][:block_number][i]}_____"
      string_to_store << "#{params[:block_code][:block_description][i]}_____"
      string_to_store << "#{params[:block_code][:microscopic_description][i]}_____"
      string_to_store << "~~~~~"
    end

    if @description.internal.nil?
      internal = Internal.new()
      @description.internal = internal
      authorize! :create, @description.internal
      @description.internal.save
    end

    @description.internal.block_code_composite = string_to_store
    authorize! :update, @description.internal
    @description.internal.save

    if params[:originating_uri].include?("internal")
      redirect_to params[:originating_uri]
    else
      redirect_to "#{description_path}#blockcodes"
    end

   end

   private 
    def set_block_codes
      @description = Description.find(params[:id])
    end

end

