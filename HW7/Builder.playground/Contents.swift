import UIKit

/// Строитель на примере конфигуратора ноутбуков

enum Cpu {
    case amd
    case intel
}


class Notebook {
    var cpu: Cpu?
    var ram: Int?
}

/// Сам строитель который стоит ноутбуки
class NotebookBuilder {
    let notebook = Notebook()
    
    func withCpu(_ cpu: Cpu) {
        self.notebook.cpu = cpu
    }
    
    func withRam(_ ram: Int) {
        self.notebook.ram = ram
    }
    
    func buld() -> Notebook {
        return self.notebook
    }
}

/// Базовый пример
let notebookBuilder = NotebookBuilder()
notebookBuilder.withCpu(.amd)
notebookBuilder.withRam(16)

let notebook1 = notebookBuilder.buld()

/// "Директор"
class NotebookCenter {
    func createMaxPowerNotebook(withBuilder builder: NotebookBuilder) -> Notebook {
        builder.withCpu(.intel)
        builder.withRam(128)
        return builder.buld()
    }
    
    func createMinPowerNotebook(withBuilder builder: NotebookBuilder) -> Notebook {
        builder.withCpu(.amd)
        builder.withRam(4)
        return builder.buld()
    }
}

let builder = NotebookBuilder()
let notebookCenter = NotebookCenter()

let maxPower = notebookCenter.createMaxPowerNotebook(withBuilder: builder)
let minPower = notebookCenter.createMinPowerNotebook(withBuilder: builder)

