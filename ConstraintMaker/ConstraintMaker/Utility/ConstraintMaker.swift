//
//  ConstraintMaker.swift
//  ConstraintMaker
//
//  Created by SwiftDevelop on 8/25/26.
//

import UIKit

/// UIView의 Auto Layout 제약 조건을 체이닝 방식으로 생성, 업데이트, 재설정할 수 있도록 돕는 유틸리티 클래스입니다.
final class ConstraintMaker {
    
    // MARK: - Enums
    
    /// 제약 조건 생성 동작 모드
    enum ActionType {
        /// 새로운 제약 조건 추가
        case make
        /// 기존 제약 조건의 constant 업데이트
        case update
        /// 기존 제약 조건 제거 후 새 제약 조건 생성
        case remake
    }
    
    /// 처리할 제약 조건 동작 정보
    enum ConstraintAction {
        /// 상단 제약 조건 (상대 Anchor, constant)
        case top(anchor: NSLayoutYAxisAnchor?, constant: CGFloat)
        /// 하단 제약 조건 (상대 Anchor, constant)
        case bottom(anchor: NSLayoutYAxisAnchor?, constant: CGFloat)
        /// 좌측(Leading) 제약 조건 (상대 Anchor, constant)
        case leading(anchor: NSLayoutXAxisAnchor?, constant: CGFloat)
        /// 우측(Trailing) 제약 조건 (상대 Anchor, constant)
        case trailing(anchor: NSLayoutXAxisAnchor?, constant: CGFloat)
        /// 수평 중앙 제약 조건 (상대 Anchor, constant)
        case centerX(anchor: NSLayoutXAxisAnchor?, constant: CGFloat)
        /// 수직 중앙 제약 조건 (상대 Anchor, constant)
        case centerY(anchor: NSLayoutYAxisAnchor?, constant: CGFloat)
        /// 너비 제약 조건 (관계, 상대 Anchor, multiplier, constant)
        case width(relation: NSLayoutConstraint.Relation, anchor: NSLayoutDimension?, multiplier: CGFloat, constant: CGFloat)
        /// 높이 제약 조건 (관계, 상대 Anchor, multiplier, constant)
        case height(relation: NSLayoutConstraint.Relation, anchor: NSLayoutDimension?, multiplier: CGFloat, constant: CGFloat)
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
    init(view: UIView, mode: ActionType) {
        self.view = view
        self.mode = mode
    }
    
    // MARK: - Chaining Methods
    
    // MARK: Top
    
    /// Superview의 Top Anchor를 기준으로 제약 조건을 설정합니다.
    /// - Parameter constant: 여백 (기본값: 0)
    @discardableResult
    func top(_ constant: CGFloat = 0) -> Self {
        targets.append(.top(anchor: nil, constant: constant))
        return self
    }
    
    /// 지정한 Y축 Anchor를 기준으로 Top 제약 조건을 설정합니다.
    /// - Parameters:
    ///   - anchor: 기준이 될 NSLayoutYAxisAnchor
    ///   - constant: 여백 (기본값: 0)
    @discardableResult
    func top(_ anchor: NSLayoutYAxisAnchor?, constant: CGFloat = 0) -> Self {
        targets.append(.top(anchor: anchor, constant: constant))
        return self
    }
    
    // MARK: Bottom
    
    /// Superview의 Bottom Anchor를 기준으로 제약 조건을 설정합니다.
    /// - Parameter constant: 여백 (기본값: 0)
    @discardableResult
    func bottom(_ constant: CGFloat = 0) -> Self {
        targets.append(.bottom(anchor: nil, constant: constant))
        return self
    }
    
    /// 지정한 Y축 Anchor를 기준으로 Bottom 제약 조건을 설정합니다.
    /// - Parameters: 
    ///   - constant: 여백 (기본값: 0)
    @discardableResult
    func bottom(_ anchor: NSLayoutYAxisAnchor?, constant: CGFloat = 0) -> Self {
        targets.append(.bottom(anchor: anchor, constant: constant))
        return self
    }
    
    // MARK: Leading
    
