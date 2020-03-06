# frozen_string_literal: true

module Characters
    def charmap(string)
        string.split('').group_by(&:itself).transform_values(&:size)
    end

    def string_distance(a, b)
        amap = charmap(a)
        bmap = charmap(b)

        (amap.keys + bmap.keys).uniq
                               .reduce(0) { |acc, key| acc + ((amap[key] || 0) - (bmap[key] || 0)).abs }
    end
end
