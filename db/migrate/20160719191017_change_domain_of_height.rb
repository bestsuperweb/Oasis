class ChangeDomainOfHeight < ActiveRecord::Migration
  def change
    def up
     change_column :mother_datum, :height, :float 
    end
    def down
     change_column :mother_datum, :height, :integer
    end
  end
end
