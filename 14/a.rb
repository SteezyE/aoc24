#!/usr/bin/ruby

a=`dd`.split(?\n).map{|s| s.scan(/(\-?\d+)\,(\-?\d+).*?(\-?\d+)\,(\-?\d+)/)[0].map &:to_i}
n, m, cnt = 101, 103, 100
def adv(x, dx, cnt, mod)
    if dx >= 0
        x = (x + dx * cnt) % mod 
    else
        x = (x - ((-dx * cnt) % mod)) % mod
    end
    x 
end
d = (0...4).map{|x|0} 
a.map{|x|[adv(x[0], x[2], cnt, n), adv(x[1], x[3], cnt, m)]}.each{|x,y|
    if x < n/2 and y < m/2
        d[0] += 1 
    elsif x > n/2 and y < m/2
        d[1] += 1 
    elsif x > n/2 and y > m/2
        d[2] += 1 
    elsif x < n/2 and y > m/2
        d[3] += 1 
    end
}
p d.reduce(:*)
