//
//  DrawView.swift
//  Patterns-Memento
//
//  Created by Ruslan on 25.01.2022.
//

import UIKit

class DrawView: UIView {
    var carrierState: CarrierState!
    
    var lineWidth: CGFloat!
    var lineColor: UIColor!
    var startPoint: CGPoint!
    var endPoint: CGPoint!
    var path: UIBezierPath!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override func layoutSubviews() {
        lineWidth = 10.0
        let linesManager = LinesManager.shared
        carrierState = CarrierState(linesManager: linesManager)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        startPoint = touch?.location(in: self)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        endPoint = touch?.location(in: self)
        let line = LineModel(start: startPoint, end: endPoint, color: lineColor)
        carrierState.linesManager.linesArray.append(line)
        
        path = UIBezierPath()
        path.move(to: startPoint)
        path.addLine(to: endPoint)
        startPoint = endPoint
        drawShapeLayer()
    }
    
    private func drawShapeLayer() {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.fillColor = UIColor.clear.cgColor
        self.layer.addSublayer(shapeLayer)
        self.setNeedsDisplay()
    }
}
