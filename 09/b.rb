#!/usr/bin/ruby

a=gets.chomp.chars
s=[]
k=0
a.each{|c| 
    if k%2==0
        s += [[(k/2), (c.ord-'0'.ord)]]
    else
        s += [[-1, (c.ord-'0'.ord)]]
    end
    k += 1
}
for j in (0...s.size).to_a.reverse do
    for i in (0...j) do 
        d = s[i][1] - s[j][1]
        if s[i][0] == -1 and s[j][0] != -1 and d >= 0
            if d == 0
                s[i], s[j] = s[j], s[i]
            else
                s = s[..(i-1)] + [s[j]] + [[-1, d]] + s[(i+1)..(j-1)] + [[-1, s[j][1]]] + s[(j+1)..]
            end
        end
    end
end
ss = [] 
for c in s do
    ss += [c[0]] * c[1]
end
res=0
i=0
for c in ss do
    if c != -1 
        res += c*i
    end
    i+=1
end
p res
