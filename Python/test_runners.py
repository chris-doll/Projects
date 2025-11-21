#Use test runner unittest and create a test for assertIsInstance
import unittest

class Human:
    legs = 2
    
class Car:
    wheels = 4

class TestInstance(unittest.TestCase):
    def testEmpty1(self):
        value = Human()
        message = "This is not an instance!"
        self.assertIsInstance(value, Human, message)

    def testEmpty2(self):
        value = Human()
        message = "This is not an instance!"
        self.assertIsInstance(value, Car, message)

unittest.main()