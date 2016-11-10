module Pivotal
  module Resource
    class Iteration
      enum State
        Done
        Current
        Backlog
        CurrentBacklog
        DoneCurrent

        def to_json(io)
          io << %("to_s.underscore")
        end
      end
    end
  end
end
