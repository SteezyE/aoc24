#!/usr/bin/ruby

a = `dd`.split.map &:to_i
for i in 0...35 do
    a = a.map{|x| 
        if x == 0 
            1
        elsif x.to_s.size % 2 == 0
            n = x.to_s.size / 2
            [x.to_s[...n].to_i, x.to_s[n..].to_i]
        else
            x * 2024 
        end
    }.flatten
end
p a.size
