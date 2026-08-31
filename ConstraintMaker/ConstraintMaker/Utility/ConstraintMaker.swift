//
//  ConstraintMaker.swift
//  ConstraintMaker
//
//  Created by SwiftDevelop on 8/25/26.
//

import UIKit

final class ConstraintMaker {
    
    // MARK: - Enums
    
    enum ActionType {
        case make
        case update
        case remake
    }
    
    enum ConstraintAction {
        case top(anchor: NSLayoutYAxisAnchor?, constant: CGFloat)
        case bottom(anchor: NSLayoutYAxisAnchor?, constant: CGFloat)
        case leading(anchor: NSLayoutXAxisAnchor?, constant: CGFloat)
        case trailing(anchor: NSLayoutXAxisAnchor?, constant: CGFloat)
        case centerX(anchor: NSLayoutXAxisAnchor?, constant: CGFloat)
        case centerY(anchor: NSLayoutYAxisAnchor?, constant: CGFloat)
        case width(relation: NSLayoutConstraint.Relation, anchor: NSLayoutDimension?, multiplier: CGFloat, constant: CGFloat)
        case height(relation: NSLayoutConstraint.Relation, anchor: NSLayoutDimension?, multiplier: CGFloat, constant: CGFloat)
    }
    
    // MARK: - Properties
    
    private weak var view: UIView?
    private let mode: ActionType
    private var targets: [ConstraintAction] = []
    
    // MARK: - Initialization
    
    init(view: UIView, mode: ActionType) {
        self.view = view
        self.mode = mode
    }
    
    // MARK: - Chaining Methods
    
    // MARK: Top
    
    @discardableResult
    func top(_ constant: CGFloat = 0) -> Self {
        targets.append(.top(anchor: nil, constant: constant))
        return self
    }
    
    @discardableResult
    func top(_ anchor: NSLayoutYAxisAnchor?, constant: CGFloat = 0) -> Self {
        targets.append(.top(anchor: anchor, constant: constant))
        return self
    }
    
    // MARK: Bottom
    
    @discardableResult
    func bottom(_ constant: CGFloat = 0) -> Self {
        targets.append(.bottom(anchor: nil, constant: constant))
        return self
    }
    
    @discardableResult
    func bottom(_ anchor: NSLayoutYAxisAnchor?, constant: CGFloat = 0) -> Self {
        targets.append(.bottom(anchor: anchor, constant: constant))
        return self
    }
    
    // MARK: Leading
    
    @discardableResult
    func leading(_ constant: CGFloat = 0) -> Self {
        targets.append(.leading(anchor: nil, constant: constant))
        return self
    }
    
    @discardableResult
    func leading(_ anchor: NSLayoutXAxisAnchor?, constant: CGFloat = 0) -> Self {
        targets.append(.leading(anchor: anchor, constant: constant))
        return self
    }
    
    // MARK: Trailing
    
    @discardableResult
    func trailing(_ constant: CGFloat = 0) -> Self {
        targets.append(.trailing(anchor: nil, constant: constant))
        return self
    }
    
    @discardableResult
    func trailing(_ anchor: NSLayoutXAxisAnchor?, constant: CGFloat = 0) -> Self {
        targets.append(.trailing(anchor: anchor, constant: constant))
        return self
    }
    
    // MARK: Horizontal(Leading & Trailing)
    
    @discardableResult
    func horizontal(_ constant: CGFloat = 0) -> Self {
        targets.append(.leading(anchor: nil, constant: constant))
        targets.append(.trailing(anchor: nil, constant: -constant))
        return self
    }
    
    // MARK: Vertical(Top & Bottom)
    
    @discardableResult
    func vertical(_ constant: CGFloat = 0) -> Self {
        targets.append(.top(anchor: nil, constant: constant))
        targets.append(.bottom(anchor: nil, constant: -constant))
        return self
    }
    
    // MARK: Edges
    
    @discardableResult
    func edges(_ constant: CGFloat = 0) -> Self {
        targets.append(.top(anchor: nil, constant: constant))
        targets.append(.bottom(anchor: nil, constant: -constant))
        targets.append(.leading(anchor: nil, constant: constant))
        targets.append(.trailing(anchor: nil, constant: -constant))
        return self
    }
    
