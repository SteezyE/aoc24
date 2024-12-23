#!/usr/bin/ruby

a=`dd`.split(?\n).map{|s| s.scan(/(\-?\d+)\,(\-?\d+).*?(\-?\d+)\,(\-?\d+)/)[0].map &:to_i}
n, m = 101, 103 
def adv(x, dx, cnt, mod)
    if dx >= 0
        x = (x + dx * cnt) % mod 
    else
        x = (x - ((-dx * cnt) % mod)) % mod
    end
    x 
end
h = n*m
for cnt in 1...h do
    d=a.map{|x|[adv(x[0], x[2], cnt, n), adv(x[1], x[3], cnt, m)]}
    v=(0...m).map{|i|'.'*n}
    flag = false
    for x in d do
        c, b = x[0], x[1]
        if v[b][c] == '.'
            v[b][c] = '1'
        else
            v[b][c] = (v[b][c].ord+1).chr
            flag = true
            break
        end
    end
    next if flag
    sleep(2)
    print("\x1B[2J")
    print("\x1B[H")
    puts v * "\n"
    puts cnt
end
