[w3c notes](https://www.w3schools.com/python/python_inheritance.asp)

Assume parent class named `Person`
Want to create child class `Student` that inherits the functionality from another class.

### Parent class:
```
class Person:  
  def __init__(self, fname, lname):  
    self.firstname = fname  
    self.lastname = lname  
  
  def printname(self):  
    print(self.firstname, self.lastname)  
  
#Use the Person class to create an object, and then execute the printname method:  
  
x = Person("John", "Doe")  
x.printname()
```

### Child class:
```
class Student(Person):  
  pass
```

### Result of calling parent method from a child object
```
x = Student("Mike", "Olsen")  
x.printname()
```