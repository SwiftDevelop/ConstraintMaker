//
//  Edges3.swift
//  ConstraintMaker
//
//  Created by SwiftDevelop on 8/25/26.
//

import UIKit

final class EdgesExample3: ExampleViewController {
    
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
//            .horizontal() // leading: 0, trailing: 0
            .horizontal(32) // leading: 32, trailing: -32
        
//            .vertical() // top: 0, bottom: 0
            .vertical(32) // top: 32, bottom: -32
            .active()
    }
}
