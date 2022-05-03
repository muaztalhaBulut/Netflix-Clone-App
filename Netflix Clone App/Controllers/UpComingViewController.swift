//
//  UpComingViewController.swift
//  Netflix Clone App
//
//  Created by Muaz Talha Bulut on 30.04.2022.
//

import UIKit
import SDWebImage

class UpComingViewController: UIViewController {
   
    private var titles: [Title] = [Title]()
    
    private let upComingTable: UITableView = {
        let table = UITableView()
        table.register(TitleTabelViewCell.self, forCellReuseIdentifier: TitleTabelViewCell.identifier)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        title = "UpComing"
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        view.addSubview(upComingTable)
       
        upComingTable.delegate = self
        upComingTable.dataSource = self
        fetchUpComing()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        upComingTable.frame = view.bounds
    }
    
    private func fetchUpComing() {
        APICaller.shared.getUpcomingMoview { [weak self] result in
            switch result {
                case .success(let titles):
                    self?.titles = titles
                    DispatchQueue.main.async {
                        self?.upComingTable.reloadData()
                    }
                case .failure(let error):
                    print(error.localizedDescription)
            }
        }
        
    }
}

extension UpComingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTabelViewCell.identifier, for: indexPath) as? TitleTabelViewCell else {
            return UITableViewCell()
        }
        let title = titles[indexPath.row]
        cell.configure(with: TitleViewModel(titleName: (title.original_title ?? title.original_name) ?? "Unkwnon title name", posterURL: title.poster_path ?? ""))
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
}
