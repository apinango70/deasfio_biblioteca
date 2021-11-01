class CreateBibliotecas < ActiveRecord::Migration[6.1]
  def change
    create_table :bibliotecas do |t|
      t.string :titulo
      t.string :autor
      t.string :estado
      t.date :fecha_prestamo
      t.date :fecha_devolucion

      t.timestamps
    end
  end
end
