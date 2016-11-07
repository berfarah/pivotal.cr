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
      end
    end
  end
end
