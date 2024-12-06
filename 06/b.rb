#!/usr/bin/ruby
require 'set'

$v = `dd`.split
$n, $m = $v.size, $v[0].size
$dx = [-1, 0, 1,  0]
$dy = [ 0, 1, 0, -1]
def invalid(x, y)
    x < 0 or x == $n or y < 0 or y == $m
end

s = Set.new 
flag = false
$g = []
for i in 0...$n do
   for j in 0...$m do 
        if $v[i][j] == '^'
            $g = [i, j]
            x, y = i, j 
            d = 0 
            loop do
                if invalid(x, y) 
                    break
                elsif not invalid(x+$dx[d], y+$dy[d]) and $v[x+$dx[d]][y+$dy[d]] == '#'
                    d = (d+1) % 4
                end 
                s.add([x, y])
                x += $dx[d]  
                y += $dy[d]
            end 
            flag = true
            break
        end
    end
    break if flag == true
end
s.delete($g)

def endless(t)
    $v[t[0]][t[1]] = '#'
    x, y = *$g
    d = 0 
    vis = Set.new
    loop do
        if invalid(x, y) 
            $v[t[0]][t[1]] = '.'
            return false
        elsif not invalid(x+$dx[d], y+$dy[d]) and $v[x+$dx[d]][y+$dy[d]] == '#'
            l = [x+$dx[d], y+$dy[d], d]
            break if vis.include?(l)
            vis.add(l)
            d = (d+1) % 4
        end
        x += $dx[d]
        y += $dy[d]
    end
    $v[t[0]][t[1]] = '.'
    return true
end

res = 0
for t in s do
    res += 1 if endless(t)  
end
p res
