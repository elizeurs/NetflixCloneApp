//
//  HomeViewController.swift
//  Netflix Clone
//
//  Created by Elizeu RS on 11/06/23.
//

import UIKit

class HomeViewController: UIViewController {
  
  let sectionTitles: [String] = ["Trending  Movies", "Popular", "Trending Tv", "Upcoming Movies", "Top rated"]
  
  private let homefeedTable: UITableView = {
    let table = UITableView(frame: .zero, style: .grouped)
    table.register(CollectionViewTableViewCell.self, forCellReuseIdentifier: CollectionViewTableViewCell.identifier)
    return table
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //      view.backgroundColor = .systemRed
    view.backgroundColor = .systemBackground
    view.addSubview(homefeedTable)
    
    homefeedTable.delegate = self
    homefeedTable.dataSource = self
    
    configureNavBar()
    
    let headerView = HeroHeaderUIView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: 450))
    homefeedTable.tableHeaderView = headerView
    
    getTrendingMovies()
  }
  
  private func configureNavBar() {
    var image = UIImage(named: "netflixLogo")
    image = image?.withRenderingMode(.alwaysOriginal)
    navigationItem.leftBarButtonItem = UIBarButtonItem(image: image, style: .done, target: self, action: nil)
    
    navigationItem.rightBarButtonItems = [
      UIBarButtonItem(image: UIImage(systemName: "person"), style: .done, target: self, action: nil),
      UIBarButtonItem(image: UIImage(systemName: "play.rectangle"), style: .done, target: self, action: nil)
    ]
    navigationController?.navigationBar.tintColor = .white
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    homefeedTable.frame = view.bounds
  }
  
  private func getTrendingMovies() {
    //    APICaller.shared.getTrendingMovies { _ in
    APICaller.shared.getTrendingMovies { results in
      switch results {
      case .success(let movies):
        print(movies)
      case .failure(let error):
        print(error)
      }
    }
  }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return sectionTitles.count
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//    cell.textLabel?.text = "Hello world"
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: CollectionViewTableViewCell.identifier, for: indexPath) as? CollectionViewTableViewCell else {
      return UITableViewCell()
      
    }
    
    cell.backgroundColor = .red
    return cell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 200
  }
  
  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 40
  }
  
  func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
    guard let header = view as? UITableViewHeaderFooterView else { return }
    header.textLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
    header.textLabel?.frame = CGRect(x: header.bounds.origin.x + 20, y: header.bounds.origin.y, width: 100, height: header.bounds.height)
    header.textLabel?.textColor = .white
    header.textLabel?.text = header.textLabel?.text?.lowercased()
  }
  
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return sectionTitles[section]
  }
  
  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    let defaultOffset = view.safeAreaInsets.top
    let offset = scrollView.contentOffset.y + defaultOffset
    
    navigationController?.navigationBar.transform = .init(translationX: 0, y: min(0, -offset))
  }
}

