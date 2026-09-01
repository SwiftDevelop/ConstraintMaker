//
//  Size.swift
//  ConstraintMaker
//
//  Created by SwiftDevelop on 8/26/26.
//

import UIKit

final class SizeExample: ExampleViewController {
    
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
//            .size(100) // width: 100, height: 100
//            .size(.equal, constant: 100) // width: 100, height: 100
//            .size(.greaterThanOrEqual, constant: 100)
            .size(.lessThanOrEqual, constant: 100)
            .active()
    }
}
