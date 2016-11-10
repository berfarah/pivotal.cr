module Pivotal
  module Resource
    class Story
      enum Type
        Feature
        Bug
        Chore
        Release

        def to_json
          to_s.underscore
        end
      end
    end
  end
end
