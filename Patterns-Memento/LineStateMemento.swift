//
//  LineStateMemento.swift
//  Patterns-Memento
//
//  Created by Ruslan on 24.01.2022.
//

import Foundation

class LineStateMemento {
    var linesArray: [LineModel]
    
    init(lines: [LineModel]) {
        self.linesArray = lines
    }
}
