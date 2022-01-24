//
//  LinesManager.swift
//  Patterns-Memento
//
//  Created by Ruslan on 24.01.2022.
//

import UIKit

class LinesManager {
    static let shared = LinesManager()
    
    var linesArray = [LineModel]()
    
    func save() -> LinesStateMemento {
        LinesStateMemento(lines: linesArray)
    }
    
    func load(state: LinesStateMemento) {
        linesArray = state.linesArray
    }
    
    func printLines(in view: UIView) {
        guard let sublayers = view.layer.sublayers else { return }
        
        for sublayer in sublayers {
            sublayer.removeFromSuperlayer()
        }
        
        for line in linesArray {
            let path = UIBezierPath()
            path.move(to: line.start)
            path.addLine(to: line.end)
            drawShapeLayer(path, line.color, view)
        }
    }
    
    private func drawShapeLayer(_ path: UIBezierPath, _ lineColor: UIColor, _ view: UIView) {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        view.layer.addSublayer(shapeLayer)
        view.setNeedsDisplay()
    }
}
