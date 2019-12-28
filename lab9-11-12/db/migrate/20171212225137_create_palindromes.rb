class CreatePalindromes < ActiveRecord::Migration[5.1]
  def change
    create_table :palindromes, &:timestamps
  end
end
