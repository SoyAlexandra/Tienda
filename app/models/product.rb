class Product < ActiveRecord::Base
	validates :ref, :name, :price, :description, :quantity, :size, :color, presence: true
	validates :ref, uniqueness: {message: "referencia ya existe"}
	validates :price, numericality: {only_integer: true, greater_than:0, message: "no vendemos nada de valor 0"}
	validates :size, length: {in: 1..3, message: "debe tener entre 1 y 3 caracteres"}

	has_many :line_items
end
