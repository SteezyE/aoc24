#!/usr/bin/ruby

a = $<.map{|x| x.split.map &:to_i}
res = 0
a.each{|x|    
    n = x.size-2 
    for i in 0...(1<<n) do
        cur = x[1]
        for j in 0...n do
            if ((1 << j) & i) > 0
                cur += x[j+2]
            else
                cur *= x[j+2]
            end  
        end 
        if cur == x[0]
            res += x[0] 
            break
        end 
    end
}
p res
