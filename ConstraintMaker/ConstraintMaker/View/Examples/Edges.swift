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
//            .edges() // top: 0, leading: 0, bottom: 0, trailing: 0
//            .edges(32) // top: 32, leading: 32, bottom: -32, trailing: -32
//            .edges(horizontal: 32) // top: 0, leading: 32, bottom: 0, trailing: -32
//            .edges(vertical: 32) // top: 32, leading: 0, bottom: -32, trailing: 0
            .edges(horizontal: 32, vertical: 64) // top: 64, leading: 32, bottom: -64, trailing: -32
            .active()
    }
}
