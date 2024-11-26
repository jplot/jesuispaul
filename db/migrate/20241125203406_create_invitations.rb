class CreateInvitations < ActiveRecord::Migration[7.2]
  def change
    create_table :invitations do |t|
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.string :email
      t.string :phone_number
      t.string :comment
      t.string :aasm_state, default: 'pending', null: false, index: true

      t.timestamps
    end
  end
end