    @discardableResult
    func edges(horizontal: CGFloat = 0, vertical: CGFloat = 0) -> Self {
        targets.append(.top(anchor: nil, constant: vertical))
        targets.append(.bottom(anchor: nil, constant: -vertical))
        targets.append(.leading(anchor: nil, constant: horizontal))
        targets.append(.trailing(anchor: nil, constant: -horizontal))
        return self
    }
    
    // MARK: CenterX
    
    @discardableResult
    func centerX(_ constant: CGFloat = 0) -> Self {
        targets.append(.centerX(anchor: nil, constant: constant))
        return self
    }
    
    @discardableResult
    func centerX(_ anchor: NSLayoutXAxisAnchor?, constant: CGFloat = 0) -> Self {
        targets.append(.centerX(anchor: anchor, constant: constant))
        return self
    }
    
    // MARK: CenterY
    
    @discardableResult
    func centerY(_ constant: CGFloat = 0) -> Self {
        targets.append(.centerY(anchor: nil, constant: constant))
        return self
    }
    
    @discardableResult
    func centerY(_ anchor: NSLayoutYAxisAnchor?, constant: CGFloat = 0) -> Self {
        targets.append(.centerY(anchor: anchor, constant: constant))
        return self
    }
    
    // MARK: Center
    
    @discardableResult
    func center() -> Self {
        targets.append(.centerX(anchor: nil, constant: 0))
        targets.append(.centerY(anchor: nil, constant: 0))
        return self
    }
    
    // MARK: Width
    
    @discardableResult
    func width(_ anchor: NSLayoutDimension, multiplier: CGFloat = 1.0, constant: CGFloat = 0) -> Self {
        targets.append(.width(relation: .equal, anchor: anchor, multiplier: multiplier, constant: constant))
        return self
    }
    
    @discardableResult
    func width(_ constant: CGFloat = 0) -> Self {
        targets.append(.width(relation: .equal, anchor: nil, multiplier: 1.0, constant: constant))
        return self
    }
    
    @discardableResult
    func width(_ relation: NSLayoutConstraint.Relation, constant: CGFloat) -> Self {
        targets.append(.width(relation: relation, anchor: nil, multiplier: 1.0, constant: constant))
        return self
    }
    
    // MARK: Height
    
    @discardableResult
    func height(_ anchor: NSLayoutDimension, multiplier: CGFloat = 1.0, constant: CGFloat = 0) -> Self {
        targets.append(.height(relation: .equal, anchor: anchor, multiplier: multiplier, constant: constant))
        return self
    }
    
    @discardableResult
    func height(_ constant: CGFloat = 0) -> Self {
        targets.append(.height(relation: .equal, anchor: nil, multiplier: 1.0, constant: constant))
        return self
    }
    
    @discardableResult
    func height(_ relation: NSLayoutConstraint.Relation, constant: CGFloat) -> Self {
        targets.append(.height(relation: relation, anchor: nil, multiplier: 1.0, constant: constant))
        return self
    }
    
    // MARK: Size
    
    @discardableResult
    func size(_ constant: CGFloat) -> Self {
        targets.append(.width(relation: .equal, anchor: nil, multiplier: 1.0, constant: constant))
        targets.append(.height(relation: .equal, anchor: nil, multiplier: 1.0, constant: constant))
        return self
    }
    
    @discardableResult
    func size(_ relation: NSLayoutConstraint.Relation, constant: CGFloat) -> Self {
        targets.append(.width(relation: relation, anchor: nil, multiplier: 1.0, constant: constant))
        targets.append(.height(relation: relation, anchor: nil, multiplier: 1.0, constant: constant))
        return self
    }
    
    @discardableResult
    func sizeToFill(multiplier: CGFloat = 1.0, constant: CGFloat = 0) -> Self {
        targets.append(.width(relation: .equal, anchor: view?.superview?.widthAnchor, multiplier: multiplier, constant: constant))
        targets.append(.height(relation: .equal, anchor: view?.superview?.heightAnchor, multiplier: multiplier, constant: constant))
        return self
    }
    
