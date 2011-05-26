class BlankPipe < Pipette
end

class BasicPipe < Pipette
  steps :one, :two, :three

  desc "one", "first step"
  def one
    puts BasicPipe::all_tasks
  end
end
