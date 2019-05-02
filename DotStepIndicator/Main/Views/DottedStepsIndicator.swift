//
//  DottedStepsIndicator.swift
//  DotStepIndicator
//
//  Created by Novare Account on 25/03/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit
import SnapKit

public class DottedStepsIndicator: UIView {
    
    private lazy var stepComponents: [StepComponentView] = [StepComponentView]()
    
    public let stepStackView: UIStackView = {
        let view: UIStackView = UIStackView()
        view.axis = .horizontal
        view.spacing = 0.0
        return view
    }()
    
    // MARK: Stored Properties
    private var currentStep: Int = 0
    private var numberOfSteps: Int
    private var isLast: Bool = false
    
    // Initializer
    public init(numberOfSteps: Int = 3,
                activeColor: UIColor = UIColor.blue,
                inActiveColor: UIColor = UIColor.lightGray) {
        
        switch numberOfSteps < 2 {
        case true:
            self.numberOfSteps = 2
        case false:
            self.numberOfSteps = numberOfSteps
        }
        
        super.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.white
        
        self.subviews(forAutoLayout:
            self.stepStackView
        )
        
        for number in 0...self.numberOfSteps - 1 {
            let view: StepComponentView = StepComponentView()
            view.activeColor = activeColor
            view.inactiveColor = inActiveColor
            view.withDone(accessory: #imageLiteral(resourceName: "done-icon"))
            if number == self.numberOfSteps - 1 {
                view.withEnd()
            }
            self.stepStackView.addArrangedSubview(view)
            self.stepComponents.append(view)
        }
        self.stepStackView.distribution = .fillEqually
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.stepStackView.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.height.equalTo(100.0)
        }
        
        self.stepComponents.first?.setCurrent()
    }
    
}

// MARK: Public API
extension DottedStepsIndicator {
    
    public func gotToNext() {
        let previousStep: StepComponentView = self.stepComponents[self.currentStep]
        previousStep.setPassed()
        
        switch self.isLast {
        case true:
            self.stepComponents.last?.activateEndAccessory()
        case false:
            break
        }
        
        switch self.currentStep < self.stepComponents.count - 1 {
        case true:
            self.currentStep += 1
            let nextStep: StepComponentView = self.stepComponents[self.currentStep]
            nextStep.setCurrent()
        case false:
            self.isLast = true
        }
    }
    
    public func backToPrevious() {
        
        switch self.currentStep >= 0 {
        case true:
            let currentStep: StepComponentView = self.stepComponents[self.currentStep]
            if self.isLast {
                currentStep.inactiveEndDotView()
                currentStep.inactiveHorizontalView()
                self.isLast = false
            } else {
                let previousStep: StepComponentView = self.stepComponents[self.currentStep - 1]
                currentStep.inactiveDotView()
                previousStep.inactiveHorizontalView()                
                if self.currentStep > 0 {
                    self.currentStep -= 1
                }
            }
        case false:
            break
        }
    }
}