    /// Superview의 Leading Anchor를 기준으로 제약 조건을 설정합니다.
    /// - Parameter constant: 여백 (기본값: 0)
    @discardableResult
    func leading(_ constant: CGFloat = 0) -> Self {
        targets.append(.leading(anchor: nil, constant: constant))
        return self
    }
    
    /// 지정한 X축 Anchor를 기준으로 Leading 제약 조건을 설정합니다.
    /// - Parameters:
    ///   - anchor: 기준이 될 NSLayoutXAxisAnchor
    ///   - constant: 여백 (기본값: 0)
    @discardableResult
    func leading(_ anchor: NSLayoutXAxisAnchor?, constant: CGFloat = 0) -> Self {
        targets.append(.leading(anchor: anchor, constant: constant))
        return self
    }
    
    // MARK: Trailing
    
    /// Superview의 Trailing Anchor를 기준으로 제약 조건을 설정합니다.
    /// - Parameter constant: 여백 (기본값: 0)
    @discardableResult
    func trailing(_ constant: CGFloat = 0) -> Self {
        targets.append(.trailing(anchor: nil, constant: constant))
        return self
    }
    
    /// 지정한 X축 Anchor를 기준으로 Trailing 제약 조건을 설정합니다.
    /// - Parameters:
    ///   - anchor: 기준이 될 NSLayoutXAxisAnchor
    ///   - constant: 여백 (기본값: 0)
    @discardableResult
    func trailing(_ anchor: NSLayoutXAxisAnchor?, constant: CGFloat = 0) -> Self {
        targets.append(.trailing(anchor: anchor, constant: constant))
        return self
    }
    
    // MARK: Horizontal(Leading & Trailing)
    
    /// Superview를 기준으로 좌우(Leading, Trailing) 양쪽에 인셋 여백을 설정합니다.
    /// - Parameter constant: 좌우 여백 크기 (Trailing은 자동으로 음수 처리됨)
    @discardableResult
    func horizontal(_ constant: CGFloat = 0) -> Self {
        targets.append(.leading(anchor: nil, constant: constant))
        targets.append(.trailing(anchor: nil, constant: -constant))
        return self
    }
    
    // MARK: Vertical(Top & Bottom)
    
    /// Superview를 기준으로 상하(Top, Bottom) 양쪽에 인셋 여백을 설정합니다.
    /// - Parameter constant: 상하 여백 크기 (Bottom은 자동으로 음수 처리됨)
    @discardableResult
    func vertical(_ constant: CGFloat = 0) -> Self {
        targets.append(.top(anchor: nil, constant: constant))
        targets.append(.bottom(anchor: nil, constant: -constant))
        return self
    }
    
    // MARK: Edges
    
    /// Superview를 기준으로 상하좌우 전체 여백을 동일하게 설정합니다.
    /// - Parameter constant: 상하좌우 여백 크기 (기본값: 0)
    @discardableResult
    func edges(_ constant: CGFloat = 0) -> Self {
        targets.append(.top(anchor: nil, constant: constant))
        targets.append(.bottom(anchor: nil, constant: -constant))
        targets.append(.leading(anchor: nil, constant: constant))
        targets.append(.trailing(anchor: nil, constant: -constant))
        return self
    }
    
    /// Superview를 기준으로 수평/수직 여백을 각각 설정합니다.
    /// - Parameters:
    ///   - horizontal: 수평(좌우) 여백
    ///   - vertical: 수직(상하) 여백
    @discardableResult
    func edges(horizontal: CGFloat = 0, vertical: CGFloat = 0) -> Self {
        targets.append(.top(anchor: nil, constant: vertical))
        targets.append(.bottom(anchor: nil, constant: -vertical))
        targets.append(.leading(anchor: nil, constant: horizontal))
        targets.append(.trailing(anchor: nil, constant: -horizontal))
        return self
    }
    
    // MARK: CenterX
    
    /// Superview의 CenterX Anchor를 기준으로 수평 중앙을 설정합니다.
    /// - Parameter constant: 수평 오프셋 (기본값: 0)
    @discardableResult
    func centerX(_ constant: CGFloat = 0) -> Self {
        targets.append(.centerX(anchor: nil, constant: constant))
        return self
    }
    
