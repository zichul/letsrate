class CreateRates < ActiveRecord::Migration

  def change
    create_table :rates do |t|
      t.belongs_to :rater
      t.belongs_to :rateable, :polymorphic => true
      t.belongs_to :rating_scope, :polymorphic => true
      t.float :stars, :null => false
      t.string :dimension
      t.timestamps
    end

    add_index :rates, :rater_id
    add_index :rates, [:rating_scope_id, :rateable_type]
    add_index :rates, [:rateable_id, :rateable_type]
  end
end
