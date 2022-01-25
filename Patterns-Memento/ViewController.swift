//
//  ViewController.swift
//  Patterns-Memento
//
//  Created by Ruslan on 24.01.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var carrierState: CarrierState!

    @IBOutlet weak var canvasView: DrawView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let linesManager = LinesManager.shared
        carrierState = CarrierState(linesManager: linesManager)
        
        canvasView.lineColor = .systemBlue
    }
    
    @IBAction func saveButtonAction(_ sender: UIButton) {
        carrierState.saveLine()
    }
    
    @IBAction func loadButtonAction(_ sender: UIButton) {
        carrierState.loadLine()
        carrierState.linesManager.printLines(in: canvasView)
    }
    
    @IBAction func blueColorAction(_ sender: UIButton) {
        canvasView.lineColor = .systemBlue
    }
    
    @IBAction func orangeColorAction(_ sender: UIButton) {
        canvasView.lineColor = .systemOrange
    }
    
    @IBAction func greenColorAction(_ sender: UIButton) {
        canvasView.lineColor = .systemGreen
    }
}

