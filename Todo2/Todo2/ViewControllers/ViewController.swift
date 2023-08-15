//
//  ViewController.swift
//  ToDo2
//
//  Created by Jamil Jabiyev on 11.08.23.
//

import UIKit
import SnapKit

struct Task {
    let title: String
    let isCompleted: Bool
}

class ViewController: UIViewController {

    var tasks: [String] = []
    
    // ok
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
        saveNewDataWithUserDefaults()
    }
    
    //MARK: - Views
    
    private let shapeImageView: UIImageView = {
        let shapeImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 270))
        let image = UIImage(named: "shape" )
        shapeImageView.image = image
        return shapeImageView
    }()
    
    private let rectangleImageView: UIImageView = {
        let rectangleImage = UIImageView()
        rectangleImage.image = UIImage(named: "Rectangle 4")
        return rectangleImage
    }()
    
    private let profileImageView: UIImageView = {
        let profileImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        let image = UIImage(named: "Ellipse 3" )
        profileImageView.image = image
        return profileImageView
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
    
    private let clockImageView: UIImageView = {
        let clockImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 120, height: 120))
        let image = UIImage(named: "clock" )
        clockImageView.image = image
        return clockImageView
    }()
    
    private let taskListLabel: UILabel = {
        let wellcomeLabel = UILabel()
        wellcomeLabel.text = "Task list"
        wellcomeLabel.font = Fonts.style(type: .semibold, size: 14)
        return wellcomeLabel
    }()

    private let box: UIView = {
       let box = UIView()
        box.backgroundColor = .white
        box.layer.cornerRadius = 10
        box.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25).cgColor
        box.layer.shadowOpacity = 1
        box.layer.shadowOffset = CGSize(width: 0, height: 4)
        box.layer.shadowRadius = 10
        return box
    }()
    
    private let dailyTaskLabel: UILabel = {
       let label = UILabel()
        label.text = "Daily Task"
        label.textColor = UIColor(hex: "#000000")?.withAlphaComponent(0.7)
        label.font = Fonts.style(type: .semibold, size: 12)
        
        return label
    }()
    
    private lazy var plusButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "plus"), for: .normal)
        button.addTarget(self, action: #selector(plusButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    @objc
    private func plusButtonTapped() {
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
    
//    private lazy var logoButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "Rectangle 9"), for: .normal)
//        button.setImage(UIImage(named: "Rectangle 9-2"), for: .selected)
//        button.addTarget(self, action: #selector(logoButtonTapped), for: .touchUpInside)
//        return button
//    }()
//    
//    @objc
//    private func logoButtonTapped(sender: UIButton) {
//        sender.isSelected.toggle() // Переключаем состояние кнопки (выбрано/не выбрано)
//    }
    
    //MARK: - UserDefaults
    
    struct userDefaultsStruct {
        let textLabel: String
        let button: UIButton
    }
    
    func saveTasksToUserDefaults() {
        UserDefaults.standard.set(tasks, forKey: "savedTasks")
    }
    
//    func saveTasksToUserDefaults() {
//        UserDefaults.standard.set(tasks, forKey: userDefaultsStruct(textLabel: "savedTasks", button: UIButton))
//    }
    
    func saveNewDataWithUserDefaults(){
        if let savedTasks = UserDefaults.standard.array(forKey: "savedTasks") as? [String] {
            tasks = savedTasks
            tableView.reloadData()
        }
    }
    
    //MARK: - TableView
    
    private let tableView: UITableView = {
        let tableView = UITableView()
//        tableView.backgroundColor = UIColor(hex: "#50C2C9")
        tableView.backgroundColor = UIColor(red: 0.941, green: 0.957, blue: 0.953, alpha: 1)
        return tableView
    }()
    
    //MARK: - identifikator
    
    let cellIdentifier = "Cell"
    
    //MARK: - Constraints
    
    private func setupUI(){
        
        view.backgroundColor = UIColor(red: 0.941, green: 0.957, blue: 0.953, alpha: 1)
        
        box.addSubview(dailyTaskLabel)
        box.addSubview(plusButton)
        
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
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
        box,
        tableView
        ]
        
        subviewsToAdd.forEach{ view.addSubview($0)}
        
        shapeImageView.snp.makeConstraints{ make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview()
        }
        
        rectangleImageView.snp.makeConstraints{ make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
        }
        
        profileImageView.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(128)
            make.centerX.equalToSuperview()
        }
        
        wellcomeLabel.snp.makeConstraints{ make in
            make.top.equalTo(profileImageView.snp.bottom).offset(16)
            make.centerX.equalToSuperview()
        }
        
        goodAfternoonLabel.snp.makeConstraints{ make in
            make.top.equalTo(rectangleImageView.snp.bottom).offset(24)
            make.trailing.equalToSuperview().inset(24)
        }
        
        clockImageView.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(goodAfternoonLabel.snp.bottom).offset(16)
        }
        
        taskListLabel.snp.makeConstraints{ make in
            make.top.equalTo(clockImageView.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
        }
        
        box.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(taskListLabel.snp.bottom).offset(32)
            make.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(309)
        }

        dailyTaskLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.leading.equalToSuperview().offset(16)
        }

        plusButton.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().inset(16)
            //make.height.equalTo(24) // Размер кнопки
        }

        tableView.snp.makeConstraints{ make in
            make.top.equalTo(dailyTaskLabel.snp.top).offset(64)
            make.leading.trailing.equalTo(box).inset(24)
            make.bottom.equalTo(box.snp.bottom).inset(32)
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as? CustomTableViewCell {
            cell.configure(title: tasks[indexPath.row], isSelected: false)
            cell.backgroundView = .none
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false // Запретить выделение ячейки
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 32 // Высота ячейки
        }
    
    // Метод вызывается при нажатии на кнопку "Удалить"
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Удаление элемента из вашего источника данных
            //data.remove(at: indexPath.row)
            
            // Удаление строки из таблицы
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
