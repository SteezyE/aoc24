#!/usr/bin/ruby
require 'set'

v = `dd`.split
$n, $m = v.size, v[0].size
dx = [-1, 0, 1,  0]
dy = [ 0, 1, 0, -1]
def invalid(x, y)
    x < 0 or x == $n or y < 0 or y == $m
end
for i in 0...$n do
   for j in 0...$m do 
        if v[i][j] == '^'
            s = Set.new 
            x, y = i, j 
            d = 0 
            loop do
                if invalid(x, y) 
                    p s.size
                    exit 
                elsif not invalid(x+dx[d], y+dy[d]) and v[x+dx[d]][y+dy[d]] == '#'
                    d = (d+1) % 4
                end 
                s.add([x, y])
                x += dx[d]  
                y += dy[d]
            end 
        end
    end
end
