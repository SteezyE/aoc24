#!/usr/bin/ruby
require 'set'

a = `dd`.split
n = a.size
m = a[0].size

def inside(n, m, i, j)
    return (0 <= i and 0 <= j and i < n and j < m)
end

$dx = [1,  0, -1, 0]
$dy = [0, -1,  0, 1]
$s = Set.new 
def dfs(a, n, m, i, j)
    if a[i][j] == '9'
       $s.add([i, j]) 
    end
    for d in 0...4 do
        x, y = i+$dx[d], j+$dy[d]
        dfs(a, n, m, x, y) if inside(n, m, x, y) and a[x][y].ord - a[i][j].ord == 1 
    end
end  

res=0
for i in 0...n do
    for j in 0...m do
        if a[i][j] == '0'
            $s.clear
            dfs(a, n, m, i, j)
            res += $s.size 
        end
    end
end
p res
