class RenameTableProductPromoToEnrollment < ActiveRecord::Migration
  def change
    rename_table :product_promos, :enrollments
  end
end
