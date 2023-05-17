class OrderDetail < ApplicationRecord
  enum task_status: { impossible: 0, stay: 1, making: 2, complete: 3 }
  
  belongs_to :oreders
  belongs_to :items
  
  
end
