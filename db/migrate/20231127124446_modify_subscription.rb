class ModifySubscription < ActiveRecord::Migration[7.0]
  def change
    remove_column :subscriptions, :section_id, :bigint

    add_column :subscriptions, :entity_id, :bigint
    add_column :subscriptions, :entity_type, :string
    add_index :subscriptions, [:entity_id, :entity_type]

    add_column :subscriptions, :approved, :boolean, default: false
  end
end
