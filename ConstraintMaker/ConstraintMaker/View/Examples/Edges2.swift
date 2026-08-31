//
//  Edges2.swift
//  ConstraintMaker
//
//  Created by SwiftDevelop on 8/25/26.
//

import UIKit

final class EdgesExample2: ExampleViewController {
    
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
//            .top() // anchor: exampleView.superview?.topAnchor, constant: 0
//            .top(32) // anchor: exampleView.superview?.topAnchor, constant: 32
//            .top(view.safeAreaLayoutGuide.topAnchor) // anchor: view.safeAreaLayoutGuide.topAnchor, constant: 0
            .top(view.topAnchor, constant: 32) // anchor: view.topAnchor, constant: 32
        
//            .bottom() // anchor: exampleView.superview?.bottomAnchor, constant: 0
//            .bottom(-32) // anchor: exampleView.superview?.bottomAnchor, constant: -32
//            .bottom(view.safeAreaLayoutGuide.bottomAnchor) // anchor: view.safeAreaLayoutGuide.bottomAnchor, constant: 0
            .bottom(view.bottomAnchor, constant: -32) // anchor: view.bottomAnchor, constant: -32
        
//            .leading() // anchor: exampleView.superview?.leadingAnchor, constant: 0
//            .leading(32) // anchor: exampleView.superview?.leadingAnchor, constant: 32
//            .leading(view.leadingAnchor) // anchor: view.leadingAnchor, constant: 0
            .leading(view.leadingAnchor, constant: 32) // anchor: view.leadingAnchor, constant: 32
        
//            .trailing() // anchor: exampleView.superview?.trailingAnchor, constant: 0
//            .trailing(-32) // anchor: exampleView.superview?.trailingAnchor, constant: -32
//            .trailing(view.trailingAnchor) // anchor: view.trailingAnchor, constant: 0
            .trailing(view.trailingAnchor, constant: -32) // anchor: view.trailingAnchor, constant: -32
        
            .active()
    }
}
