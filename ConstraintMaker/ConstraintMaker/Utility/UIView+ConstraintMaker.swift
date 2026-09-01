//
//  UIView+ConstraintMaker.swift
//  ConstraintMaker
//
//  Created by SwiftDevelop on 9/1/26.
//

import UIKit

public extension UIView {
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
