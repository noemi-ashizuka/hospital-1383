class Patient
  attr_accessor :room, :id
  attr_reader :name

  def initialize(attributes = {})
    @id = attributes[:id] # integer
    @name = attributes[:name] # string
    @cured = attributes[:cured] # boolean
    @room = attributes[:room] # instance of a room
  end

  def cured?
    @cured
  end
end
