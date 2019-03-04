struct School {
    var name: String
    var yearGroups: [YearGroup]
}

struct YearGroup {
    var name: String
    var pupils: [Pupil]
}

struct Pupil {
    var name: String
    var age: Int
}

let matt = Pupil(name: "Matt", age: 12)
let anna = Pupil(name: "Anna", age: 14)
let ben = Pupil(name: "Ben", age: 12)
let carol = Pupil(name: "Carol", age: 14)

let year1 = YearGroup(name: "Year One", pupils: [matt, ben])
let year2 = YearGroup(name: "Year Two", pupils: [anna, carol])

let swiftSchool = School(name: "Swift School", yearGroups: [year1, year2])

//Flat map takes a year group and returns a new Sequence, in our case an array of pupils
//We can use trailing closure syntax and immediately being the closure after the method
//As the closure is the last parameter in the function declaration
let allPupils = swiftSchool.yearGroups.flatMap { (yearGroup) -> [Pupil] in
    return yearGroup.pupils
}

print(allPupils)
// As our closure is a single line we can drop the return keyword
let allPupils2 = swiftSchool.yearGroups.flatMap { (yearGroup) -> [Pupil] in
    yearGroup.pupils
}

print(allPupils2)

//We can also use anonymous types by dropping the closure arguments
//These can be accessed using the $ syntax $0 being the first, $1 being the second etc.
let allPupils3 = swiftSchool.yearGroups.flatMap { $0.pupils }

print(allPupils3)

//Chaining functions that return values is a very functional style
let allPupilsCalledBen = swiftSchool.yearGroups.flatMap { $0.pupils }.filter { $0.name == "Ben" }
print(allPupilsCalledBen)

extension School {
    func allPupils(withName name: String) -> [Pupil] {
        return yearGroups.flatMap { $0.pupils }.filter { $0.name == name }
    }
}

print(swiftSchool.allPupils(withName: "Anna"))

