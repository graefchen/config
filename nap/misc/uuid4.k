/ works on the kone k interpreter
uuid:{
  / The hex digits in order
  h:"0123456789abcdef"
  
  / Create a string 36 characters long, each on selected at random
  / from the hex digits by selecting 36 random numbers from 0 to 15
  / and using those as indices into the hex digits above.
  t:h[36 _draw 16]
  
  / Replace the digits where dashes should be with dashes.
  / And force the version nybble to be 4, meaning random UUID.
  t[8 13 18 23 14]:"----4"
  
  / Force the variant nybble to be "RFC 4122".
  t[19]:"8888888889abbbbb"[h?t[19]]
  
  / Return the UUID string.
  t}
