import UIKit

class DonutView : UIView {
    var topLabel = UIComponents.shared.label(text: "",alignment: .center)
    var scoreLabel = UIComponents.shared.label(text: "",alignment: .center,fontSize: 24,color : UIColor.customYellow)
    var bottomLabel = UIComponents.shared.label(text: "",alignment: .center)
    var stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.alpha = 0
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

/// setup UI and Constraints.
extension DonutView {
    private func setupUI() {
        layer.cornerRadius = (UIScreen.main.bounds.width/2)/2
        layer.borderWidth  = 2
        layer.borderColor  = UIColor.black.cgColor
        [topLabel,scoreLabel,bottomLabel].forEach { view in
            stackView.addArrangedSubview(view)
        }
        stackView.alignment = .center
        stackView.axis = .vertical
        stackView.spacing = 8
        addSubViews(views: stackView)
        setupConstraints()
    }
    /// setup constraints..
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }
}

/// bind data..
extension DonutView {
    func bindData(score : String) {
        topLabel.text = "Your credit score is"
        scoreLabel.text = score
        bottomLabel.text = "out of 700"
        self.alpha = 1
    }
}
