//
//  ConstraintMaker.swift
//  ConstraintMaker
//
//  Created by SwiftDevelop on 9/1/26.
//

import UIKit

/// UIView의 Auto Layout 제약 조건을 체이닝 방식으로 생성, 업데이트, 재설정할 수 있도록 돕는 유틸리티 클래스입니다.
public final class ConstraintMaker {
    
    // MARK: - Enums
    
    /// 제약 조건 생성 동작 모드
    public enum ActionType {
        /// 새로운 제약 조건 추가
        case make
        /// 기존 제약 조건의 constant 업데이트
        case update
        /// 기존 제약 조건 제거 후 새 제약 조건 생성
        case remake
    }
    
    /// 처리할 제약 조건 동작 정보
    public enum ConstraintAction {
        /// 상단 제약 조건 (상대 Anchor, constant, priority)
        case top(anchor: NSLayoutYAxisAnchor?, constant: CGFloat, priority: UILayoutPriority)
        /// 하단 제약 조건 (상대 Anchor, constant, priority)
        case bottom(anchor: NSLayoutYAxisAnchor?, constant: CGFloat, priority: UILayoutPriority)
        /// 좌측(Leading) 제약 조건 (상대 Anchor, constant, priority)
        case leading(anchor: NSLayoutXAxisAnchor?, constant: CGFloat, priority: UILayoutPriority)
        /// 우측(Trailing) 제약 조건 (상대 Anchor, constant, priority)
        case trailing(anchor: NSLayoutXAxisAnchor?, constant: CGFloat, priority: UILayoutPriority)
        /// 수평 중앙 제약 조건 (상대 Anchor, constant, priority)
        case centerX(anchor: NSLayoutXAxisAnchor?, constant: CGFloat, priority: UILayoutPriority)
        /// 수직 중앙 제약 조건 (상대 Anchor, constant, priority)
        case centerY(anchor: NSLayoutYAxisAnchor?, constant: CGFloat, priority: UILayoutPriority)
        /// 너비 제약 조건 (관계, 상대 Anchor, multiplier, constant, priority)
        case width(relation: NSLayoutConstraint.Relation, anchor: NSLayoutDimension?, multiplier: CGFloat, constant: CGFloat, priority: UILayoutPriority)
        /// 높이 제약 조건 (관계, 상대 Anchor, multiplier, constant, priority)
        case height(relation: NSLayoutConstraint.Relation, anchor: NSLayoutDimension?, multiplier: CGFloat, constant: CGFloat, priority: UILayoutPriority)
    }
    
    // MARK: - Properties
    
    /// 제약 조건을 적용할 대상 뷰
    private weak var view: UIView?
    /// 제약 조건 동작 모드
    private let mode: ActionType
    /// 적용할 제약 조건 타겟 목록
    private var targets: [ConstraintAction] = []
    
    // MARK: - Initialization
    
    /// ConstraintMaker 객체를 초기화합니다.
    /// - Parameters:
    ///   - view: 제약 조건을 적용할 UIView
    ///   - mode: 제약 조건 동작 모드 (.make, .update, .remake)
    public init(view: UIView, mode: ActionType) {
        self.view = view
        self.mode = mode
    }
    
    // MARK: - Chaining Methods
    
    // MARK: Top
    
