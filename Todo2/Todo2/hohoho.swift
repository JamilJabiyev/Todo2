////
////  BaseLabelTextInputView.swift
////  ToDo2
////
////  Created by Jamil Jabiyev on 13.08.23.
////
//
//import Foundation
//import UIKit
//import SnapKit
//
//
//struct BaseLabelTextInputViewModel {
//    let placeholder: String
//}
//
//class BaseLabelTextInputView: UIView, UITextFieldDelegate {
//    
//    
//    //MARK: - Life Cycle
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        setup()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    
//    //MARK: -
//    
//    lazy var wrapperInputFieldView: UIView = {
//        let view = UIView()
//        view.backgroundColor = .white
//        view.layer.cornerRadius = 10
//        view.addSubview(inputTextField)
//        
//        return view
//    }()
//    
//    lazy var inputTextField: UITextField = {
//        let textField = UITextField()
//        textField.backgroundColor = .white
//        textField.font = Fonts.style(type: .regular, size: 13)
//        //textField.textColor = UIColor(hex: "#000000CC")?.withAlphaComponent(0.8)
//        //textField.isEnabled = true
//        //textField.isUserInteractionEnabled = true
//        textField.becomeFirstResponder()
//        
//        
//        return textField
//    }()
//    
//    func configure(_ item: BaseLabelTextInputViewModel) {
//        // Do something
//        inputTextField.placeholder = item.placeholder
//        inputTextField.isEnabled = true
//        inputTextField.isUserInteractionEnabled = true
//        //inputTextField.becomeFirstResponder()
//        inputTextField.delegate = self
//        //inputTextField.delegate
//    }
//    
//    //MARK: - ui
//    func setup(){
//        addSubview(wrapperInputFieldView)
//        
//        wrapperInputFieldView.snp.makeConstraints { make in
//            make.width.equalTo(380)
//            make.height.equalTo(50)
//        }
//        
//        inputTextField.snp.makeConstraints { make in
//            make.left.equalTo(wrapperInputFieldView.snp.left).offset(25)
//            make.top.equalTo(wrapperInputFieldView.snp.top).offset(15)
//            make.bottom.equalTo(wrapperInputFieldView.snp.bottom).offset(-15)
//            make.height.equalTo(20)
//
//        }
//        
//        
//    }
//
//    
//    
//    
//    
//    
//    
//}
//
//
//
//
//
////
////  SceneDelegate.swift
////  Todo2
////
////  Created by Jamil Jabiyev on 13.08.23.
////
//
//import UIKit
//
//class SceneDelegate: UIResponder, UIWindowSceneDelegate {
//
//    var window: UIWindow?
//
//
//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
//        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
//        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
//        guard let windowScene = (scene as? UIWindowScene) else { return }
//        
//        let navigationController = UINavigationController(rootViewController: FirstViewController())
//        
//        let window = UIWindow(windowScene: windowScene)
//        
//        window.rootViewController = navigationController
//        
//        window.makeKeyAndVisible()
//        window.backgroundColor = UIColor(hex: "#F2F2F2")
//        
//        self.window = window
//    }
//
//    func sceneDidDisconnect(_ scene: UIScene) {
//        // Called as the scene is being released by the system.
//        // This occurs shortly after the scene enters the background, or when its session is discarded.
//        // Release any resources associated with this scene that can be re-created the next time the scene connects.
//        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
//    }
//
//    func sceneDidBecomeActive(_ scene: UIScene) {
//        // Called when the scene has moved from an inactive state to an active state.
//        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
//    }
//
//    func sceneWillResignActive(_ scene: UIScene) {
//        // Called when the scene will move from an active state to an inactive state.
//        // This may occur due to temporary interruptions (ex. an incoming phone call).
//    }
//
//    func sceneWillEnterForeground(_ scene: UIScene) {
//        // Called as the scene transitions from the background to the foreground.
//        // Use this method to undo the changes made on entering the background.
//    }
//
//    func sceneDidEnterBackground(_ scene: UIScene) {
//        // Called as the scene transitions from the foreground to the background.
//        // Use this method to save data, release shared resources, and store enough scene-specific state information
//        // to restore the scene back to its current state.
//    }
//
//
//}
//
//
////
////  FirstViewController.swift
////  ToDo2
////
////  Created by Jamil Jabiyev on 12.08.23.
////
//
//import Foundation
//import UIKit
//import SnapKit
//
//
//class FirstViewController: UIViewController {
//    
//    //MARK: - Life Cycle
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        setupUI()
//        
//    }
//    
//    //MARK: - Views
//    
//    private let shapeImageView: UIImageView = {
//        let imageView = UIImageView()
//        let image = UIImage(named: "shape-2")
//        imageView.image = image
//        
//        return imageView
//    }()
//    
//    private let centerImage: UIImageView = {
//        let imageView = UIImageView()
//        let image = UIImage(named: "undraw_done_checking_re_6vyx 1")
//        imageView.image = image
//        
//        return imageView
//    }()
//    
//    private let headerLabel: UILabel = {
//       let label = UILabel()
//        label.textAlignment = .center
//        label.text = "Gets things with TODs"
//        label.font = Fonts.style(type: .bold, size: 18)
//        
//        return label
//    }()
//    
//    private let infoLabel: UILabel = {
//       let label = UILabel()
//        label.text = "Lorem ipsum dolor sit amet consectetəur. Eget sit nec et euismod. Consequat urna quam felis interdum quisque. Malesuada adipiscing tristique ut eget sed."
//        label.numberOfLines = 0
//        label.textAlignment = .center
//        label.font = Fonts.style(type: .regular, size: 13)
//        
//        return label
//    }()
//    
//    private let getStartedButton: UIButton = {
//       let button = UIButton()
//        button.backgroundColor = UIColor(hex: "#50C2C9")
//        button.titleLabel?.textColor = UIColor(hex: "#FFFFFF")
//        button.layer.cornerRadius = 8
//        button.setTitle("Get Started", for: .normal)
//        button.titleLabel?.font = Fonts.style(type: .semibold, size: 18)
//        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//        
//        return button
//    }()
//    
//    @objc private func buttonTapped() {
//        let nextScreen = RegistrationViewController()
//            navigationController?.pushViewController(nextScreen, animated: true)
//        }
//    
//    //MARK: - Constraints
//    
//    private func setupUI(){
//                
//        let subviewsToAdd = [
//            shapeImageView,
//            centerImage,
//            headerLabel,
//            infoLabel,
//            getStartedButton
//        ]
//        
//        subviewsToAdd.forEach{ view.addSubview($0)}
//        
//        shapeImageView.snp.makeConstraints { make in
//            make.leading.equalToSuperview().inset(0)
//            make.top.equalToSuperview().inset(0)
//        }
//        
//        centerImage.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalToSuperview().offset(261)
//        }
//        
//        headerLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(centerImage.snp.bottom).offset(65)
//            make.leading.equalToSuperview().offset(110)
//        }
//        
//        infoLabel.snp.makeConstraints { make in
//            make.top.equalTo(headerLabel.snp.bottom).offset(16)
//            make.leading.equalTo(headerLabel.snp.leading)
//            //make.trailing.equalToSuperview().offset(16)
//            //make.left.right.equalTo(headerLabel)
//            //make.leading.equalTo(headerLabel.snp.leading)
//            make.trailing.equalTo(headerLabel.snp.trailing)
//            //make.left.equalTo(headerLabel.snp.left)
//            //make.right.equalTo(headerLabel.snp.right)
//            //make.centerX.equalToSuperview()
//            //make.bottom.lessThanOrEqualToSuperview()
//        }
//        
//        getStartedButton.snp.makeConstraints { make in
//            //make.top.equalTo(infoLabel.snp.bottom).offset(136)
//            make.bottom.equalToSuperview().offset(-73)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(380)
//            make.height.equalTo(60)
//        }
//        
//    }
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//}
//
//
//
//
//
////
////  RegistrationViewController.swift
////  ToDo2
////
////  Created by Jamil Jabiyev on 13.08.23.
////
//
//import Foundation
//import UIKit
//import SnapKit
//
//class RegistrationViewController: UIViewController{
//    
//    
//    
//    //MARK: - Life Cycle
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        setupUI()
//        tapGesture()
//    }
//    
//    //MARK: - Views
//    
//    private let shapeImageView: UIImageView = {
//        let imageView = UIImageView()
//        let image = UIImage(named: "shape-2")
//        imageView.image = image
//        
//        return imageView
//    }()
//    
//    private let headerLabel: UILabel = {
//       let label = UILabel()
//        label.textAlignment = .center
//        label.text = "Welcome to Onboard!"
//        label.font = Fonts.style(type: .bold, size: 18)
//        
//        return label
//    }()
//    
//    private let infoLabel: UILabel = {
//       let label = UILabel()
//        label.text = "Let’s help to meet up your tasks."
//        label.numberOfLines = 0
//        label.textAlignment = .center
//        label.font = Fonts.style(type: .regular, size: 13)
//        
//        return label
//    }()
//    
//    private let nameField: BaseLabelTextInputView = {
//        let textField = BaseLabelTextInputView()
//        textField.configure(.init(placeholder: "Enter your full name"))
//        //textField.inputTextField.delegate = self
//        return textField
//    }()
//    
//    private let emailField: BaseLabelTextInputView = {
//        let textField = BaseLabelTextInputView()
//        textField.configure(.init(placeholder: "Enter your Email"))
//        //textField.inputTextField.delegate = self
//        return textField
//    }()
//    
//    private let passwordField: BaseLabelTextInputView = {
//        let textField = BaseLabelTextInputView()
//        textField.configure(.init(placeholder: "Enter Password"))
//        //textField.inputTextField.delegate = self
//        return textField
//    }()
//    
//    private let confirmPasswordField: BaseLabelTextInputView = {
//        let textField = BaseLabelTextInputView()
//        textField.configure(.init(placeholder: "Confirm Password"))
//        //textField.inputTextField.delegate = self
//        return textField
//    }()
//    
//    private let stackView: UIStackView = {
//       let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.spacing = 80
//        
//        return stackView
//    }()
//    
//    private let registerButton: UIButton = {
//       let button = UIButton()
//        button.backgroundColor = UIColor(hex: "#50C2C9")
//        button.titleLabel?.textColor = UIColor(hex: "#FFFFFF")
//        button.layer.cornerRadius = 8
//        button.setTitle("Register", for: .normal)
//        button.titleLabel?.font = Fonts.style(type: .semibold, size: 18)
//        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//        
//        return button
//    }()
//    
//    @objc private func buttonTapped() {
//        let nextScreen = ViewController()
//            navigationController?.pushViewController(nextScreen, animated: true)
//        }
//    
//    private let signInLabel: UILabel = {
//        let label = UILabel()
//        label.textAlignment = .center
//        label.isUserInteractionEnabled = true
//
//        let attributedText = NSMutableAttributedString(string: "Already have an account ? ", attributes: [
//            .font: Fonts.style(type: .regular, size: 16),
//            .foregroundColor: UIColor.black // Цвет для части текста до "Sign In"
//        ])
//
//        attributedText.append(NSAttributedString(string: "Sign In", attributes: [
//            .font: Fonts.style(type: .regular, size: 16),
//            .foregroundColor: UIColor(hex: "#50C2C9") // Цвет для "Sign In"
//            ]))
//
//        label.attributedText = attributedText
//        
//            return label
//        }()
//    
//    private func tapGesture(){
//        //Добавляем жест "нажатие" (tap gesture)
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(signInLabelTapped))
//        signInLabel.addGestureRecognizer(tapGesture)
//        signInLabel.isUserInteractionEnabled = true
//    }
//    
//        
////    @objc func showAlert() {
////            let alertController = UIAlertController(title: "Alert", message: "Лейбл был нажат", preferredStyle: .alert)
////            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
////            alertController.addAction(okAction)
////            present(alertController, animated: true, completion: nil)
////        }
//    
//        @objc private func signInLabelTapped() {
//            let nextScreen = SignInViewController()
//            navigationController?.pushViewController(nextScreen, animated: true)
//        }
//    
//    
//    
//    
//    //MARK: - Constraints
//
//    private func setupUI(){
//        
//        
//        stackView.addArrangedSubview(nameField)
//        stackView.addArrangedSubview(emailField)
//        stackView.addArrangedSubview(passwordField)
//        stackView.addArrangedSubview(confirmPasswordField)
//                
//        let subviewsToAdd = [
//            shapeImageView,
//            headerLabel,
//            infoLabel,
//            stackView,
//            registerButton,
//            signInLabel
//        ]
//        
//        subviewsToAdd.forEach{ view.addSubview($0)}
//        
//        shapeImageView.snp.makeConstraints { make in
//            make.leading.equalToSuperview().inset(0)
//            make.top.equalToSuperview().inset(0)
//        }
//        
//        headerLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalToSuperview().offset(248)
//            make.leading.equalToSuperview().offset(111)
//        }
//        
//        infoLabel.snp.makeConstraints { make in
//            make.top.equalTo(headerLabel.snp.bottom).offset(16)
//            make.leading.equalTo(headerLabel.snp.leading)
//            make.trailing.equalTo(headerLabel.snp.trailing)
//        }
//        
//        stackView.snp.makeConstraints { make in
//            make.top.equalTo(infoLabel.snp.bottom).offset(90)
//            //make.centerX.equalToSuperview()
//            make.left.equalToSuperview().offset(23)
//        }
//        
//        registerButton.snp.makeConstraints { make in
//            //make.top.equalTo(stackView.snp.bottom).offset(73)
//            make.bottom.equalToSuperview().offset(-73)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(380)
//            make.height.equalTo(60)
//        }
//        
//        signInLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(registerButton.snp.bottom).offset(19)
//        }
//    
//    
//    
//    
//}
//
//
//
//
//
//
//
//}
//
//
////
////  SignInViewController.swift
////  ToDo2
////
////  Created by Jamil Jabiyev on 13.08.23.
////
//
//import Foundation
//import UIKit
//import SnapKit
//
//class SignInViewController: UIViewController {
//    
//    
//    //MARK: - Life Cycle
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        setupUI()
//        tapGesture()
//        
//    }
//    
//    
//    //MARK: - Views
//    
//    private let shapeImageView: UIImageView = {
//        let imageView = UIImageView()
//        let image = UIImage(named: "shape-2")
//        imageView.image = image
//        
//        return imageView
//    }()
//    
//    private let headerLabel: UILabel = {
//       let label = UILabel()
//        label.textAlignment = .center
//        label.text = "Welcome back"
//        label.font = Fonts.style(type: .bold, size: 18)
//        
//        return label
//    }()
//    
//    private let centerImage: UIImageView = {
//        let imageView = UIImageView()
//        let image = UIImage(named: "undraw_back_to_school_inwc 1")
//        imageView.image = image
//        
//        return imageView
//    }()
//    
//    private let emailField: BaseLabelTextInputView = {
//        let textField = BaseLabelTextInputView()
//        textField.configure(.init(placeholder: "Enter your Email"))
//        //textField.inputTextField.delegate = self
//        return textField
//    }()
//    
//    private let passwordField: BaseLabelTextInputView = {
//        let textField = BaseLabelTextInputView()
//        textField.configure(.init(placeholder: "Enter Password"))
//        //textField.inputTextField.delegate = self
//        return textField
//    }()
//    
//    private let stackView: UIStackView = {
//       let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.spacing = 80
//        
//        return stackView
//    }()
//    
//    private let forgetPasswordLabel: UILabel = {
//       let label = UILabel()
//        label.textAlignment = .center
//        label.text = "Forget password ?"
//        label.font = Fonts.style(type: .regular, size: 13)
//        label.textColor = UIColor(hex: "#50C2C9")
//        
//        return label
//    }()
//    
//    @objc func showAlert() {
//        let alertController = UIAlertController(title: nil, message: "Password was sended to your mail", preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
//        alertController.addAction(okAction)
//        present(alertController, animated: true, completion: nil)
//            }
//    
//    private func tapGesture(){
//        //Добавляем жест "нажатие" (tap gesture)
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(showAlert))
//        forgetPasswordLabel.addGestureRecognizer(tapGesture)
//        forgetPasswordLabel.isUserInteractionEnabled = true
//    }
//    
//    private let loginButton: UIButton = {
//       let button = UIButton()
//        button.backgroundColor = UIColor(hex: "#50C2C9")
//        button.titleLabel?.textColor = UIColor(hex: "#FFFFFF")
//        button.layer.cornerRadius = 8
//        button.setTitle("Login", for: .normal)
//        button.titleLabel?.font = Fonts.style(type: .semibold, size: 18)
//        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
//        
//        return button
//    }()
//    
//    @objc private func buttonTapped() {
//        let nextScreen = ViewController()
//            navigationController?.pushViewController(nextScreen, animated: true)
//        }
//    
//    
//    
//    //MARK: - Constraints
//    
//    private func setupUI(){
//        
//        stackView.addArrangedSubview(emailField)
//        stackView.addArrangedSubview(passwordField)
//        
//        let subviewsToAdd = [
//            shapeImageView,
//            headerLabel,
//            centerImage,
//            stackView,
//            forgetPasswordLabel,
//            loginButton,
//            //signUpLabel
//        ]
//        
//        subviewsToAdd.forEach{ view.addSubview($0)}
//        
//        shapeImageView.snp.makeConstraints { make in
//            make.leading.equalToSuperview().inset(0)
//            make.top.equalToSuperview().inset(0)
//        }
//        
//        headerLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalToSuperview().offset(248)
//            //make.leading.equalToSuperview().offset(111)
//        }
//        
//        centerImage.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(headerLabel.snp.bottom).offset(53)
//        }
//        
//        stackView.snp.makeConstraints { make in
//            make.top.equalTo(centerImage.snp.bottom).offset(87)
//            //make.centerX.equalToSuperview()
//            make.left.equalToSuperview().offset(23)
//        }
//        
//        forgetPasswordLabel.snp.makeConstraints { make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(stackView.snp.bottom).offset(90)
//        }
//        
//        loginButton.snp.makeConstraints { make in
//            //make.top.equalTo(forgetPasswordLabel.snp.bottom).offset(48)
//            make.bottom.equalToSuperview().offset(-73)
//            make.centerX.equalToSuperview()
//            make.width.equalTo(380)
//            make.height.equalTo(60)
//        }
//        
//    }
//
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//    
//}
//
//
//
//
//
//
////
////  ViewController.swift
////  ToDo2
////
////  Created by Jamil Jabiyev on 11.08.23.
////
//
//import UIKit
//import SnapKit
//
//class ViewController: UIViewController {
//
//    
//    //MARK: - Life Cycle
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        setupUI()
//        saveNewDataWithUserDefaults()
//        
//    }
//    
//    //MARK: - Views
//    
//    private let rectangleImageView: UIImageView = {
//        let rectangleImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 430, height: 292))
//        let image = UIImage(named: "Rectangle 4" )
//        rectangleImage.image = image
//        
//        
//        return rectangleImage
//    }()
//    
//    private let profileImageView: UIImageView = {
//        let profileImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
//        let image = UIImage(named: "Ellipse 3" )
//        profileImageView.image = image
//        
//        
//        return profileImageView
//    }()
//    
//    private let shapeImageView: UIImageView = {
//        let shapeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 270))
//        let image = UIImage(named: "shape" )
//        shapeImageView.image = image
//        
//        return shapeImageView
//    }()
//    
//    private let clockImageView: UIImageView = {
//        let clockImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
//        let image = UIImage(named: "clock" )
//        clockImageView.image = image
//        
//        return clockImageView
//    }()
//    
//    private let wellcomeLabel: UILabel = {
//        let wellcomeLabel = UILabel()
//        wellcomeLabel.text = "Welcome Jeegar goyani"
//        wellcomeLabel.textColor = UIColor(hex: "#FFFFFF")
//        wellcomeLabel.font = Fonts.style(type: .bold, size: 18)
//        
//        return wellcomeLabel
//    }()
//    
//    private let goodAfternoonLabel: UILabel = {
//        var wellcomeLabel = UILabel()
//        wellcomeLabel.text = "Good Afternoon"
//        wellcomeLabel.font = Fonts.style(type: .semibold, size: 12)
//        
//        return wellcomeLabel
//    }()
//    
//    private let taskListLabel: UILabel = {
//        let wellcomeLabel = UILabel()
//        wellcomeLabel.text = "Task list"
//        wellcomeLabel.font = Fonts.style(type: .semibold, size: 14)
//        
//        return wellcomeLabel
//    }()
//    
//    private let viewForTableViewAndHeaders: UIImageView = {
//        //let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 382, height: 309))
//        //view.frame = CGRect(x: 0, y: 0, width: 382, height: 309)
//        let view = UIImageView()
//        view.backgroundColor = .white
//        view.layer.cornerRadius = 10
//        
//        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
//        view.layer.shadowOpacity = 1
//        view.layer.shadowOffset = CGSize(width: 0, height: 4)
//        view.layer.shadowRadius = 10
//        
//        
//        return view
//    }()
//    
//    private let dailyTaskLabel: UILabel = {
//       let label = UILabel()
//        label.text = "Daily Task"
//        label.textColor = UIColor(hex: "#000000")?.withAlphaComponent(0.7)
//        label.font = Fonts.style(type: .semibold, size: 12)
//        
//        return label
//    }()
//    
//    private let plusButton: UIButton = {
//       let button = UIButton()
//        button.setImage(UIImage(named: "plus"), for: .normal)
//        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
//        
//        return button
//    }()
//    
//    @objc private func plusButtonTapped() {
//        // Обработчик события нажатия на кнопку
//        
//        // Создание алерта
//        let alertController = UIAlertController(title: "Add Task", message: nil, preferredStyle: .alert)
//
//        // Добавление текстового поля
//        alertController.addTextField { textField in
//            textField.placeholder = "Task name"
//        }
//
//        // Добавление кнопки "OK" с обработчиком
//        alertController.addAction(UIAlertAction(title: "OK", style: .default) { [weak self] _ in
//            if let taskName = alertController.textFields?.first?.text, !taskName.isEmpty {
//
//                self?.tasks.insert(taskName, at: 0)
//                //self?.tasks.append(taskName)
//                self?.saveTasksToUserDefaults()
//                self?.tableView.reloadData()
//            }
//            
//        })
//
//        // Добавление кнопки "Cancel"
//        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
//
//        // Отображение алерта
//        present(alertController, animated: true, completion: nil)
//    }
//    
//    private let logoButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "Rectangle 9"), for: .normal)
//        button.setImage(UIImage(named: "Rectangle 9-2"), for: .selected)
//        button.addTarget(self, action: #selector(logoButtonTapped), for: .touchUpInside)
//
//        return button
//    }()
//    
//    @objc private func logoButtonTapped(sender: UIButton) {
//        // Обработчик события нажатия на кнопку
//        sender.isSelected.toggle() // Переключаем состояние кнопки (выбрано/не выбрано)
//        //logoButton.setImage(UIImage(named: "Rectangle 9-2"), for: .normal)
//        
//    }
//    
//    //MARK: - UserDefaults
//    func saveTasksToUserDefaults() {
//        UserDefaults.standard.set(tasks, forKey: "savedTasks")
//    }
//    
//    func saveNewDataWithUserDefaults(){
//        if let savedTasks = UserDefaults.standard.array(forKey: "savedTasks") as? [String] {
//                tasks = savedTasks
//                tableView.reloadData()
//            }
//    }
//    
//    
//    //MARK: - TableView
//    private let tableView: UITableView = {
//       let tableView = UITableView()
//        tableView.backgroundColor = UIColor(hex: "#50C2C9")
//
//        return tableView
//    }()
//    
//    var tasks: [String] = ["Learning Programming by 12PM", "Learn how to cook by 1PM", "Learn how to play at 2PM", "Have lunch at 4PM", "Going to travel 6PM"]
//
//    
//    //MARK: - identifikator
//    let cellIdentifier = "Cell"
//    
//    
//    
//    
//    //MARK: - Constraints
//    
//    private func setupUI(){
//        
//        view.backgroundColor = UIColor(red: 0.941, green: 0.957, blue: 0.953, alpha: 1)
//        
//        viewForTableViewAndHeaders.addSubview(dailyTaskLabel)
//        viewForTableViewAndHeaders.addSubview(plusButton)
//        
//        tableView.dataSource = self
//        tableView.delegate = self
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
//        tableView.backgroundColor = UIColor(hex: "#50C2C9")
//        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "header")
//        tableView.separatorStyle = .none
//
//        
//        
//        let subviewsToAdd = [
//        rectangleImageView,
//        profileImageView,
//        shapeImageView,
//        clockImageView,
//        wellcomeLabel,
//        goodAfternoonLabel,
//        taskListLabel,
//        viewForTableViewAndHeaders,
//        dailyTaskLabel,
//        plusButton,
//        tableView
//        ]
//        
//        subviewsToAdd.forEach{ view.addSubview($0)}
//        
//        rectangleImageView.snp.makeConstraints{ make in
//            make.top.equalToSuperview()
//            make.leading.trailing.equalToSuperview()
//        }
//        
//        profileImageView.snp.makeConstraints{ make in
//            make.top.equalToSuperview().offset(133)
//            make.centerX.equalToSuperview()
//        }
//        
//        shapeImageView.snp.makeConstraints{ make in
//            make.leading.equalToSuperview().inset(0)
//            make.top.equalToSuperview().inset(0)
//            
//        }
//        
//        clockImageView.snp.makeConstraints{ make in
//            make.centerX.equalToSuperview()
//            make.top.equalToSuperview().offset(341)
//            
//        }
//        
//        wellcomeLabel.snp.makeConstraints{ make in
//            make.top.equalTo(profileImageView.snp.bottom).offset(16)
//            make.centerX.equalToSuperview()
//        }
//        
//        goodAfternoonLabel.snp.makeConstraints{ make in
//            make.top.equalTo(rectangleImageView.snp.bottom).offset(26)
//            make.trailing.equalToSuperview().offset(-25)
//        }
//        
//        taskListLabel.snp.makeConstraints{ make in
//            make.top.equalTo(rectangleImageView.snp.bottom).offset(202)
//            make.leading.equalToSuperview().offset(25)
//        }
//        
//        viewForTableViewAndHeaders.snp.makeConstraints{ make in
//            make.centerX.equalToSuperview()
//            make.top.equalTo(clockImageView.snp.bottom).offset(89)
//            make.width.equalTo(382)
//            make.height.equalTo(309)
//        }
//
//        dailyTaskLabel.snp.makeConstraints { make in
//            make.leading.equalTo(viewForTableViewAndHeaders.snp.leading).offset(25)
//            make.top.equalTo(viewForTableViewAndHeaders.snp.top).offset(24)
//        }
//
//        plusButton.snp.makeConstraints { make in
//            make.trailing.equalTo(viewForTableViewAndHeaders.snp.trailing).offset(-24)
//            make.top.equalTo(viewForTableViewAndHeaders.snp.top).offset(20)
//            make.width.height.equalTo(24) // Размер кнопки
//        }
//
//        tableView.snp.makeConstraints{ make in
//            make.top.equalTo(viewForTableViewAndHeaders.snp.top).offset(96)
//            make.leading.equalTo(viewForTableViewAndHeaders.snp.leading).offset(25)
//            make.bottom.equalTo(viewForTableViewAndHeaders.snp.bottom).inset(68)
//            make.trailing.equalTo(viewForTableViewAndHeaders.snp.trailing).inset(35)
//        }
//        
//        
//    }
//
//    
//    
//    
//    
//    
//    
//    
//}
//
//extension ViewController: UITableViewDataSource, UITableViewDelegate {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return tasks.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
//        let cellStackView = UIStackView()
//        cellStackView.axis = .horizontal
//        cellStackView.spacing = 8 // Расстояние между кнопкой и текстом
//        cellStackView.alignment = .center
//        
//        
//        let logoButtonn: UIButton = {
//            let button = UIButton()
//            button.setImage(UIImage(named: "Rectangle 9"), for: .normal)
//            button.setImage(UIImage(named: "Rectangle 9-2"), for: .selected)
//            button.addTarget(self, action: #selector(logoButtonTapped), for: .touchUpInside)
//
//            return button
//        }()
//        
//        let cellTextLabel = UILabel()
//        
//        cellTextLabel.text = tasks[indexPath.row] // Ваш текст из массива tasks
//        cellTextLabel.font = Fonts.style(type: .semibold, size: 12)
//        cellTextLabel.textColor = UIColor(hex: "#000000")?.withAlphaComponent(0.7)
//
//        // Добавьте кнопку и метку в StackView
//        cellStackView.setCustomSpacing(8, after: logoButtonn)
//
//        cellStackView.addArrangedSubview(logoButtonn)
//        cellStackView.addArrangedSubview(cellTextLabel)
//
//        // Добавьте StackView в ячейку
//        cellStackView.removeFromSuperview()
//        cell.contentView.addSubview(cellStackView)
//
//        // Используйте SnapKit для настройки constraint'ов StackView
//        cellStackView.snp.makeConstraints { make in
//            make.leading.equalTo(tableView.snp.leading) // Отступ от левого края ячейки
//        }
//
//        return cell
//    }
//
//
//
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            return 32 // Высота ячейки
//        }
//
//
//}
//
//
////
////  Fonts.swift
////  ToDo2
////
////  Created by Jamil Jabiyev on 11.08.23.
////
//
//import Foundation
//import UIKit
//
//enum FontType: String {
//    case regular = "Regular"
//    case medium = "Medium"
//    case semibold = "SemiBold"
//    case bold = "Bold"
//}
//
//struct Fonts {
//    static func style(type: FontType, size: CGFloat) -> UIFont? {
//        UIFont(name: "Poppins-\(type.rawValue)", size: size)
//    }
//}
//
//
//
////
////  Extensions.swift
////  ToDo2
////
////  Created by Jamil Jabiyev on 11.08.23.
////
//
//import Foundation
//
//import UIKit
//
//extension UIColor {
//    convenience init?(hex: String) {
//        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
//        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
//        
//        var rgb: UInt64 = 0
//        
//        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
//            return nil
//        }
//        
//        self.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
//                  green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
//                  blue: CGFloat(rgb & 0x0000FF) / 255.0,
//                  alpha: 1.0)
//    }
//}
//
//
//
