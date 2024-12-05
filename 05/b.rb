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
           return false, j if c[j] == x 
        end
    }
    return true, -1
end
res = 0
for t in b do
    n = t.size
    if not (0...n).map{|i| correct(t, i)[0]}.all? 
        i = n-2
        while true do
            bb, j = correct(t, i)
            if not bb
                t[i], t[j] = t[j], t[i]
                i = j
                next 
            elsif i == 0  
                break 
            end
            i -= 1
        end
        res += t[n/2] 
    end
end
p res