    /// Superview의 Top Anchor를 기준으로 제약 조건을 설정합니다.
    /// - Parameters:
    ///   - constant: 여백 (기본값: 0)
    ///   - priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func top(_ constant: CGFloat = 0, priority: UILayoutPriority = .required) -> Self {
        targets.append(.top(anchor: nil, constant: constant, priority: priority))
        return self
    }
    
    /// 지정한 Y축 Anchor를 기준으로 Top 제약 조건을 설정합니다.
    /// - Parameters:
    ///   - anchor: 기준이 될 NSLayoutYAxisAnchor
    ///   - constant: 여백 (기본값: 0)
    ///   - priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func top(_ anchor: NSLayoutYAxisAnchor?, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> Self {
        targets.append(.top(anchor: anchor, constant: constant, priority: priority))
        return self
    }
    
    // MARK: Bottom
    
    /// Superview의 Bottom Anchor를 기준으로 제약 조건을 설정합니다.
    /// - Parameters:
    ///   - constant: 여백 (기본값: 0)
    ///   - priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func bottom(_ constant: CGFloat = 0, priority: UILayoutPriority = .required) -> Self {
        targets.append(.bottom(anchor: nil, constant: constant, priority: priority))
        return self
    }
    
    /// 지정한 Y축 Anchor를 기준으로 Bottom 제약 조건을 설정합니다.
    /// - Parameters:
    ///   - anchor: 기준이 될 NSLayoutYAxisAnchor
    ///   - constant: 여백 (기본값: 0)
    ///   - priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func bottom(_ anchor: NSLayoutYAxisAnchor?, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> Self {
        targets.append(.bottom(anchor: anchor, constant: constant, priority: priority))
        return self
    }
    
    // MARK: Leading
    
    /// Superview의 Leading Anchor를 기준으로 제약 조건을 설정합니다.
    /// - Parameters:
    ///   - constant: 여백 (기본값: 0)
    ///   - priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func leading(_ constant: CGFloat = 0, priority: UILayoutPriority = .required) -> Self {
        targets.append(.leading(anchor: nil, constant: constant, priority: priority))
        return self
    }
    
    /// 지정한 X축 Anchor를 기준으로 Leading 제약 조건을 설정합니다.
    /// - Parameters:
    ///   - anchor: 기준이 될 NSLayoutXAxisAnchor
    ///   - constant: 여백 (기본값: 0)
    ///   - priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func leading(_ anchor: NSLayoutXAxisAnchor?, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> Self {
        targets.append(.leading(anchor: anchor, constant: constant, priority: priority))
        return self
    }
    
    // MARK: Trailing
    
    /// Superview의 Trailing Anchor를 기준으로 제약 조건을 설정합니다.
    /// - Parameters:
    ///   - constant: 여백 (기본값: 0)
    ///   - priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func trailing(_ constant: CGFloat = 0, priority: UILayoutPriority = .required) -> Self {
        targets.append(.trailing(anchor: nil, constant: constant, priority: priority))
        return self
    }
    
    /// 지정한 X축 Anchor를 기준으로 Trailing 제약 조건을 설정합니다.
    /// - Parameters:
    ///   - anchor: 기준이 될 NSLayoutXAxisAnchor
    ///   - constant: 여백 (기본값: 0)
    ///   - priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func trailing(_ anchor: NSLayoutXAxisAnchor?, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> Self {
        targets.append(.trailing(anchor: anchor, constant: constant, priority: priority))
        return self
    }
    
    // MARK: Edges
    
    /// Superview를 기준으로 상하좌우 전체 여백을 동일하게 설정합니다.
    /// - Parameters:
    ///   - constant: 상하좌우 여백 크기 (기본값: 0)
    ///   - priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func edges(_ constant: CGFloat = 0, priority: UILayoutPriority = .required) -> Self {
        targets.append(.top(anchor: nil, constant: constant, priority: priority))
        targets.append(.bottom(anchor: nil, constant: -constant, priority: priority))
        targets.append(.leading(anchor: nil, constant: constant, priority: priority))
        targets.append(.trailing(anchor: nil, constant: -constant, priority: priority))
        return self
    }
    
    /// Superview를 기준으로 수평/수직 여백을 각각 설정합니다.
    /// - Parameters:
    ///   - horizontal: 수평(좌우) 여백
    ///   - vertical: 수직(상하) 여백
    ///   - priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func edges(horizontal: CGFloat = 0, vertical: CGFloat = 0, priority: UILayoutPriority = .required) -> Self {
        targets.append(.top(anchor: nil, constant: vertical, priority: priority))
        targets.append(.bottom(anchor: nil, constant: -vertical, priority: priority))
        targets.append(.leading(anchor: nil, constant: horizontal, priority: priority))
        targets.append(.trailing(anchor: nil, constant: -horizontal, priority: priority))
        return self
    }
    
    // MARK: EdgesToSafeArea
    
    /// Superview의 Safe Area Layout Guide를 기준으로 상하좌우 전체 여백을 동일하게 설정합니다.
    /// - Parameters:
    ///   - constant: 상하좌우 여백 크기 (기본값: 0)
    ///   - priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func edgesToSafeArea(_ constant: CGFloat = 0, priority: UILayoutPriority = .required) -> Self {
        guard let superview = view?.superview else { return self }
        let guide = superview.safeAreaLayoutGuide
        targets.append(.top(anchor: guide.topAnchor, constant: constant, priority: priority))
        targets.append(.bottom(anchor: guide.bottomAnchor, constant: -constant, priority: priority))
        targets.append(.leading(anchor: guide.leadingAnchor, constant: constant, priority: priority))
        targets.append(.trailing(anchor: guide.trailingAnchor, constant: -constant, priority: priority))
        return self
    }
    
    /// Superview의 Safe Area Layout Guide를 기준으로 수평/수직 여백을 각각 설정합니다.
    /// - Parameters:
    ///   - horizontal: 수평(좌우) 여백
    ///   - vertical: 수직(상하) 여백
    ///   - priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func edgesToSafeArea(horizontal: CGFloat = 0, vertical: CGFloat = 0, priority: UILayoutPriority = .required) -> Self {
        guard let superview = view?.superview else { return self }
        let guide = superview.safeAreaLayoutGuide
        targets.append(.top(anchor: guide.topAnchor, constant: vertical, priority: priority))
        targets.append(.bottom(anchor: guide.bottomAnchor, constant: -vertical, priority: priority))
        targets.append(.leading(anchor: guide.leadingAnchor, constant: horizontal, priority: priority))
        targets.append(.trailing(anchor: guide.trailingAnchor, constant: -horizontal, priority: priority))
        return self
    }
    
    // MARK: CenterX
    
    /// Superview의 CenterX Anchor를 기준으로 수평 중앙을 설정합니다.
    /// - Parameters:
    ///   - constant: 수평 오프셋 (기본값: 0)
    ///   - priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func centerX(_ constant: CGFloat = 0, priority: UILayoutPriority = .required) -> Self {
        targets.append(.centerX(anchor: nil, constant: constant, priority: priority))
        return self
    }
    
    /// 지정한 X축 Anchor를 기준으로 CenterX 제약 조건을 설정합니다.
    /// - Parameters:
    ///   - anchor: 기준이 될 NSLayoutXAxisAnchor
    ///   - constant: 수평 오프셋 (기본값: 0)
    ///   - priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func centerX(_ anchor: NSLayoutXAxisAnchor?, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> Self {
        targets.append(.centerX(anchor: anchor, constant: constant, priority: priority))
        return self
    }
    
    // MARK: CenterY
    
    /// Superview의 CenterY Anchor를 기준으로 수직 중앙을 설정합니다.
    /// - Parameters:
    ///   - constant: 수직 오프셋 (기본값: 0)
    ///   - priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func centerY(_ constant: CGFloat = 0, priority: UILayoutPriority = .required) -> Self {
        targets.append(.centerY(anchor: nil, constant: constant, priority: priority))
        return self
    }
    
    /// 지정한 Y축 Anchor를 기준으로 CenterY 제약 조건을 설정합니다.
    /// - Parameters:
    ///   - anchor: 기준이 될 NSLayoutYAxisAnchor
    ///   - constant: 수직 오프셋 (기본값: 0)
    ///   - priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func centerY(_ anchor: NSLayoutYAxisAnchor?, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> Self {
        targets.append(.centerY(anchor: anchor, constant: constant, priority: priority))
        return self
    }
    
    // MARK: Center
    
    /// Superview의 수평 및 수직 중앙에 뷰를 정렬시킵니다.
    /// - Parameter priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func center(priority: UILayoutPriority = .required) -> Self {
        targets.append(.centerX(anchor: nil, constant: 0, priority: priority))
        targets.append(.centerY(anchor: nil, constant: 0, priority: priority))
        return self
    }
    
    // MARK: Width
    
    /// 지정한 Dimension Anchor를 기준으로 너비 제약 조건을 설정합니다.
    /// - Parameters:
    ///   - anchor: 기준이 될 NSLayoutDimension
    ///   - multiplier: 비율 (기본값: 1.0)
    ///   - constant: 추가 크기 (기본값: 0)
    ///   - priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func width(_ anchor: NSLayoutDimension, multiplier: CGFloat = 1.0, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> Self {
        targets.append(.width(relation: .equal, anchor: anchor, multiplier: multiplier, constant: constant, priority: priority))
        return self
    }
    
    /// 고정된 너비 크기를 설정합니다.
    /// - Parameters:
    ///   - constant: 너비 크기 (기본값: 0)
    ///   - priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func width(_ constant: CGFloat = 0, priority: UILayoutPriority = .required) -> Self {
        targets.append(.width(relation: .equal, anchor: nil, multiplier: 1.0, constant: constant, priority: priority))
        return self
    }
    
    /// 관계 조건(equal, greaterThanOrEqual 등)과 고정 너비 크기를 설정합니다.
    /// - Parameters:
    ///   - relation: 제약 조건 관계 (NSLayoutConstraint.Relation)
    ///   - constant: 너비 크기
    ///   - priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func width(_ relation: NSLayoutConstraint.Relation, constant: CGFloat, priority: UILayoutPriority = .required) -> Self {
        targets.append(.width(relation: relation, anchor: nil, multiplier: 1.0, constant: constant, priority: priority))
        return self
    }
    
    // MARK: Height
    
    /// 지정한 Dimension Anchor를 기준으로 높이 제약 조건을 설정합니다.
    /// - Parameters:
    ///   - anchor: 기준이 될 NSLayoutDimension
    ///   - multiplier: 비율 (기본값: 1.0)
    ///   - constant: 추가 크기 (기본값: 0)
    ///   - priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func height(_ anchor: NSLayoutDimension, multiplier: CGFloat = 1.0, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> Self {
        targets.append(.height(relation: .equal, anchor: anchor, multiplier: multiplier, constant: constant, priority: priority))
        return self
    }
    
    /// 고정된 높이 크기를 설정합니다.
    /// - Parameters:
    ///   - constant: 높이 크기 (기본값: 0)
    ///   - priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func height(_ constant: CGFloat = 0, priority: UILayoutPriority = .required) -> Self {
        targets.append(.height(relation: .equal, anchor: nil, multiplier: 1.0, constant: constant, priority: priority))
        return self
    }
    
    /// 관계 조건(equal, greaterThanOrEqual 등)과 고정 높이 크기를 설정합니다.
    /// - Parameters:
    ///   - relation: 제약 조건 관계 (NSLayoutConstraint.Relation)
    ///   - constant: 높이 크기
    ///   - priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func height(_ relation: NSLayoutConstraint.Relation, constant: CGFloat, priority: UILayoutPriority = .required) -> Self {
        targets.append(.height(relation: relation, anchor: nil, multiplier: 1.0, constant: constant, priority: priority))
        return self
    }
    
    // MARK: Size
    
    /// 너비와 높이를 정사각형 크기로 동일하게 설정합니다.
    /// - Parameters:
    ///   - constant: 너비 및 높이 크기
    ///   - priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func size(_ constant: CGFloat, priority: UILayoutPriority = .required) -> Self {
        targets.append(.width(relation: .equal, anchor: nil, multiplier: 1.0, constant: constant, priority: priority))
        targets.append(.height(relation: .equal, anchor: nil, multiplier: 1.0, constant: constant, priority: priority))
        return self
    }
    
    /// 관계 조건과 함께 정사각형 크기를 설정합니다.
    /// - Parameters:
    ///   - relation: 제약 조건 관계 (NSLayoutConstraint.Relation)
    ///   - constant: 너비 및 높이 크기
    ///   - priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func size(_ relation: NSLayoutConstraint.Relation, constant: CGFloat, priority: UILayoutPriority = .required) -> Self {
        targets.append(.width(relation: relation, anchor: nil, multiplier: 1.0, constant: constant, priority: priority))
        targets.append(.height(relation: relation, anchor: nil, multiplier: 1.0, constant: constant, priority: priority))
        return self
    }
    
    /// Superview의 전체 크기에 맞추어 너비와 높이를 설정합니다.
    /// - Parameters:
    ///   - multiplier: Superview 대비 크기 비율 (기본값: 1.0)
    ///   - constant: 추가 오프셋 크기 (기본값: 0)
    ///   - priority: 제약 조건 우선순위 (기본값: .required)
    @discardableResult
    public func sizeToFill(multiplier: CGFloat = 1.0, constant: CGFloat = 0, priority: UILayoutPriority = .required) -> Self {
        targets.append(.width(relation: .equal, anchor: view?.superview?.widthAnchor, multiplier: multiplier, constant: constant, priority: priority))
        targets.append(.height(relation: .equal, anchor: view?.superview?.heightAnchor, multiplier: multiplier, constant: constant, priority: priority))
        return self
    }
    
    // MARK: - Finalizer
    
    /// 체이닝으로 쌓은 제약 조건 체인을 실행 및 활성화합니다.
    /// - Parameter isActive: 제약 조건 활성화 여부 (기본값: true)
    public func active(_ isActive: Bool = true) {
        guard let view = view else { return }
        
        if mode == .remake {
            view.removeAllConstraints()
        }
        
        for action in targets {
            switch action {
            case .top(let anchor, let constant, let priority):
                applyYAxis(view: view, attribute: .top, anchor: anchor, constant: constant, priority: priority, isActive: isActive)
            case .bottom(let anchor, let constant, let priority):
                applyYAxis(view: view, attribute: .bottom, anchor: anchor, constant: constant, priority: priority, isActive: isActive)
            case .leading(let anchor, let constant, let priority):
                applyXAxis(view: view, attribute: .leading, anchor: anchor, constant: constant, priority: priority, isActive: isActive)
            case .trailing(let anchor, let constant, let priority):
                applyXAxis(view: view, attribute: .trailing, anchor: anchor, constant: constant, priority: priority, isActive: isActive)
            case .centerX(let anchor, let constant, let priority):
                applyCenterX(view: view, anchor: anchor, constant: constant, priority: priority, isActive: isActive)
            case .centerY(let anchor, let constant, let priority):
                applyCenterY(view: view, anchor: anchor, constant: constant, priority: priority, isActive: isActive)
            case .width(let relation, let anchor, let multiplier, let constant, let priority):
                applyDimension(view: view, attribute: .width, relation: relation, anchor: anchor, multiplier: multiplier, constant: constant, priority: priority, isActive: isActive)
            case .height(let relation, let anchor, let multiplier, let constant, let priority):
                applyDimension(view: view, attribute: .height, relation: relation, anchor: anchor, multiplier: multiplier, constant: constant, priority: priority, isActive: isActive)
            }
        }
    }
    
    // MARK: - Private Helpers
    
    /// Y축(Top, Bottom) 제약 조건을 적용합니다.
    private func applyYAxis(
        view: UIView,
        attribute: NSLayoutConstraint.Attribute,
        anchor: NSLayoutYAxisAnchor?,
        constant: CGFloat,
        priority: UILayoutPriority,
        isActive: Bool
    ) {
        if mode == .update, anchor == nil {
            let targetConstraints = findConstraints(in: view, attribute: attribute)
            targetConstraints.forEach {
                $0.constant = constant
                $0.priority = priority
                $0.isActive = isActive
            }
        } else {
            let superviewAnchor: NSLayoutYAxisAnchor? = (attribute == .top) ? view.superview?.topAnchor : view.superview?.bottomAnchor
            guard let targetAnchor = anchor ?? superviewAnchor else { return }
            let viewAnchor = (attribute == .top) ? view.topAnchor : view.bottomAnchor
            let constraint = viewAnchor.constraint(equalTo: targetAnchor, constant: constant)
            constraint.priority = priority
            constraint.isActive = isActive
        }
    }
    
    /// X축(Leading, Trailing) 제약 조건을 적용합니다.
    private func applyXAxis(
        view: UIView,
        attribute: NSLayoutConstraint.Attribute,
        anchor: NSLayoutXAxisAnchor?,
        constant: CGFloat,
        priority: UILayoutPriority,
        isActive: Bool
    ) {
        if mode == .update, anchor == nil {
            let targetConstraints = findConstraints(in: view, attribute: attribute)
            targetConstraints.forEach {
                $0.constant = constant
                $0.priority = priority
                $0.isActive = isActive
            }
        } else {
            let superviewAnchor: NSLayoutXAxisAnchor? = (attribute == .leading) ? view.superview?.leadingAnchor : view.superview?.trailingAnchor
            guard let targetAnchor = anchor ?? superviewAnchor else { return }
            let viewAnchor = (attribute == .leading) ? view.leadingAnchor : view.trailingAnchor
            let constraint = viewAnchor.constraint(equalTo: targetAnchor, constant: constant)
            constraint.priority = priority
            constraint.isActive = isActive
        }
    }

    /// CenterX 제약 조건을 적용합니다.
    private func applyCenterX(
        view: UIView,
        anchor: NSLayoutXAxisAnchor?,
        constant: CGFloat,
        priority: UILayoutPriority,
        isActive: Bool
    ) {
        if mode == .update, anchor == nil {
            let targetConstraints = findConstraints(in: view, attribute: .centerX)
            targetConstraints.forEach {
                $0.constant = constant
                $0.priority = priority
                $0.isActive = isActive
            }
        } else {
            guard let targetAnchor = anchor ?? view.superview?.centerXAnchor else { return }
            let constraint = view.centerXAnchor.constraint(equalTo: targetAnchor, constant: constant)
            constraint.priority = priority
            constraint.isActive = isActive
        }
    }

    /// CenterY 제약 조건을 적용합니다.
    private func applyCenterY(
        view: UIView,
        anchor: NSLayoutYAxisAnchor?,
        constant: CGFloat,
        priority: UILayoutPriority,
        isActive: Bool
    ) {
        if mode == .update, anchor == nil {
            let targetConstraints = findConstraints(in: view, attribute: .centerY)
            targetConstraints.forEach {
                $0.constant = constant
                $0.priority = priority
                $0.isActive = isActive
            }
        } else {
            guard let targetAnchor = anchor ?? view.superview?.centerYAnchor else { return }
            let constraint = view.centerYAnchor.constraint(equalTo: targetAnchor, constant: constant)
            constraint.priority = priority
            constraint.isActive = isActive
        }
    }
    
    /// 크기(Width, Height) 제약 조건을 적용합니다.
    private func applyDimension(
        view: UIView,
        attribute: NSLayoutConstraint.Attribute,
        relation: NSLayoutConstraint.Relation,
        anchor: NSLayoutDimension?,
        multiplier: CGFloat,
        constant: CGFloat,
        priority: UILayoutPriority,
        isActive: Bool
    ) {
        if mode == .update {
            let targetConstraints = view.constraints.filter {
                $0.firstAttribute == attribute && $0.relation == relation
            }
            targetConstraints.forEach {
                $0.constant = constant
                $0.priority = priority
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
            
            constraint.priority = priority
            constraint.isActive = isActive
        }
    }
    
    /// 뷰 또는 Superview에 연결된 제약 조건 중 특정 속성(Attribute)에 해당되는 대상을 검색합니다.
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
