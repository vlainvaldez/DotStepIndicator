## Dotted Steps Indicator

> this can be used for form steps

## Dependencies
-  [SnapKit](http://snapkit.io/)

### Demo
![alt text](https://github.com/vlainvaldez/DotStepIndicator/blob/stachViewImplementation/dottedStepIndicator.gif)

### How To Use


### Initialize
```
public let dottedStepsIndicator: DottedStepsIndicator = {
    let view: DottedStepsIndicator = DottedStepsIndicator(numberOfSteps: 5)
    return view
}()
```

### Minimum Number of Steps = 3
> Probably theres no reason for you to use steps if it's less than 3, if there is hire a new designer

### Set the Constraints

```
public override func layoutSubviews() {
    super.layoutSubviews()
    
    self.dottedStepsIndicator.snp.remakeConstraints { (make: ConstraintMaker) -> Void in
        make.top.equalToSuperview().offset(50.0)
        make.leading.equalToSuperview().offset(20.0)
        make.trailing.equalToSuperview().inset(40.0)
        make.height.equalTo(100.0)
    }
}
```

## Make the steps active upon tapping a next button
```
public final class MainVC: UIViewController {
    
    // MARK: LifeCycle Methods
    public override func loadView() {
        super.loadView()
        self.view = MainView(numberOfSteps: 4)
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        self.rootView.nextButton.addTarget(
            self,
            action: #selector(MainVC.nextButtonTapped),
            for: UIControl.Event.touchUpInside
        )
    }
}

// MARK: Views
extension MainVC {
    public unowned var rootView: MainView { return self.view as! MainView }
}

// MARK: Target Action Methods
extension MainVC {

	// NOTE: Implementation of highlighting
    @objc func nextButtonTapped() {
        self.rootView.dottedStepsIndicator.gotToNext()
    }
    
    @objc func previousButtonTapped() {
        self.rootView.dottedStepsIndicator.backToPrevious()
    }
}
```
