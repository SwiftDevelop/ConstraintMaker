//
//  Priority.swift
//  ConstraintMaker
//
//  Created by SwiftDevelop on 9/1/26.
//

import UIKit

final class PriorityExample: ExampleViewController {
    
    // MARK: - UI Components
    
    private let exampleView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemOrange
        return view
    }()
    
    // MARK: - Setup Methods
    
    override func setupUIHierarchy() {
        view.addSubview(exampleView)
    }
    
    override func setupUIConstraints() {
        exampleView.makeConstraint
            .top(view.safeAreaLayoutGuide.topAnchor, constant: 40)
            .leading(view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
            .trailing(view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
            .height(100, priority: .defaultLow)
            .height(200, priority: .defaultHigh)
            .active()
    }
}
