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
    
    public let stepIndicatorContainer: UIView = {
        let view: UIView = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    // Initializer
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.gray
        
        self.subview(forAutoLayout: self.stepIndicatorContainer)
        
        self.stepIndicatorContainer.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
            make.top.equalToSuperview().offset(50.0)
            make.leading.equalToSuperview().offset(25.0)
            make.trailing.equalToSuperview().inset(25.0)
            make.height.equalTo(300.0)
        }
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
