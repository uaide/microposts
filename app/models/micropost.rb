class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :content, presence: true, length:{ maximum: 140}
  
  def search_items(searchWord)
      Micropost.where("content like '%" + searchWord + "%'")
  end
end
