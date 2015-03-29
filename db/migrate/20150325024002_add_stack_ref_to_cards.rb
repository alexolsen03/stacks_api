class AddStackRefToCards < ActiveRecord::Migration
  def change
    add_reference :cards, :stack, index: true
  end
end
