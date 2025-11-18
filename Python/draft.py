import re

#create a string with ones in it
my_string = "1, 2, 3, 2, 1, asdf, reqw, 1, 1, abc, xyz"
#replace the 1s with the word "one"
regEx1 = re.sub(r'1', 'one', my_string)
#print results
print(regEx1)

add2 = lambda x: x + 2
print (add2(12))