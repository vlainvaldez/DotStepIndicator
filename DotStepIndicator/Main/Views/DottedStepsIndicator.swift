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
    
    // Initializer
    public init(numberOfSteps: Int = 3) {
        self.numberOfSteps = numberOfSteps
        super.init(frame: CGRect.zero)
        self.backgroundColor = UIColor.white
        
        self.subviews(forAutoLayout:
            self.stepStackView
        )

        for number in 0...self.numberOfSteps - 1 {
            let view: StepComponentView = StepComponentView()
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
    
    public func setNext() {
        let previousStep: StepComponentView = self.stepComponents[self.currentStep]
        previousStep.setPassed()
        
        switch self.currentStep < self.stepComponents.count - 1 {
        case true:
            self.currentStep += 1
            let nextStep: StepComponentView = self.stepComponents[self.currentStep]
            nextStep.setCurrent()
        case false:
            break
        }
    }
}
