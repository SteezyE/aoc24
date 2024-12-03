#!/usr/bin/ruby

def mul(a, b)
    a * b
end
inss = `dd`.scan(/don\'t\(\)|do\(\)|mul\(\d{1,3}\,\d{1,3}\)/)
sum = 0
enbld = true 
for ins in inss do
    if ins[2] == 'n'
        enbld = false      
    elsif ins[2] == '('  
        enbld = true 
    else
        sum += eval(ins) if enbld == true
    end
end
p sum
