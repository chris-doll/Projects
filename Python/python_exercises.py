#Lab 1
mylist = ["a", "b", "c"]
mytuple = ("d", "e", "f")
myset = {"one", "two", "three"}
mydictionary = {"one": "1", "two": "2", "three": "3"}

for item in mylist:
    print(item)
print(type(mylist))

for item in mytuple:
    print(item)
print(type(mytuple))

for item in myset:
    print(item)
print(type(myset))

for key, value in mydictionary.items():
    print(key, value)
print(type(mydictionary))

#Lab 2
def pay():
    hourly_rate = float(input("What is your hourly rate?": )) # $ 60
    hours_worked = float(input ("How many hours did you work this week?": )) # 40 hrs
    days_pay = (hourly_rate * hours_worked) / 8 # assuming 8 hr work day
    print(days_pay)
pay()

#Lab 3
user_logged_in = True
gold_member_status = True

def user_status():
    if (user_logged_in == True and gold_member_status == False):
        print ("User logged in")
    elif (user_logged_in == False and gold_member_status == False):
        print ("Please log in")
    elif (user_logged_in == True and gold_member_status == True):
        print ("Welcome, Gold Member!")
    elif (user_logged_in == False and gold_member_status == True):
        print ("Please log in, Gold Member.")
user_status()

#Lab 4
my_list = ["ruby", "emerald", "opal", "diamond", "sapphire"]
for item in my_list:
    if item == "diamond":
        print ("Shine bright like a diamond")
    else:
        print (item)

print()

i = 0
while i < len(my_list):
    print (my_list[i])
    if my_list[i] == "diamond":
        print("Diamonds are forever")
        break
    i += 1
