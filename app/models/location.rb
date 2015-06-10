class Location < ActiveRecord::Base

  REGEXP_MATCH = /(\d+)-(\d+)-(\d+)/

  def name
    "#{row}-#{rack}-#{shelf}"
  end

  def self.find_by_name(name)
    row, rack, shelf = name.match(REGEXP_MATCH).captures
    where(:row => row, :rack => rack, :shelf => shelf).first
  end

end
