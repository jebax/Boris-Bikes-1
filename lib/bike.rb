class Bike
  def initialize
    @working = true
  end

  def working?
    @working
  end

  def report_as_broken
    @working = false
  end
end
