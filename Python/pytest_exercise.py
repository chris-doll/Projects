#Use Pytest on a method
import pytest
from math import pi

def findCircumference(r):
    return 2*pi*r
def test_Circumference():
    assert findCircumference(10) == 2*pi*10
def test_Circumference2():
    assert findCircumference(10) == 2*pi*20