    // MARK: - Finalizer
    
    func active(_ isActive: Bool = true) {
        guard let view = view else { return }
        
        if mode == .remake {
            view.removeAllConstraints()
        }
        
        for action in targets {
            switch action {
            case .top(let anchor, let constant):
                applyYAxis(view: view, attribute: .top, anchor: anchor, constant: constant, isActive: isActive)
            case .bottom(let anchor, let constant):
                applyYAxis(view: view, attribute: .bottom, anchor: anchor, constant: constant, isActive: isActive)
            case .leading(let anchor, let constant):
                applyXAxis(view: view, attribute: .leading, anchor: anchor, constant: constant, isActive: isActive)
            case .trailing(let anchor, let constant):
                applyXAxis(view: view, attribute: .trailing, anchor: anchor, constant: constant, isActive: isActive)
            case .centerX(let anchor, let constant):
                applyCenterX(view: view, anchor: anchor, constant: constant, isActive: isActive)
            case .centerY(let anchor, let constant):
                applyCenterY(view: view, anchor: anchor, constant: constant, isActive: isActive)
            case .width(let relation, let anchor, let multiplier, let constant):
                applyDimension(view: view, attribute: .width, relation: relation, anchor: anchor, multiplier: multiplier, constant: constant, isActive: isActive)
            case .height(let relation, let anchor, let multiplier, let constant):
                applyDimension(view: view, attribute: .height, relation: relation, anchor: anchor, multiplier: multiplier, constant: constant, isActive: isActive)
            }
        }
    }
    
    // MARK: - Private Helpers
    
    private func applyYAxis(
        view: UIView,
        attribute: NSLayoutConstraint.Attribute,
        anchor: NSLayoutYAxisAnchor?,
        constant: CGFloat,
        isActive: Bool
    ) {
        if mode == .update, anchor == nil {
            let targetConstraints = findConstraints(in: view, attribute: attribute)
            targetConstraints.forEach {
                $0.constant = constant
                $0.isActive = isActive
            }
        } else {
            let superviewAnchor: NSLayoutYAxisAnchor? = (attribute == .top) ? view.superview?.topAnchor : view.superview?.bottomAnchor
            guard let targetAnchor = anchor ?? superviewAnchor else { return }
            let viewAnchor = (attribute == .top) ? view.topAnchor : view.bottomAnchor
            let constraint = viewAnchor.constraint(equalTo: targetAnchor, constant: constant)
            constraint.isActive = isActive
        }
    }
    
    private func applyXAxis(
        view: UIView,
        attribute: NSLayoutConstraint.Attribute,
        anchor: NSLayoutXAxisAnchor?,
        constant: CGFloat,
        isActive: Bool
    ) {
        if mode == .update, anchor == nil {
            let targetConstraints = findConstraints(in: view, attribute: attribute)
            targetConstraints.forEach {
                $0.constant = constant
                $0.isActive = isActive
            }
        } else {
            let superviewAnchor: NSLayoutXAxisAnchor? = (attribute == .leading) ? view.superview?.leadingAnchor : view.superview?.trailingAnchor
            guard let targetAnchor = anchor ?? superviewAnchor else { return }
            let viewAnchor = (attribute == .leading) ? view.leadingAnchor : view.trailingAnchor
            let constraint = viewAnchor.constraint(equalTo: targetAnchor, constant: constant)
            constraint.isActive = isActive
        }
    }

    private func applyCenterX(
        view: UIView,
        anchor: NSLayoutXAxisAnchor?,
        constant: CGFloat,
        isActive: Bool
    ) {
        if mode == .update, anchor == nil {
            let targetConstraints = findConstraints(in: view, attribute: .centerX)
            targetConstraints.forEach {
                $0.constant = constant
                $0.isActive = isActive
            }
        } else {
            guard let targetAnchor = anchor ?? view.superview?.centerXAnchor else { return }
            let constraint = view.centerXAnchor.constraint(equalTo: targetAnchor, constant: constant)
            constraint.isActive = isActive
        }
    }

