#!/usr/bin/ruby

b = `dd`.split.map &:to_i
h = Hash.new(0)
for a in b do
    h[a] += 1
end
for i in 0...75 do
    g = Marshal.load(Marshal.dump(h))
    for x in g.keys do
        m = g[x]
        if x == 0
            h[1] += m 
        elsif x.to_s.size % 2 == 0
            n = x.to_s.size / 2
            y, z = x.to_s[...n].to_i, x.to_s[n..].to_i
            h[y] += m
            h[z] += m
        else
            h[x*2024] += m
        end
        h[x] -= m
    end
end
res=0
for i, v in h do
    res += v
end
p res
