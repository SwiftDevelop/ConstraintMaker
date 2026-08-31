//
//  Remake.swift
//  ConstraintMaker
//
//  Created by SwiftDevelop on 8/28/26.
//

import UIKit

final class RemakeExample: ExampleViewController {
    
    // MARK: - UI Components
    
    private let exampleView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    private lazy var updateButton: UIButton = {
        let button = UIButton(type: .system)
        button.addAction(updateAction(), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.setTitle("UPDATE", for: .normal)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    // MARK: - Setup Methods
    
    override func setupUIHierarchy() {
        view.addSubview(exampleView)
        view.addSubview(updateButton)
    }
    
    override func setupUIConstraints() {
        exampleView.makeConstraint
            .center()
            .size(100)
            .active()
        
        updateButton.makeConstraint
            .bottom(view.safeAreaLayoutGuide.bottomAnchor)
            .horizontal(16)
            .height(48)
            .active()
    }
    
    // MARK: - Action Hanlders
    
    private func updateAction() -> UIAction {
        UIAction { [weak self] _ in
            guard let self else { return }
            exampleView.remakeConstraint
                .top(view.safeAreaLayoutGuide.topAnchor)
                .leading(view.safeAreaLayoutGuide.leadingAnchor)
                .trailing(view.safeAreaLayoutGuide.trailingAnchor)
                .bottom(updateButton.topAnchor)
                .active()
        }
    }

}