    private func applyCenterY(
        view: UIView,
        anchor: NSLayoutYAxisAnchor?,
        constant: CGFloat,
        isActive: Bool
    ) {
        if mode == .update, anchor == nil {
            let targetConstraints = findConstraints(in: view, attribute: .centerY)
            targetConstraints.forEach {
                $0.constant = constant
                $0.isActive = isActive
            }
        } else {
            guard let targetAnchor = anchor ?? view.superview?.centerYAnchor else { return }
            let constraint = view.centerYAnchor.constraint(equalTo: targetAnchor, constant: constant)
            constraint.isActive = isActive
        }
    }
    
    private func applyDimension(
        view: UIView,
        attribute: NSLayoutConstraint.Attribute,
        relation: NSLayoutConstraint.Relation,
        anchor: NSLayoutDimension?,
        multiplier: CGFloat,
        constant: CGFloat,
        isActive: Bool
    ) {
        if mode == .update {
            let targetConstraints = view.constraints.filter {
                $0.firstAttribute == attribute && $0.relation == relation
            }
            targetConstraints.forEach {
                $0.constant = constant
                $0.isActive = isActive
            }
        } else {
            let viewAnchor = (attribute == .width) ? view.widthAnchor : view.heightAnchor
            let constraint: NSLayoutConstraint
            
            if let targetAnchor = anchor {
                switch relation {
                case .equal:
                    constraint = viewAnchor.constraint(equalTo: targetAnchor, multiplier: multiplier, constant: constant)
                case .greaterThanOrEqual:
                    constraint = viewAnchor.constraint(greaterThanOrEqualTo: targetAnchor, multiplier: multiplier, constant: constant)
                case .lessThanOrEqual:
                    constraint = viewAnchor.constraint(lessThanOrEqualTo: targetAnchor, multiplier: multiplier, constant: constant)
                @unknown default:
                    constraint = viewAnchor.constraint(equalTo: targetAnchor, multiplier: multiplier, constant: constant)
                }
            } else {
                switch relation {
                case .equal:
                    constraint = viewAnchor.constraint(equalToConstant: constant)
                case .greaterThanOrEqual:
                    constraint = viewAnchor.constraint(greaterThanOrEqualToConstant: constant)
                case .lessThanOrEqual:
                    constraint = viewAnchor.constraint(lessThanOrEqualToConstant: constant)
                @unknown default:
                    constraint = viewAnchor.constraint(equalToConstant: constant)
                }
            }
            
            constraint.isActive = isActive
        }
    }
    
    private func findConstraints(in view: UIView, attribute: NSLayoutConstraint.Attribute) -> [NSLayoutConstraint] {
        var result = view.constraints.filter { $0.firstAttribute == attribute }
        if let superview = view.superview {
            result.append(contentsOf: superview.constraints.filter {
                ($0.firstItem as? UIView == view && $0.firstAttribute == attribute) ||
                ($0.secondItem as? UIView == view && $0.secondAttribute == attribute)
            })
        }
        return result
    }
}

// MARK: - Extensions

extension UIView {
    var makeConstraint: ConstraintMaker {
        self.translatesAutoresizingMaskIntoConstraints = false
        return ConstraintMaker(view: self, mode: .make)
    }
    
    var updateConstraint: ConstraintMaker {
        return ConstraintMaker(view: self, mode: .update)
    }
    
    var remakeConstraint: ConstraintMaker {
        self.translatesAutoresizingMaskIntoConstraints = false
        return ConstraintMaker(view: self, mode: .remake)
    }
    
    func removeAllConstraints() {
        NSLayoutConstraint.deactivate(self.constraints)
        self.removeConstraints(self.constraints)
        
        if let superview = self.superview {
            let superviewConstraints = superview.constraints.filter {
                ($0.firstItem as? UIView == self) || ($0.secondItem as? UIView == self)
            }
            NSLayoutConstraint.deactivate(superviewConstraints)
            superview.removeConstraints(superviewConstraints)
        }
    }
}
