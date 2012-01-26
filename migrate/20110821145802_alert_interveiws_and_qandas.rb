class AlertInterveiwsAndQandas < ActiveRecord::Migration
  def self.up
     remove_column :interviews, :id
     remove_column :qandas, :id
     add_column :interviews, :id_interview, :integer
     add_column :qandas, :id_qanda, :integer
  end

  def self.down
  end
end
