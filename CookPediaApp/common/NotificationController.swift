//
//  NotificationController.swift
//  CookPediaApp
//
//  Created by Aruuke Turgunbaeva on 30/1/24.
//

import UIKit
import SnapKit

class NotificationController: UIViewController, UITableViewDataSource{
    
    private let notificationsTableView = UITableView()
    
    private let notificationList: [NotificationList] = [
        NotificationList(userImg: "user1", mainTitle: "Jane Cooper has published a new recipe!", dateAndTime: "Today | 09:24 AM", postImg: "toast"),
        NotificationList(userImg: "user2", mainTitle: "Rochel has commented on your recipe", dateAndTime: "1 day ago | 14:43 PM", postImg: "pizza"),
        NotificationList(userImg: "user3", mainTitle: "Brad Wigington liked your comment", dateAndTime: "1 day ago | 09:29 AM", postImg: "salad"),
        NotificationList(userImg: "user4", mainTitle: "Tyra Ballentine has published a new recipe!", dateAndTime: "2 days ago | 10:29 AM", postImg: "soup"),
        NotificationList(userImg: "user5", mainTitle: "Marci Winkles has published a new recipe!", dateAndTime: "3 days ago | 16:52 PM", postImg: "salad2"),
        NotificationList(userImg: "user6", mainTitle: "Aileen has commented on your recipe", dateAndTime: "4 days ago | 14:27 PM", postImg: "lagman"),
        NotificationList(userImg: "user7", mainTitle: "George has commented on your recipe", dateAndTime: "5 days ago | 09:20 AM", postImg: "burger")]

    override func viewDidLoad() {
        view.backgroundColor = .white
        self.navigationItem.title = "Notifications"
        setupUI()
    }
    
    private func setupUI(){
        setupNotificationsTableView()
    }
    
    private func setupNotificationsTableView(){
        notificationsTableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "cell")
        notificationsTableView.dataSource = self
        view.addSubview(notificationsTableView)
        notificationsTableView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
            make.horizontalEdges.equalToSuperview().inset(15)
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-20)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notificationList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        cell.setData(notificationList[indexPath.row].userImg, mainTitle: notificationList[indexPath.row].mainTitle, dateAndTime: notificationList[indexPath.row].dateAndTime, postImgName: notificationList[indexPath.row].postImg)
        cell.separatorInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: UIScreen.main.bounds.width)
        return cell
    }
}
