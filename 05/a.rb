#!/usr/bin/ruby

a,b = `dd`.split("\n\n")
a = a.split.map{|x|x.split('|').map &:to_i}
b = b.split.map{|x|x.split(',').map &:to_i}
$h = {}
$h.default = []
a.each{|x,y| $h[y] += [x]}
def correct(c, i)
    $h[c[i]].each{|x| 
        for j in i+1...c.size do 
           return false if c[j] == x 
        end
    }
    return true
end
res = 0
for t in b do
    n = t.size
    res += t[n/2] if (0...n).map{|i| correct(t, i)}.all?
end
p res
