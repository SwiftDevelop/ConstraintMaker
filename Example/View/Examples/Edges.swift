//
//  EdgesExample.swift
//  ConstraintMaker
//
//  Created by SwiftDevelop on 8/25/26.
//

import UIKit

final class EdgesExample: ExampleViewController {
    
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
//            .edges() // anchor: superview, top: 0, leading: 0, bottom: 0, trailing: 0
//            .edges(32) // anchor: superview, top: 32, leading: 32, bottom: -32, trailing: -32
//            .edgesToSafeArea() // anchor: safeArea, top: 0, leading: 0, bottom: 0, trailing: 0
            .edgesToSafeArea(32) // anchor: safeArea, top: 32, leading: 32, bottom: -32, trailing: -32
            .active()
    }
}
