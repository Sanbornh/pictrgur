class Picture < ActiveRecord::Base

	scope :random, -> { order("Random()").first }
	# scope :most_recent, -> { newest_first.first }
	# scope :created_before, ->(time) { where("created_at < ?", time) }

end
