//
//  ViewController.swift
//  ToDo2
//
//  Created by Jamil Jabiyev on 11.08.23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        saveNewDataWithUserDefaults()
    }
    
    //MARK: - Views
    
    private let rectangleImageView: UIImageView = {
        let rectangleImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 430, height: 292))
        let image = UIImage(named: "Rectangle 4" )
        rectangleImage.image = image
        
        return rectangleImage
    }()
    
    private let profileImageView: UIImageView = {
        let profileImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let image = UIImage(named: "Ellipse 3" )
        profileImageView.image = image
        
        return profileImageView
    }()
    
    private let shapeImageView: UIImageView = {
        let shapeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 270))
        let image = UIImage(named: "shape" )
        shapeImageView.image = image
        
        return shapeImageView
    }()
    
    private let clockImageView: UIImageView = {
        let clockImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
        let image = UIImage(named: "clock" )
        clockImageView.image = image
        
        return clockImageView
    }()
    
    private let wellcomeLabel: UILabel = {
        let wellcomeLabel = UILabel()
        wellcomeLabel.text = "Welcome Jeegar goyani"
        wellcomeLabel.textColor = UIColor(hex: "#FFFFFF")
        wellcomeLabel.font = Fonts.style(type: .bold, size: 18)
        
        return wellcomeLabel
    }()
    
    private let goodAfternoonLabel: UILabel = {
        var wellcomeLabel = UILabel()
        wellcomeLabel.text = "Good Afternoon"
        wellcomeLabel.font = Fonts.style(type: .semibold, size: 12)
        
        return wellcomeLabel
    }()
    
    private let taskListLabel: UILabel = {
        let wellcomeLabel = UILabel()
        wellcomeLabel.text = "Task list"
        wellcomeLabel.font = Fonts.style(type: .semibold, size: 14)
        
        return wellcomeLabel
    }()
    
    private let viewForTableViewAndHeaders: UIImageView = {
        //let view = UIImageView(frame: CGRect(x: 0, y: 0, width: 382, height: 309))
        //view.frame = CGRect(x: 0, y: 0, width: 382, height: 309)
        let view = UIImageView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 10
        
        return view
    }()
    
    private let dailyTaskLabel: UILabel = {
       let label = UILabel()
        label.text = "Daily Task"
        label.textColor = UIColor(hex: "#000000")?.withAlphaComponent(0.7)
        label.font = Fonts.style(type: .semibold, size: 12)
        
        return label
    }()
    
    private let plusButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc private func plusButtonTapped() {
        // Создание алерта
        let alertController = UIAlertController(title: "Add Task", message: nil, preferredStyle: .alert)

        // Добавление текстового поля
        alertController.addTextField { textField in
            textField.placeholder = "Task name"
        }

        // Добавление кнопки "OK" с обработчиком
        alertController.addAction(UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            if let taskName = alertController.textFields?.first?.text, !taskName.isEmpty {

                self?.tasks.insert(taskName, at: 0)
                //self?.tasks.append(taskName)
                self?.saveTasksToUserDefaults()
                self?.tableView.reloadData()
            }
            
        })

        // Добавление кнопки "Cancel"
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        // Отображение алерта
        present(alertController, animated: true, completion: nil)
    }
    
    private let logoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "Rectangle 9"), for: .normal)
        button.setImage(UIImage(named: "Rectangle 9-2"), for: .selected)
        button.addTarget(self, action: #selector(logoButtonTapped), for: .touchUpInside)

        return button
    }()
    
    @objc private func logoButtonTapped(sender: UIButton) {
        sender.isSelected.toggle() // Переключаем состояние кнопки (выбрано/не выбрано)
    }
    
    //MARK: - UserDefaults
    func saveTasksToUserDefaults() {
        UserDefaults.standard.set(tasks, forKey: "savedTasks")
    }
    
    func saveNewDataWithUserDefaults(){
        if let savedTasks = UserDefaults.standard.array(forKey: "savedTasks") as? [String] {
                tasks = savedTasks
                tableView.reloadData()
            }
    }
    
    
    //MARK: - TableView
    private let tableView: UITableView = {
       let tableView = UITableView()
        tableView.backgroundColor = UIColor(hex: "#50C2C9")

        return tableView
    }()
    
    var tasks: [String] = [
        "Learning Programming by 12PM",
        "Learn how to cook by 1PM",
        "Learn how to play at 2PM",
        "Have lunch at 4PM",
        "Going to travel 6PM"
    ]
    
    //MARK: - identifikator
    
    let cellIdentifier = "Cell"
    
    //MARK: - Constraints
    
    private func setupUI(){
        
        view.backgroundColor = UIColor(red: 0.941, green: 0.957, blue: 0.953, alpha: 1)
        
        viewForTableViewAndHeaders.addSubview(dailyTaskLabel)
        viewForTableViewAndHeaders.addSubview(plusButton)
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.backgroundColor = UIColor(hex: "#50C2C9")
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "header")
        tableView.separatorStyle = .none

        let subviewsToAdd = [
        rectangleImageView,
        profileImageView,
        shapeImageView,
        clockImageView,
        wellcomeLabel,
        goodAfternoonLabel,
        taskListLabel,
        viewForTableViewAndHeaders,
        dailyTaskLabel,
        plusButton,
        tableView
        ]
        
        subviewsToAdd.forEach{ view.addSubview($0)}
        
        rectangleImageView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        profileImageView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(133)
            make.centerX.equalToSuperview()
        }
        
        shapeImageView.snp.makeConstraints{ make in
            make.leading.equalToSuperview().inset(0)
            make.top.equalToSuperview().inset(0)
        }
        
        clockImageView.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalToSuperview().offset(341)
        }
        
        wellcomeLabel.snp.makeConstraints{ make in
            make.top.equalTo(profileImageView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        goodAfternoonLabel.snp.makeConstraints{ make in
            make.top.equalTo(rectangleImageView.snp.bottom).offset(26)
            make.trailing.equalToSuperview().offset(-25)
        }
        
        taskListLabel.snp.makeConstraints{ make in
            make.top.equalTo(rectangleImageView.snp.bottom).offset(202)
            make.leading.equalToSuperview().offset(25)
        }
        
        viewForTableViewAndHeaders.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(clockImageView.snp.bottom).offset(89)
            make.width.equalTo(382)
            make.height.equalTo(309)
        }

        dailyTaskLabel.snp.makeConstraints { make in
            make.leading.equalTo(viewForTableViewAndHeaders.snp.leading).offset(25)
            make.top.equalTo(viewForTableViewAndHeaders.snp.top).offset(24)
        }

        plusButton.snp.makeConstraints { make in
            make.trailing.equalTo(viewForTableViewAndHeaders.snp.trailing).offset(-24)
            make.top.equalTo(viewForTableViewAndHeaders.snp.top).offset(20)
            make.width.height.equalTo(24) // Размер кнопки
        }

        tableView.snp.makeConstraints{ make in
            make.top.equalTo(viewForTableViewAndHeaders.snp.top).offset(96)
            make.leading.equalTo(viewForTableViewAndHeaders.snp.leading).offset(25)
            make.bottom.equalTo(viewForTableViewAndHeaders.snp.bottom).inset(68)
            make.trailing.equalTo(viewForTableViewAndHeaders.snp.trailing).inset(35)
        }
    }

    
    
}



extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        let cellStackView = UIStackView()
        cellStackView.axis = .horizontal
        cellStackView.spacing = 8 // Расстояние между кнопкой и текстом
        cellStackView.alignment = .center
        
        
        let logoButtonn: UIButton = {
            let button = UIButton()
            button.setImage(UIImage(named: "Rectangle 9"), for: .normal)
            button.setImage(UIImage(named: "Rectangle 9-2"), for: .selected)
            button.addTarget(self, action: #selector(logoButtonTapped), for: .touchUpInside)

            return button
        }()
        
        let cellTextLabel = UILabel()
        
        cellTextLabel.text = tasks[indexPath.row] // текст из массива tasks
        cellTextLabel.font = Fonts.style(type: .semibold, size: 12)
        cellTextLabel.textColor = UIColor(hex: "#000000")?.withAlphaComponent(0.7)

        // Добавьте кнопку и метку в StackView
        cellStackView.setCustomSpacing(8, after: logoButtonn)
        cellStackView.addArrangedSubview(logoButtonn)
        cellStackView.addArrangedSubview(cellTextLabel)

        // Добавьте StackView в ячейку
        cellStackView.removeFromSuperview()
        cell.contentView.addSubview(cellStackView)

        // Используйте SnapKit для настройки constraint'ов StackView
        cellStackView.snp.makeConstraints { make in
            make.leading.equalTo(tableView.snp.leading) // Отступ от левого края ячейки
        }

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 32 // Высота ячейки
        }
    
    
}
