 class Test < ApplicationRecord
   belongs_to :category
   belongs_to :author, class_name: 'User', foreign_key: :author_id

 has_many :questions, dependent: :destroy
   has_many :attempts
   has_many :users, through: :attempts

   def self.find_by_category_name(name)
     joins(:category).where(categories: { title: name })
                     .order(title: :desc)
                     .pluck(:title)
   end
 end
