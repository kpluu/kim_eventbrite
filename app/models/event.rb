class Event < ApplicationRecord
    
    validate :start_date_cannot_be_in_the_past, :duration_multiple_5
    validates :start_date, presence: true
    validates :duration, presence: true, numericality: { greater_than: 0 }
    validates :title, presence: true, :length => { :in => 5..140}
    validates :description, presence: true, :length => { :in => 1..1000}
    validates :price, presence: true, :length => { :in => 1..1000}
    validates :location, presence: true

    belongs_to :admin, class_name: "User"
    has_many :attendances, dependent: :destroy
    has_many :users, through: :attendances


    def start_date_cannot_be_in_the_past
        if !start_date.blank? and start_date < Date.today
        errors.add(:start_date, "can't be in the past")
        end
    end

    def duration_multiple_5
        if duration % 5 != 0
        errors.add(:duration, "must be multiple of five")
        end
    end

end
