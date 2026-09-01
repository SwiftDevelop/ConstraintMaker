//
//  Size3.swift
//  ConstraintMaker
//
//  Created by SwiftDevelop on 8/28/26.
//

import UIKit

final class SizeExample3: ExampleViewController {
    
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
//            .width() // Width: 0
//            .width(100)
//            .width(.equal, constant: 100)
//            .width(.greaterThanOrEqual, constant: 100)
//            .width(.lessThanOrEqual, constant: 100)
//            .width(view.widthAnchor)
//            .width(view.widthAnchor, multiplier: 0.5)
//            .width(view.widthAnchor, constant: -100)
            .width(view.widthAnchor, multiplier: 0.5, constant: -100)
        
//            .height() // Height: 0
//            .height(100)
//            .height(.equal, constant: 100)
//            .height(.greaterThanOrEqual, constant: 100)
//            .height(.lessThanOrEqual, constant: 100)
//            .height(view.heightAnchor)
//            .height(view.heightAnchor, multiplier: 0.5)
//            .height(view.heightAnchor, constant: -100)
            .height(view.heightAnchor, multiplier: 0.5, constant: -100)
            .active()
    }
}
