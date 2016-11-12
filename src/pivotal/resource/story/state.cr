module Pivotal
  module Resource
    class Story
      enum State
        Planned
        Unscheduled
        Unstarted
        Started
        Finished
        Rejected
        Delivered
        Accepted

        def to_json
          to_s.underscore
        end
      end
    end
  end
end