    /// 지정한 X축 Anchor를 기준으로 CenterX 제약 조건을 설정합니다.
    /// - Parameters:
    ///   - anchor: 기준이 될 NSLayoutXAxisAnchor
    ///   - constant: 수평 오프셋 (기본값: 0)
    @discardableResult
    func centerX(_ anchor: NSLayoutXAxisAnchor?, constant: CGFloat = 0) -> Self {
        targets.append(.centerX(anchor: anchor, constant: constant))
        return self
    }
    
    // MARK: CenterY
    
    /// Superview의 CenterY Anchor를 기준으로 수직 중앙을 설정합니다.
    /// - Parameter constant: 수직 오프셋 (기본값: 0)
    @discardableResult
    func centerY(_ constant: CGFloat = 0) -> Self {
        targets.append(.centerY(anchor: nil, constant: constant))
        return self
    }
    
    /// 지정한 Y축 Anchor를 기준으로 CenterY 제약 조건을 설정합니다.
    /// - Parameters:
    ///   - anchor: 기준이 될 NSLayoutYAxisAnchor
    ///   - constant: 수직 오프셋 (기본값: 0)
    @discardableResult
    func centerY(_ anchor: NSLayoutYAxisAnchor?, constant: CGFloat = 0) -> Self {
        targets.append(.centerY(anchor: anchor, constant: constant))
        return self
    }
    
    // MARK: Center
    
    /// Superview의 수평 및 수직 중앙에 뷰를 정렬시킵니다.
    @discardableResult
    func center() -> Self {
        targets.append(.centerX(anchor: nil, constant: 0))
        targets.append(.centerY(anchor: nil, constant: 0))
        return self
    }
    
    // MARK: Width
    
    /// 지정한 Dimension Anchor를 기준으로 너비 제약 조건을 설정합니다.
    /// - Parameters:
    ///   - anchor: 기준이 될 NSLayoutDimension
    ///   - multiplier: 비율 (기본값: 1.0)
    ///   - constant: 추가 크기 (기본값: 0)
    @discardableResult
    func width(_ anchor: NSLayoutDimension, multiplier: CGFloat = 1.0, constant: CGFloat = 0) -> Self {
        targets.append(.width(relation: .equal, anchor: anchor, multiplier: multiplier, constant: constant))
        return self
    }
    
    /// 고정된 너비 크기를 설정합니다.
    /// - Parameter constant: 너비 크기 (기본값: 0)
    @discardableResult
    func width(_ constant: CGFloat = 0) -> Self {
        targets.append(.width(relation: .equal, anchor: nil, multiplier: 1.0, constant: constant))
        return self
    }
    
    /// 관계 조건(equal, greaterThanOrEqual 등)과 고정 너비 크기를 설정합니다.
    /// - Parameters:
    ///   - relation: 제약 조건 관계 (NSLayoutConstraint.Relation)
    ///   - constant: 너비 크기
    @discardableResult
    func width(_ relation: NSLayoutConstraint.Relation, constant: CGFloat) -> Self {
        targets.append(.width(relation: relation, anchor: nil, multiplier: 1.0, constant: constant))
        return self
    }
    
    // MARK: Height
    
    /// 지정한 Dimension Anchor를 기준으로 높이 제약 조건을 설정합니다.
    /// - Parameters:
    ///   - anchor: 기준이 될 NSLayoutDimension
    ///   - multiplier: 비율 (기본값: 1.0)
    ///   - constant: 추가 크기 (기본값: 0)
    @discardableResult
    func height(_ anchor: NSLayoutDimension, multiplier: CGFloat = 1.0, constant: CGFloat = 0) -> Self {
        targets.append(.height(relation: .equal, anchor: anchor, multiplier: multiplier, constant: constant))
        return self
    }
    
    /// 고정된 높이 크기를 설정합니다.
    /// - Parameter constant: 높이 크기 (기본값: 0)
    @discardableResult
    func height(_ constant: CGFloat = 0) -> Self {
        targets.append(.height(relation: .equal, anchor: nil, multiplier: 1.0, constant: constant))
        return self
    }
    
