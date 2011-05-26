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

class InputOutputPipe < Pipette
  steps :one, :two

  desc "one", "first step"
  input :bam_file, :type => :string
  def one
    puts "one"
    puts input["bam_file"]
    output[:out_from_one] = "out from one"
  end

  desc "two", "second step"
  input :out_from_one, :type => :string
  def two
    puts "two"
    puts input[:out_from_one]
  end
end
