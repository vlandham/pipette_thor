class BlankPipe < Pipette
end

class BasicPipe < Pipette
  steps :one, :two, :three

  desc "one", "first step"
  def one
    puts "one"
  end

  desc "two", "second step"
  def two
    puts "two"
  end

  desc "three", "third step"
  def three
    puts "three"
  end
end
