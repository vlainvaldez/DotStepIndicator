//
//  ViewController.swift
//  DotStepIndicator
//
//  Created by alvin joseph valdez on 21/03/2019.
//  Copyright © 2019 alvin joseph valdez. All rights reserved.
//

import UIKit

public final class MainVC: UIViewController {
    
    // MARK: LifeCycle Methods
    public override func loadView() {
        super.loadView()
        self.view = MainView()
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rootView.nextButton.addTarget(
            self,
            action: #selector(MainVC.nextButtonTapped),
            for: UIControl.Event.touchUpInside
        )
        
        self.rootView.previousButton.addTarget(
            self,
            action: #selector(MainVC.previousButtonTapped),
            for: UIControl.Event.touchUpInside
        )
    }
}

// MARK: Views
extension MainVC {
    public unowned var rootView: MainView { return self.view as! MainView } //swiftlint:disable:this force_cast
}

// MARK: Target Action Methods
extension MainVC {
    @objc func nextButtonTapped() {
        self.rootView.dottedStepsIndicator.gotToNext()
    }
    
    @objc func previousButtonTapped() {
        self.rootView.dottedStepsIndicator.backToPrevious()
    }
}
