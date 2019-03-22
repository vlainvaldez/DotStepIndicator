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
    
    public let stepComponent: StepComponentView = {
        let view: StepComponentView = StepComponentView()
        return view
    }()
    
    public let stepComponent2: StepComponentView = {
        let view: StepComponentView = StepComponentView()
        return view
    }()
    
    public let stepComponent3: StepComponentView = {
        let view: StepComponentView = StepComponentView()
        return view
    }()
    
    public let stepComponent4: StepComponentView = {
        let view: StepComponentView = StepComponentView()
        view.withEnd()
        return view
    }()
    
    public let stepStackView: UIStackView = {
        let view: UIStackView = UIStackView()
        view.axis = .horizontal
        view.spacing = 0.0
        return view
    }()
    
    // MARK: Stored Properties
    
    // Initializer
    public override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        
        self.subviews(forAutoLayout: self.stepStackView)
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
        
        self.stepStackView.addArrangedSubview(self.stepComponent)
        self.stepStackView.addArrangedSubview(self.stepComponent2)
        self.stepStackView.addArrangedSubview(self.stepComponent3)
        self.stepStackView.addArrangedSubview(self.stepComponent4)
        self.stepStackView.distribution = .fillEqually
    }
}
