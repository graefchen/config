/ works on kona; from Rosettacode
gcd:{:[~x;y;_f[y;x!y]]}
/ find gcd of array
/ video: https://youtu.be/UVUjnzpQKUo
/ leetcode: https://leetcode.com/problems/find-greatest-common-divisor-of-array/description/
findgcd:{gcd[*x[<x];*x[>x]]}
