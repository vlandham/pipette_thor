require 'pipette'

class Pipette::Runner < Pipette

  desc "test", "just a test"
  def test
    puts "test"
  end

end
