class Car:
    wheels = 4
    def __init__(self, make, model, color):
        self.make = make
        self.model = model
        self.color = color
    
    def carinfo(self):
        print("Your car make is: " + self.make)
        print("Your car model is: " + self.model)
        print("You car's color is: " + self.color)
    
    @staticmethod
    def setTemp(temperature):
        print("Setting temperature to: " + str(temperature))
    

my_car = Car("Toyota", "4Runner", "White")

print(my_car.wheels)
my_car.carinfo()
my_car.setTemp(70)
    

    



