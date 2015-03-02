class AddAdressToAlbums < ActiveRecord::Migration
  def change
    add_column :albums, :address, :string
  end
end
