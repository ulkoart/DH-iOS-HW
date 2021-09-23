import UIKit

// https://docs.google.com/document/d/10AvyYmWdojXb_GcqLr1SvvL_Yfqp9tFoODcNHDMzmPI/edit?usp=sharing

final class Spell {
    private let baseDamage: Range<Int>
    let title: String
    
    init(title: String, baseDamage: Range<Int>) {
        self.baseDamage = baseDamage
        self.title = title
    }
    
    func getDamageRange(_ magicianLevel: Int) -> Range<Int>? {
        guard
            let baseDamageMin = baseDamage.min(),
            let baseDamageMax = baseDamage.max()
        else { return nil }
        
        let levelBonus = magicianLevel / 2
        
        let minDamage =  baseDamageMin + levelBonus
        let maxDamage = baseDamageMax + levelBonus
        
        return minDamage..<maxDamage
    }
}

final class Wizard {
    private let spells: [Spell]
    private let name: String
    private let level: Int
    private(set) var health = 100
    
    init(name: String, level: Int, spells: [Spell]) {
        self.name = name
        self.level = level
        self.spells = spells
    }
    
    
    func getDamaged(_ damaged: Int) {
        print("\(self.name) получает \(damaged) урона")
        
        if (self.health - damaged > 0) {
            self.health = self.health - damaged
        } else {
            self.health = 0
            print("\(self.name) умирает ☠️")
        }
    }
    
    func attack(_ enemy: Wizard) {
        if self.health <= 0 {
            return
        }
        print("Маг \(self.name) атакует мага \(enemy.name)")
        guard let spell = self.spells.randomElement() else {
            print("Атака сорвалась, заклинания забыты")
            return
        }
        print("\(self.name) будет использовать заклинание - \"\(spell.title)\"")
        
        guard let damageRange = spell.getDamageRange(self.level) else {
            print("Заклинание срывается")
            return
        }
        let damage = Int.random(in: damageRange)
        enemy.getDamaged(damage)
    }
}

let fireball: Spell = Spell(title: "Fireball", baseDamage: 10..<17)
let poison: Spell = Spell(title: "Poison", baseDamage: 15..<20)

let wizard1: Wizard = Wizard(name: "Гендальф белый", level: 12, spells: [fireball])
let wizard2: Wizard = Wizard(name: "Волан-де-Морт", level: 14, spells: [fireball, poison])

while wizard1.health > 0 && wizard2.health > 0 {
    wizard1.attack(wizard2)
    wizard2.attack(wizard1)
    print("")
}
