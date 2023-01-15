# frozen_string_literal: true

class Availability < ApplicationRecord
  has_one :appointment, dependent: :destroy
  belongs_to :calendar

  validates :start_time, :end_time, presence: true
  validates :reserved, inclusion: { in: [true, false] }

  validate :start_time_in_future
  validate :end_time_in_future
  validate :time_slot_overlap
  validate :time_slot_length

  attribute :time_slot

  def self.upcoming_appointments
    includes(:appointment).where(reserved: true, start_time: Time.current..)
  end

  private

  def start_time_in_future
    return if start_time&.future?

    errors.add(:start_time, 'must be in the future')
  end

  def end_time_in_future
    return if end_time&.future?

    errors.add(:end_time, 'must be in the future')
  end

  def time_slot_overlap
    return if calendar.nil? || (start_time.nil? && end_time.nil?)

    overlapping = calendar.availabilities.where(end_time: start_time..)

    errors.add(:time_slot, 'can not overlap other availability') if overlapping.any?
  end

  # The float comparison here is for time, it is fine
  # rubocop:disable Lint/FloatComparison
  def time_slot_length
    return if end_time.nil? || start_time.nil?
    return if duration.ceil.to_f == 2.hours.ceil.to_f

    errors.add(:time_slot, 'must be exactly two hours long')
  end
  # rubocop:enable Lint/FloatComparison

  def duration
    end_time.to_f - start_time.to_f
  end
end
