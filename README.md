# ConstraintMaker

> **ConstraintMaker**는 Swift & UIKit 환경에서 체이닝(Chainable) 문법으로 Auto Layout 제약 조건을 손쉽고 직관적으로 작성할 수 있도록 돕는 경량 라이브러리입니다.

---

## 📌 주요 특징 (Features)

- **체이닝 API**: 메서드 체이닝 방식을 통해 가독성 높은 코드로 제약 조건을 작성합니다.
- **자동 설정**: `makeConstraint`, `remakeConstraint` 호출 시 `translatesAutoresizingMaskIntoConstraints = false`가 자동으로 처리됩니다.
- **동적 변경 지원**:
  - `makeConstraint`: 신규 제약 조건 생성 및 적용
  - `updateConstraint`: 기존 제약 조건의 `constant` 값 업데이트
  - `remakeConstraint`: 기존 제약 조건을 모두 제거하고 새로운 제약 조건 재설정
- **풍부한 헬퍼 메서드**: `edges`, `edgesToSafeArea`, `center`, `size`, `sizeToFill` 등 자주 쓰이는 레이아웃 패턴 지원
- **우선순위(Priority) 개별 지정**: 파라미터 옵션으로 각 제약 조건별 `priority` 개별 조절 지원 (기본값: `.required`)

---

## 🛠 요구 사항 (Requirements)

- **iOS**: 13.0+
- **Swift**: 5.7+
- **Xcode**: 14.0+

---

## 📦 설치 방법 (Installation)

### Swift Package Manager (SPM)

Xcode에서 **File > Add Package Dependencies...** 를 선택한 후 아래 Repository URL을 입력하여 프로젝트에 추가합니다.

```text
https://github.com/SwiftDevelop/ConstraintMaker.git
```

사용하려는 파일 상단에서 모듈을 `import` 합니다:

```swift
import ConstraintMaker
```

---

## 🚀 사용법 (Usage)

### 1. 제약 조건 생성 (`makeConstraint`)

```swift
// 기본 중앙 배치 및 크기 지정
redView.makeConstraint
    .center()
    .size(100)
    .active()

// Anchor 및 Constant 지정
blueView.makeConstraint
    .top(redView.bottomAnchor, constant: 20)
    .leading(16)
    .trailing(-16)
    .height(50)
    .active()
```

### 2. 여백 및 패딩 헬퍼 (Edges & Spacing Helpers)

```swift
// Superview 상하좌우 전체 꽉 채우기
subview.makeConstraint
    .edges()
    .active()

// 동일한 패딩(Padding) 설정 (상하좌우 16pt)
subview.makeConstraint
    .edges(16)
    .active()

// Horizontal, Vertical 패딩 각각 지정
subview.makeConstraint
    .edges(horizontal: 20, vertical: 10)
    .active()

// Superview의 Safe Area 기준 전체 여백 맞춤 (16pt 인셋)
subview.makeConstraint
    .edgesToSafeArea(16)
    .active()
```

### 3. 제약 조건 업데이트 (`updateConstraint`)

이미 설정된 제약 조건의 `constant` 수치를 동적으로 변경할 때 사용합니다.

```swift
// 크기를 200pt로 변경
exampleView.updateConstraint
    .size(200)
    .active()
```

### 4. 제약 조건 재설정 (`remakeConstraint`)

기존 제약 조건을 모두 비활성화/제거하고 완전히 새로운 제약 조건을 적용할 때 사용합니다.

```swift
// 기존 제약 조건을 모두 제거하고 상하좌우를 상위 뷰/가이드라인에 맞춤
exampleView.remakeConstraint
    .top(view.safeAreaLayoutGuide.topAnchor)
    .leading(view.safeAreaLayoutGuide.leadingAnchor)
    .trailing(view.safeAreaLayoutGuide.trailingAnchor)
    .bottom(button.topAnchor)
    .active()
```

### 5. 제약 조건 우선순위 지정 (`priority`)

각 메서드의 optional 파라미터로 `priority`를 개별적으로 지정할 수 있습니다 (기본값: `.required`).

```swift
// 각 조건별 개별 우선순위(Priority) 지정
exampleView.makeConstraint
    .top(20)                                // 기본값: .required (1000)
    .leading(16, priority: .defaultHigh)   // priority: .defaultHigh (750)
    .height(100, priority: .defaultLow)    // priority: .defaultLow (250)
    .active()
```

---

## 📂 프로젝트 구조 (Project Structure)

```text
ConstraintMaker
├── Package.swift                   # SPM 패키지 매니페스트
├── Sources                         # SPM 패키지 소스 코드 (라이브러리 타겟)
│   ├── ConstraintMaker.swift      # 핵심 레이아웃 엔진 클래스
│   └── UIView+ConstraintMaker.swift # UIView 확장 프로퍼티 및 메서드
└── Example                         # 예제 앱 프로젝트
    ├── Application
    │   ├── AppDelegate.swift
    │   └── SceneDelegate.swift
    └── View
        ├── MainViewController.swift    # 예제 목록 뷰 컨트롤러
        ├── ExampleViewController.swift # 예제 베이스 컨트롤러
        └── Examples                    # 다양한 레이아웃 시나리오별 예제 코드
```

---

## 📄 라이선스 (License)

ConstraintMaker는 **MIT 라이선스** 하에 제공됩니다. 자세한 내용은 [LICENSE](LICENSE) 파일을 참고하세요.
