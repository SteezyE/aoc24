#!/usr/bin/ruby

a=gets.chomp.chars
s=[]
i=0
a.each{|c| 
    if i%2==0
        s += [(i/2)]*(c.ord-'0'.ord)
    else
        s+=[-1]*(c.ord-'0'.ord)
    end
    i += 1
}
i=0
j=s.size-1
while i<=j do
    if s[i] == -1 and s[j] != -1 
        s[i], s[j] = s[j], s[i]
    elsif s[i] != -1 
        i += 1 
    elsif s[j] == -1
        j -= 1
    end
end
res=0
i=0
for c in s do
    break if c == -1 
    res += c*i
    i+=1
end
p res
