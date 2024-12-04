#!/usr/bin/ruby

def read_in()
    s = [] 
    gets
    n = $_.length - 1
    m = 1
    s += ["*" * (n + 8)]
    s += ["*" * (n + 8)]
    s += ["*" * (n + 8)]
    s += ["*" * (n + 8)]
    s += ["****" + $_.chomp + "****" ]
    while gets do 
        s += ["****" + $_.chomp + "****"]
        m += 1
    end
    s += ["*" * (n + 8)]
    s += ["*" * (n + 8)]
    s += ["*" * (n + 8)]
    s += ["*" * (n + 8)]
    return n, m, s
end

m, n, $s = read_in()
res = 0
$dx = [-1, 1, -1, 1]
$dy = [-1, -1, 1, 1]

def check(x, y)
    return false if $s[x][y] != 'A' 
    a = $s[x+$dx[0]][y+$dy[0]]+$s[x+$dx[3]][y+$dy[3]]
    b = $s[x+$dx[1]][y+$dy[1]]+$s[x+$dx[2]][y+$dy[2]]
    (a == "SM" or a == "MS") and (b == "SM" or b == "MS")
end

for i in 0...n do
    for j in 0...m do 
            res += 1 if check(i+4, j+4)
    end
end
p res
