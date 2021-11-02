//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Nikita Zharinov on 01/11/2021.
//

import UIKit

class ResultViewController: UIViewController {

    var answers: [Answer]!
    
    @IBOutlet var animalTypeZagolovok: UILabel!
    @IBOutlet var animalAbout: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
//      print("Количество ответов - \(answers.count)")
        let maxCountAnimal = getMaxCountAnimal()
        outResult(with: maxCountAnimal)
    }

    // 1. Передать сюда массив с ответами +
    // 2. Определить наиболее часто встречающийся тип животного +
    // 3. Отобразить результаты в соответствии с этим животным  +
    // 4. Избавиться от кнопки возврата назад на экране результатов +
}

extension ResultViewController{
    private func getMaxCountAnimal () -> AnimalType? {
        return Dictionary(grouping: answers, by: { $0.type })
                        .sorted(by: {$0.value.count > $1.value.count})
                        .first?.key
        // сортировать по количеству ответов в группе - сначала больше
        // берем первый элемент
    }
    
    private func outResult(with animal: AnimalType?) {
        animalTypeZagolovok.text = "Вы - \(animal?.rawValue ?? "🦖" )!"
        animalAbout.text = animal?.definition ?? "Динозавр?"
//        switch animal.self {
//            case .dog: print("Собака")
//            case .cat: print("Кошка")
//            case .rabbit: print("Кролик")
//            case .turtle: print("Черепаха")
//            case .none: print("Неизвестный зверь")
//        }
        }
    
}


