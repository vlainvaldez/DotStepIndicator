//
//  MainView.swift
//  DotStepIndicator
//
//  Created by alvin joseph valdez on 21/03/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit
import SnapKit

public final class MainView: UIView {
    
//    public let stepComponent: StepComponentView = {
//        let view: StepComponentView = StepComponentView()
//        return view
//    }()
//
//    public let stepComponent2: StepComponentView = {
//        let view: StepComponentView = StepComponentView()
//        return view
//    }()
//
//    public let stepComponent3: StepComponentView = {
//        let view: StepComponentView = StepComponentView()
//        view.withEnd()
//        return view
//    }()
    
//    public let stepComponent4: StepComponentView = {
//        let view: StepComponentView = StepComponentView()
//        view.withEnd()
//        return view
//    }()
    
    private lazy var stepComponents: [StepComponentView] = [StepComponentView]()
    
    public let stepStackView: UIStackView = {
        let view: UIStackView = UIStackView()
        view.axis = .horizontal
        view.spacing = 0.0
        return view
    }()
    
    public let nextButton: UIButton = {
        let view: UIButton = UIButton()
        view.setTitle("Next", for: UIControl.State.normal)
        view.setTitleColor(
            UIColor.white,
            for: UIControl.State.normal
        )
        view.backgroundColor = AppUI.Color.blue
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
            self.stepStackView, self.nextButton
        )
        
        self.nextButton.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.stepStackView.snp.bottom).offset(20.0)
            make.centerX.equalToSuperview()
            make.width.equalTo(100.0)
            make.height.equalTo(60.0)
        }
        
        self.stepComponents.first?.setCurrent()
        
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
            make.top.equalToSuperview().offset(50.0)
            make.leading.equalToSuperview().offset(20.0)
            make.trailing.equalToSuperview().inset(40.0)
            make.height.equalTo(100.0)
        }
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
