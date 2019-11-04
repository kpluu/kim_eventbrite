class Event < ApplicationRecord
    validate :start_date, :duration, :title, :description, :price, :location, presence: true
    validate :start_date_cannot_be_in_the_past
    validate :duration_multiple_5, :numericality => { :only_integer => true } 
    validate :title, :length => { :in => 5..140}
    validate :description, :length => { :in => 1..1000}
    validate :price, :numericality => { :only_integer => true } :greater_than => 1 :less_than =>1
    validate :location

    belongs_to :user
    has_many :attendances
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
