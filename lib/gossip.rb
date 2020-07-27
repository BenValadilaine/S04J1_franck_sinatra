require 'csv'

class Gossip
  attr_accessor :author, :content

  def initialize(author,content)
    @author = author
    @content = content
  end

  def save
    CSV.open("./db/gossip.csv", "ab") do |csv|
      csv << [author,content]
    end
  end

  def self.all
    all_gossips = Array.new
    CSV.read("./db/gossip.csv").each do |line|
      all_gossips << Gossip.new(line[0], line[1])
    end
    return all_gossips
  end

  def self.find(id)
    id = id.to_i
    all_gossips = self.all
    return all_gossips[id]
  end

  def update

  end

end
