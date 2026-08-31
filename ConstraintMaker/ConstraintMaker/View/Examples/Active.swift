//
//  Active.swift
//  ConstraintMaker
//
//  Created by SwiftDevelop on 8/28/26.
//

import UIKit

final class ActiveExample: ExampleViewController {
    
    // MARK: - UI Components
    
    private let activeView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemRed
        return view
    }()
    
    private let unactiveView: UIView = {
       let view = UIView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    // MARK: - Setup Methods
    
    override func setupUIHierarchy() {
        view.addSubview(activeView)
        view.addSubview(unactiveView)
    }
    
    override func setupUIConstraints() {
        activeView.makeConstraint
            .top()
            .horizontal()
            .height(view.heightAnchor, multiplier: 0.5)
            .active() // default is true.
        
        unactiveView.makeConstraint
            .bottom()
            .horizontal()
            .height(view.heightAnchor, multiplier: 0.5)
            .active(false)
    }
}
