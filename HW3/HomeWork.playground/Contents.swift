import UIKit

/**
 1. Создать менеджер и протокол для менеджера, которые будут принимать универсальный тип
 
 Ограничить тип протоколом Profile, который будет вызывать метод отображающий в консоль имя и фамилию (реализовать значения через расширения)
 
 Ограничить тип протоколом Adress, который будет отображать в консоль улицу и город
 
 */

protocol Profile {
    func showFullName()
}
protocol Adress {
    func showFullAdress()
}
protocol ManagerProtocol {
    associatedtype T: Profile & Adress
}

class ManagerProtocolImpl: Adress {
    func showFullAdress() {
        print(#function)
    }
}

extension ManagerProtocolImpl: Profile {
    func showFullName() {
        print(#function)
    }
}

class Manager: ManagerProtocol {
    typealias T = ManagerProtocolImpl
}

let manager = Manager()

/**
 2. Создать класс, который будет иметь опциональное свойство и его тип ввиде протокола.
 
 Протокол должен иметь ассоциативный тип и метод, вызывающий/принимающий его
 
 
 
 Формат:
 protocol RequestManager {
 associatedtype Result
 
 func get() -> Result
 }
 
 class NetworkManager {
 var requestManager: RequestManager?
 
 func getAllMovies() {
 requestManager.get()
 }
 }
 */

protocol RequestManager {
    associatedtype Result
    func get() -> Result
}

/// Абстрактный класс
private class _AnyRequestManagerBox<Result> {
    func get() -> Result {
        fatalError("This method is abstract")
    }
}

/// Класс обертка
private class _RequestManagerBox<Base: RequestManager>: _AnyRequestManagerBox<Base.Result> {
    private let _base: Base
    
    init(_ base: Base) {
        _base = base
    }
    
    override func get() -> Base.Result {
        return _base.get()
    }
}

/// Финальный класс
class AnyRequestManager<Result>: RequestManager {
    private let _box: _AnyRequestManagerBox<Result>
    
    init<ManagerType: RequestManager>(_ manager: ManagerType) where ManagerType.Result == Result {
        _box = _RequestManagerBox(manager)
    }
    
    func get() -> Result {
        _box.get()
    }
}

/// RequestManager меняется на AnyRequestManager
class NetworkManager {
    var requestManager: AnyRequestManager<[String]>?
    
    func getAllMovies() {
        if let result = requestManager?.get() {
            print(result)
        }
    }
}

class LowerRequestManager: RequestManager {
    func get() -> [String] {
        return ["string", "string", "string"]
    }
}

class UpperRequestManager: RequestManager {
    func get() -> [String] {
        return ["STRING", "STRING", "STRING"]
    }
}

let networkManager = NetworkManager()

let lowerRequestManager = LowerRequestManager()
let upperRequestManager = UpperRequestManager()


networkManager.requestManager = AnyRequestManager(lowerRequestManager)
networkManager.getAllMovies()

networkManager.requestManager = AnyRequestManager(upperRequestManager)
networkManager.getAllMovies()


