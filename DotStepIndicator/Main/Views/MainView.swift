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
    
    public let dottedStepsIndicator: DottedStepsIndicator = {
        let view: DottedStepsIndicator = DottedStepsIndicator(numberOfSteps: 1)
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
    
    public let previousButton: UIButton = {
        let view: UIButton = UIButton()
        view.setTitle("Previous", for: UIControl.State.normal)
        view.setTitleColor(
            UIColor.white,
            for: UIControl.State.normal
        )
        view.backgroundColor = AppUI.Color.blue
        return view
    }()
    
    // MARK: Stored Properties
    
    // Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)

        self.backgroundColor = UIColor.white
        
        self.subviews(forAutoLayout:
            self.dottedStepsIndicator, self.nextButton, self.previousButton
        )
        
        self.previousButton.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.dottedStepsIndicator.snp.bottom).offset(20.0)
            make.leading.equalToSuperview().offset(50.0)
            make.width.equalTo(100.0)
            make.height.equalTo(60.0)
        }
        
        self.nextButton.snp.remakeConstraints { [unowned self] (make: ConstraintMaker) -> Void in
            make.top.equalTo(self.dottedStepsIndicator.snp.bottom).offset(20.0)
            make.trailing.equalToSuperview().inset(50.0)
            make.width.equalTo(100.0)
            make.height.equalTo(60.0)
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        self.dottedStepsIndicator.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(50.0)
            make.leading.equalToSuperview().offset(20.0)
            make.trailing.equalToSuperview().inset(40.0)
            make.height.equalTo(100.0)
        }
    }
}
