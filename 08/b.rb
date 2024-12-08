#!/usr/bin/ruby

require 'set'
a=`dd`.split
b=Array.new(128)
n=a.size
m=a[0].size
c=Set.new
for i in 0...n do
    for j in 0...m do
        if a[i][j] != '.'
            t = a[i][j].ord
            c.add(t)
            if b[t].nil?
                b[t] = [[i, j]]
            else
                b[t] += [[i, j]]
            end
        end
    end
end
def inside(x, y, n, m)
    return 0 <= x && x < n && 0 <= y && y < m
end
res=Set.new
for t in c do
    k = b[t].size   
    for i in 0...k do
        for j in (i+1)...k do
            p1, p2 = b[t][i], b[t][j]
            res.add(p1)
            res.add(p2)
            diff = [p1[0] - p2[0], p1[1] - p2[1]] 
            x1, y1 = *p1
            x2, y2 = *p2
            loop do 
                x1, y1, x2, y2 = x1+diff[0], y1+diff[1], x2-diff[0], y2-diff[1]
                res.add([x1, y1]) if inside(x1, y1, n, m)
                res.add([x2, y2]) if inside(x2, y2, n, m)
                break if not inside(x1, y1, n, m) and not inside(x2, y2, n, m) 
            end
        end
    end
end
p res.size