    /// 관계 조건(equal, greaterThanOrEqual 등)과 고정 높이 크기를 설정합니다.
    /// - Parameters:
    ///   - relation: 제약 조건 관계 (NSLayoutConstraint.Relation)
    ///   - constant: 높이 크기
    @discardableResult
    func height(_ relation: NSLayoutConstraint.Relation, constant: CGFloat) -> Self {
        targets.append(.height(relation: relation, anchor: nil, multiplier: 1.0, constant: constant))
        return self
    }
    
    // MARK: Size
    
    /// 너비와 높이를 정사각형 크기로 동일하게 설정합니다.
    /// - Parameter constant: 너비 및 높이 크기
    @discardableResult
    func size(_ constant: CGFloat) -> Self {
        targets.append(.width(relation: .equal, anchor: nil, multiplier: 1.0, constant: constant))
        targets.append(.height(relation: .equal, anchor: nil, multiplier: 1.0, constant: constant))
        return self
    }
    
    /// 관계 조건과 함께 정사각형 크기를 설정합니다.
    /// - Parameters:
    ///   - relation: 제약 조건 관계 (NSLayoutConstraint.Relation)
    ///   - constant: 너비 및 높이 크기
    @discardableResult
    func size(_ relation: NSLayoutConstraint.Relation, constant: CGFloat) -> Self {
        targets.append(.width(relation: relation, anchor: nil, multiplier: 1.0, constant: constant))
        targets.append(.height(relation: relation, anchor: nil, multiplier: 1.0, constant: constant))
        return self
    }
    
    /// Superview의 전체 크기에 맞추어 너비와 높이를 설정합니다.
    /// - Parameters:
    ///   - multiplier: Superview 대비 크기 비율 (기본값: 1.0)
    ///   - constant: 추가 오프셋 크기 (기본값: 0)
    @discardableResult
    func sizeToFill(multiplier: CGFloat = 1.0, constant: CGFloat = 0) -> Self {
        targets.append(.width(relation: .equal, anchor: view?.superview?.widthAnchor, multiplier: multiplier, constant: constant))
        targets.append(.height(relation: .equal, anchor: view?.superview?.heightAnchor, multiplier: multiplier, constant: constant))
        return self
    }
    
    // MARK: - Finalizer
    
    /// 체이닝으로 쌓은 제약 조건 체인을 실행 및 활성화합니다.
    /// - Parameter isActive: 제약 조건 활성화 여부 (기본값: true)
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
    
    /// Y축(Top, Bottom) 제약 조건을 적용합니다.
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
    
    /// X축(Leading, Trailing) 제약 조건을 적용합니다.
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

    /// CenterX 제약 조건을 적용합니다.
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

    /// CenterY 제약 조건을 적용합니다.
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
    
    /// 크기(Width, Height) 제약 조건을 적용합니다.
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

// MARK: - Extensions

extension UIView {
    /// 새로운 Auto Layout 제약 조건을 생성하기 위한 ConstraintMaker 인스턴스를 반환합니다.
    /// (translatesAutoresizingMaskIntoConstraints = false 자동 적용)
    var makeConstraint: ConstraintMaker {
        self.translatesAutoresizingMaskIntoConstraints = false
        return ConstraintMaker(view: self, mode: .make)
    }
    
    /// 기존 제약 조건의 constant 값을 업데이트하기 위한 ConstraintMaker 인스턴스를 반환합니다.
    var updateConstraint: ConstraintMaker {
        return ConstraintMaker(view: self, mode: .update)
    }
    
    /// 기존 제약 조건을 모두 삭제하고 새로 설정하기 위한 ConstraintMaker 인스턴스를 반환합니다.
    /// (translatesAutoresizingMaskIntoConstraints = false 자동 적용)
    var remakeConstraint: ConstraintMaker {
        self.translatesAutoresizingMaskIntoConstraints = false
        return ConstraintMaker(view: self, mode: .remake)
    }
    
    /// 해당 뷰와 연결된 모든 Auto Layout 제약 조건을 비활성화 및 제거합니다.
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
