# frozen_string_literal: true

module Characters
    def charmap(string)
        string.split('').group_by(&:itself).transform_values(&:size)
    end
end
