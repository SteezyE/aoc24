#!/usr/bin/ruby

a = $<.map{|x| x.split.map &:to_i}
res = 0
cnt = 0
a.each{|x|    
    cnt += 1 
    p cnt
    n = x.size-2 
    for i in 0...(1<<(2*n)) do
        cur = x[1]
        next if (0...n).map{|j| ((1 << j) & i) == 0 and ((1 << (j+n)) & i) == 0}.any?
        for j in 0...n do
            if ((1 << j) & i) > 0 and ((1 << (j+n)) & i) > 0
                cur += x[j+2]
            elsif ((1 << j) & i) > 0
                cur *= x[j+2]
            elsif ((1 << (j+n)) & i) > 0
                cur = 10.pow(Math.log10(x[j+2]).to_i+1)*cur+x[j+2]
            end
            break if cur > x[0]
        end 
        if cur == x[0]
            res += x[0] 
            break
        end 
    end
}
p res
