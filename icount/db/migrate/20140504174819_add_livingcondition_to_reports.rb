class AddLivingconditionToReports < ActiveRecord::Migration
  def change
    add_column :reports, :livingcondition, :string
    add_column :reports, :gender, :string
    add_column :reports, :ethnicity, :string
    add_column :reports, :age, :string
    add_column :reports, :needs, :string
  end
end
