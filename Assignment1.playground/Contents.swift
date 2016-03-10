//: Playground - noun: a place where people can play

import UIKit
import Foundation

// Optional Types
var optionalString = Optional("Hello")
optionalString.dynamicType
var optionalString2 : Optional<String> = "Howdy"
optionalString2.dynamicType
var optionalString3 : String?
optionalString3.dynamicType

if optionalString3 != nil
{
    optionalString3!.capitalizedString
}

// Conditional unwrap, equivalent to if statement above
optionalString3?.capitalizedString
optionalString3 = "what's up"

// Long chain
optionalString3?.capitalizedString.uppercaseString.lowercaseString.capitalizedString

// Implicitly Unwrapped Optional Types
var implicitString : String!
implicitString.dynamicType
implicitString = "tester"

// Enumerations
enum CompassDirection
{
    case North
    case South
    case East
    case West
}

// Control flow switch
let go : CompassDirection = .West

switch go
{
case .North:
    print("going north")
case .South:
    print("going south")
case .East:
    print("going east")
case .West:
    print("going west")
}

// Enumerations are value types
var direction : CompassDirection = .North
print(direction)
var savedDirection = direction
direction = .South
print(direction)
print(savedDirection)

// Structs
struct Pet
{
    var type : String
    var indoor : Bool
}

// Structs are value types
var pet = Pet(type : "Dog", indoor: true)
print(pet.type)
var savedPet = pet
pet.type = "Cat"
print(pet.type)
print(savedPet.type)

// Subscript
struct TimesTable
{
    var number : Int
    subscript(index : Int) -> Int
    {
        return number * index
    }
}

let fiveTimes = TimesTable(number: 5)
fiveTimes[5]
fiveTimes[34235]

// Classes
class Movie
{
    var genre : String
    var title : String
    
    init(genre : String, title : String)
    {
        self.genre = genre
        self.title = title
    }
    
    convenience init()
    {
        self.init(genre : "", title : "")
    }
    
    func play()
    {
        print("movie playing")
    }
    
    func pause()
    {
        print("movie paused")
    }
}

// Classes are reference types
var zootopia = Movie(genre: "Kids", title: "Zootopia")
print(zootopia.title)
var saveMovie = zootopia
zootopia.title = "Zootopia 2"
print(zootopia.title)
saveMovie.title
print(saveMovie.title)

// Inheritence
class Shape
{
    var width : Double
    var height : Double
    
    init(width : Double, height : Double)
    {
        self.width = width
        self.height = height
    }
    
    convenience init()
    {
        self.init(width : 0, height : 0)
    }
    
    func calculateArea() -> Double
    {
        return width*height
    }
    
    func color(color : String)
    {
        print("color is \(color)")
    }
}

class Rectangle : Shape
{
    
}

class Triangle : Shape
{
    final override func calculateArea() -> Double {
        return super.calculateArea()*0.5
    }
}

class RightTriangle : Triangle
{
    // can't override calculateArea() because it is final in Triangle class
}

var rect = Rectangle(width: 3, height: 10)
rect.calculateArea()

var tri = Triangle(width: 4.0, height: 5.0)
tri.calculateArea()

func colorShapeBlue(shape :Shape)
{
    let triangle = shape as? Triangle
    triangle?.color("blue")
}

// color function isn't called because rect isn't a Triangle
colorShapeBlue(rect)
// color function is called because tri is a Triangle
colorShapeBlue(tri)

// Protocols
protocol Vehicle
{
    var numberOfWheels : Int { get }
    func ride()
    func speed()
}

struct Bicycle : Vehicle
{
    var numberOfWheels : Int = 2
    
    func ride() {
        print("riding my bicycle")
    }
    
    func speed() {
        print("my bike can't speed :(")
    }
}

struct RaceCar : Vehicle
{
    var numberOfWheels : Int = 4
    
    func ride() {
        print("riding my racecar")
    }
    
    func speed() {
        print("going sooooo fast!!!!")
    }
}

func speedAway(vehicle : Vehicle)
{
    print("my vehicle has \(vehicle.numberOfWheels) wheels")
    vehicle.speed()
}

let bike = Bicycle()
let vroom = RaceCar()

speedAway(bike)
speedAway(vroom)

enum Wrong : ErrorType
{
    case YoureWrong
    case ImWrong
    case BothWrong
}

// Error Handling
func failure() throws
{
    throw Wrong.BothWrong
}

// Extension
extension String
{
    func yell(blah : String)
    {
        if !blah.isEmpty
        {
            print("eeeeeep \(self.uppercaseString) \(blah)")
        }
        else
        {
            do
            {
                try failure()
            }
            catch Wrong.BothWrong
            {
                print("Caught error caused by both parties")
            }
            catch let error as Wrong
            {
                print("\(error) occured")
            }
            catch let error
            {
                print("\(error)")
            }
        }
        
    }
}

var mad = "UUgggghhhhhhh"
mad.yell("")
mad.yell("MEEEEPERS")




