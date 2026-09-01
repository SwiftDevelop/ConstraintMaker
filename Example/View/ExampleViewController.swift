//
//  ExampleViewController.swift
//  ConstraintMaker
//
//  Created by SwiftDevelop on 8/25/26.
//

import UIKit

class ExampleViewController: UIViewController {
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInit()
        setupUIHierarchy()
        setupUIConstraints()
    }
    
    // MARK: - Setup Methods
    
    func setupInit() {
        title = String(describing: type(of: self))
        view.backgroundColor = .white
    }
    
    func setupUIHierarchy() {
        
    }
    
    func setupUIConstraints() {
        
    }
}
