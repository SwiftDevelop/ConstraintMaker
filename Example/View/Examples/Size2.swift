//
//  Size2.swift
//  ConstraintMaker
//
//  Created by SwiftDevelop on 8/28/26.
//

import UIKit

final class SizeExample2: ExampleViewController {
    
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
            .center() // anchor: exampleView.superview?.centerXAnchor & centerYAnchor, constant: 0
//            .sizeToFill()
//            .sizeToFill(multiplier: 0.5)
//            .sizeToFill(constant: -100)
            .sizeToFill(multiplier: 0.5, constant: -100)
            .active()
    }
}
