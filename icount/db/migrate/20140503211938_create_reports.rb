class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :client
      t.string :location
      t.string :resources
      t.string :services
      t.text :notes
      t.timestamps
    end
  end
end
