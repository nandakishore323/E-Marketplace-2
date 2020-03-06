class AddSubjectToProducts < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :subject, :string
  end
end
