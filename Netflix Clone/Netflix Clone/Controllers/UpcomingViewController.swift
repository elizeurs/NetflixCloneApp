//
//  UpcomingViewController.swift
//  Netflix Clone
//
//  Created by Elizeu RS on 11/06/23.
//

import UIKit

class UpcomingViewController: UIViewController {
  
  private var titles: [Title] = [Title]()
  
  private let upcomingTable: UITableView = {
  
  let table = UITableView()
    table.register(TitleTableViewCell.self, forCellReuseIdentifier: TitleTableViewCell.identifier)
    return table
  }()

    override func viewDidLoad() {
        super.viewDidLoad()
//      view.backgroundColor = .systemGreen
      view.backgroundColor = .systemBackground
      title = "Upcoming"
      navigationController?.navigationBar.prefersLargeTitles = true
      navigationController?.navigationItem.largeTitleDisplayMode = .always
      
      view.addSubview(upcomingTable)
      upcomingTable.delegate = self
      upcomingTable.dataSource = self
      
      fetchUpcoming()
    }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    upcomingTable.frame = view.bounds
  }
  
  private func fetchUpcoming() {
    // [weak self] - to avoid any memory leak
    APICaller.shared.getUpcomingMovies { [weak self] result in
      switch result {
      case .success(let titles):
        self?.titles = titles
        // DispatchQueue.main.async - async function, to make sure that is going to be executed on the main thread.
        DispatchQueue.main.async {
          self?.upcomingTable.reloadData()
        }
        
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }
}

extension UpcomingViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return titles.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleTableViewCell.identifier, for: indexPath) as? TitleTableViewCell else {
      return UITableViewCell()
    }
    
    let title = titles[indexPath.row]
    cell.configure(with: TitleViewModel(titleName: (title.original_title ?? title.original_name) ?? "Unknown title name", posterURL: title.poster_path ?? ""))
    
//    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
////    cell.textLabel?.text = "text"
//    cell.textLabel?.text = titles[indexPath.row].original_name ?? titles[indexPath.row].original_title ?? "Unknown"
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 170
    
  }
}
