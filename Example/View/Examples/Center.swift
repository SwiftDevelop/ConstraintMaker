//
//  Center.swift
//  ConstraintMaker
//
//  Created by SwiftDevelop on 8/25/26.
//

import UIKit

final class CenterExample: ExampleViewController {
    
    // MARK: - UI Components
    
    private let exampleView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    // MARK: - Setup Methods
    
    override func setupUIHierarchy() {
        view.addSubview(exampleView)
    }
    
    override func setupUIConstraints() {
        exampleView.makeConstraint
//            .center() // anchor: exampleView.superview?.centerXAnchor & centerYAnchor, constant: 0
        
//            .centerX() // anchor: exampleView.superview?.centerXAnchor, constant: 0
//            .centerX(64) // anchor: exampleView.superview?.centerXAnchor, constant: 64
            .centerX(view.centerXAnchor, constant: 64) // anchor: view.centerXAnchor, constant: 64
        
//            .centerY() // anchor: exampleView.superview?.centerYAnchor, constant: 0
//            .centerY(-64) // anchor: exampleView.superview?.centerYAnchor, constant: -64
            .centerY(view.centerYAnchor, constant: -64) // anchor: view.centerYAnchor, constant: -64
        
            .size(100) // width: 100, height: 100
            .active()
    }
}
