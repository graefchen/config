syntax match column9 /.\{-}\(;\|$\)/ nextgroup=escaped_column0,column0
syntax match escaped_column9 / *"\(\([^"]\|\n\)*""\)*\([^"]\|\n\)*" *\(;\|$\)/ nextgroup=escaped_column0,column0
syntax match column8 /.\{-}\(;\|$\)/ nextgroup=escaped_column9,column9
syntax match escaped_column8 / *"\(\([^"]\|\n\)*""\)*\([^"]\|\n\)*" *\(;\|$\)/ nextgroup=escaped_column9,column9
syntax match column7 /.\{-}\(;\|$\)/ nextgroup=escaped_column8,column8
syntax match escaped_column7 / *"\(\([^"]\|\n\)*""\)*\([^"]\|\n\)*" *\(;\|$\)/ nextgroup=escaped_column8,column8
syntax match column6 /.\{-}\(;\|$\)/ nextgroup=escaped_column7,column7
syntax match escaped_column6 / *"\(\([^"]\|\n\)*""\)*\([^"]\|\n\)*" *\(;\|$\)/ nextgroup=escaped_column7,column7
syntax match column5 /.\{-}\(;\|$\)/ nextgroup=escaped_column6,column6
syntax match escaped_column5 / *"\(\([^"]\|\n\)*""\)*\([^"]\|\n\)*" *\(;\|$\)/ nextgroup=escaped_column6,column6
syntax match column4 /.\{-}\(;\|$\)/ nextgroup=escaped_column5,column5
syntax match escaped_column4 / *"\(\([^"]\|\n\)*""\)*\([^"]\|\n\)*" *\(;\|$\)/ nextgroup=escaped_column5,column5
syntax match column3 /.\{-}\(;\|$\)/ nextgroup=escaped_column4,column4
syntax match escaped_column3 / *"\(\([^"]\|\n\)*""\)*\([^"]\|\n\)*" *\(;\|$\)/ nextgroup=escaped_column4,column4
syntax match column2 /.\{-}\(;\|$\)/ nextgroup=escaped_column3,column3
syntax match escaped_column2 / *"\(\([^"]\|\n\)*""\)*\([^"]\|\n\)*" *\(;\|$\)/ nextgroup=escaped_column3,column3
syntax match column1 /.\{-}\(;\|$\)/ nextgroup=escaped_column2,column2
syntax match escaped_column1 / *"\(\([^"]\|\n\)*""\)*\([^"]\|\n\)*" *\(;\|$\)/ nextgroup=escaped_column2,column2
syntax match column0 /.\{-}\(;\|$\)/ nextgroup=escaped_column1,column1
syntax match escaped_column0 / *"\(\([^"]\|\n\)*""\)*\([^"]\|\n\)*" *\(;\|$\)/ nextgroup=escaped_column1,column1