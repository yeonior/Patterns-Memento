//
//  CarrierState.swift
//  Patterns-Memento
//
//  Created by Ruslan on 25.01.2022.
//

import Foundation

class CarrierState {
    var state: LinesStateMemento?
    var linesManager: LinesManager
    
    init(linesManager: LinesManager) {
        self.linesManager = linesManager
    }
    
    public func saveLine() {
        state = linesManager.save()
    }
    
    func loadLine() {
        guard let state = state else { return }
        linesManager.load(state: state)
    }
}
