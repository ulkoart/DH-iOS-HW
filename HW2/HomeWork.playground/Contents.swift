import UIKit

/**
 1. Напишите расширение для коллекций целых чисел, которое возвращает,
 сколько раз определенная цифра фигурирует в любом из его номеров.
 
 Код [5, 15, 55, 515].testFunc(count: "5") должен возвращать 6.
 Код [5, 15, 55, 515].testFunc(count: "1") должен возвращать 2.
 Код [55555].testFunc(count: "5") должен возвращать 5
 Код [55555].testFunc(count: "1") должен возвращать 0.
 */

extension Collection where Element == Int {
    func testFunc(count: Character) -> Int {
        let arrayOfStrings: [String] = self.map { "\($0)" }
        let joinedString = arrayOfStrings.joined()
        let result = joinedString.filter { $0 == count }.count
        return result
    }
}

assert([5, 15, 55, 515].testFunc(count: "5") == 6, "testFunc failed")
assert([5, 15, 55, 515].testFunc(count: "1")  == 2, "testFunc failed")
assert([55555].testFunc(count: "5")  == 5, "testFunc failed")
assert([55555].testFunc(count: "1") == 0, "testFunc failed")

/// Вариант в 1 строчку, но менее читаемый
extension Collection where Element == Int {
    func testFunc2(count: Character) -> Int {
        self.reduce(0) {$0 + "\($1)".filter { $0 == count }.count }
    }
}

assert([5, 15, 55, 515].testFunc2(count: "5") == 6, "testFunc2 failed")
assert([5, 15, 55, 515].testFunc2(count: "1")  == 2, "testFunc2 failed")
assert([55555].testFunc2(count: "5")  == 5, "testFunc2 failed")
assert([55555].testFunc2(count: "1") == 0, "testFunc2 failed")

/**
 2. Отсортировать массив по длине строк его значений
 
 ["a", "abc", "ab"].testSorted() должен возвращать ["abc", "ab", "a"].
 
 */

extension Collection where Element == String {
    func testSorted() -> [Element] {
        return self.sorted(by: >)
    }
}

assert(["a", "abc", "ab"].testSorted() == ["abc", "ab", "a"], "testSorted failed")

/**
 3. Создайте функцию, которая принимает массив несортированных чисел от 1 до 100,
 где ноль или более чисел могут отсутствовать, и возвращает массив отсутствующих чисел например: 
 
 var testArray = Array(1...100)
 testArray.remove(at: 25)
 testArray.remove(at: 20)
 testArray.remove(at: 6)
 
 getMissingNumbers(input: testArray) // [7, 21, 26]
 */

func getMissingNumbers(input: [Int]) -> [Int] {
    let reference: Set<Int> = Set(1...100)
    let inputSet: Set<Int> = Set(input)
    return Array(reference.subtracting(inputSet).sorted())
}

var testArray = Array(1...100)
testArray.remove(at: 25)
testArray.remove(at: 20)
testArray.remove(at: 6)

assert(getMissingNumbers(input: testArray) == [7, 21, 26], "getMissingNumbers failed")

/**
 4. Поменять значения массива местами (не использовать reverse)
 Пример:
 var array = [1, 2, 3]
 array.testReverse()
 
 */

extension Array {
    mutating func testReverse() -> Void {
        var result: [Element] = []
        self.forEach { result.insert($0, at: 0) }
        self = result
    }
}

var array = [1, 2, 3]
array.testReverse()

assert(array == [3, 2, 1], "testReverse failed")

/**
 Решите проблему сильных ссылок
 */

class Person {
    let name: String
    let email: String
    var car: Car?
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
    
    deinit {
        print("Goodbye \(name)!")
    }
}

class Car {
    let id: Int
    let type: String
    weak var owner: Person?
    
    init(id: Int, type: String) {
        self.id = id
        self.type = type
    }
    
    deinit {
        print("Goodbye \(type)!")
    }
}

var owner: Person? = Person(name: "Cosmin",
                            email: "cosmin@whatever.com")
var car: Car? = Car(id: 10, type: "BMW")

owner?.car = car
car?.owner = owner

owner = nil
car = nil

print()
