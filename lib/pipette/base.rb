
class Pipette < Thor
  class << self
    # Provide the order of the steps to execute
    #   steps :one, :two, :three
    # ==== Parameters
    # Array[Symbol]
    #
    def steps(*step_list)
      @steps ||= []
      steps = [step_list].flatten
      @steps = steps unless steps.empty?
      @steps
    end

    def input(name = nil, options = {})
      @inputs ||= []
      if name
        @inputs << name
        method_option(name, options)
      end
      @inputs
    end
  end

  def initialize(args=[], options={}, config={})
    super(args,options,config)
  end

  no_tasks do # hide from base Thor
    # Returns the steps for this pipeline
    #
    # ==== Returns
    # Array[Symbol]
    #
    def steps
      self.class.steps
    end

    # Returns the steps to be executed in this
    # run of the pipeline. By default, all steps
    # are executed in the order they are provided.
    # You can limit the steps to be run via options
    # to the start task
    #
    # ==== Returns
    # Array[Symbol]
    #
    def valid_steps
      @valid_steps ||= self.steps
    end

    # Set valid steps for the run
    # This method will transform string steps to
    # symbol steps. if input is nil, valid steps
    # are not changed
    #
    # ==== Parameters
    # Array[Symbol|String]
    #
    def valid_steps= valid_steps
      unless valid_steps.nil?
        valid_steps = valid_steps.collect {|s| s.to_sym}
        valid_steps = steps.select {|s| valid_steps.include? s}
        @valid_steps = valid_steps
      end
    end

    def input
      self.options.select {|key, value| self.class.input.include? key.to_sym}
    end

    def output
      @output ||= {}
    end
  end
end
