//
//  MainViewController.swift
//  ConstraintMaker
//
//  Created by SwiftDevelop on 8/25/26.
//

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - Properties
    
    private let examples: [ExampleViewController] = [
        ActiveExample(),
        EdgesExample(),
        EdgesExample2(),
        CenterExample(),
        SizeExample(),
        SizeExample2(),
        SizeExample3(),
        UpdateExample(),
        RemakeExample(),
        PriorityExample(),
    ]
    
    // MARK: - UI Components
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInit()
        setupUIHierarchy()
        setupUIConstraints()
        setupTableViewCells()
    }
    
    // MARK: - Setup Methods
    
    private func setupInit() {
        title = "Main"
        view.backgroundColor = .white
    }
    
    private func setupUIHierarchy() {
        view.addSubview(tableView)
    }
    
    private func setupUIConstraints() {
        tableView.makeConstraint
            .edges()
            .active()
    }
    
    private func setupTableViewCells() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

// MARK: - UITableViewDataSource

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return examples.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        var configuration = cell.defaultContentConfiguration()
        configuration.text = String(describing: type(of: examples[indexPath.row]))
        cell.contentConfiguration = configuration
        cell.selectionStyle = .none
        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let exampleVC = examples[indexPath.row]
        navigationController?.pushViewController(exampleVC, animated: true)
    }
    
}
