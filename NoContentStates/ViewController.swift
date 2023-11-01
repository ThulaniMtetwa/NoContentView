//
//  ViewController.swift
//  NoContentStates
//
//  Created by Thulani Mtetwa on 2023/10/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private var names = [String]()
    private lazy var customView: ErrorContentView = {
        let view = ErrorContentView(title: "Sample", description: "notth", iconImage: UIImage(systemName: "pen")){
            self.customView.removeFromSuperview()
        }
            return view
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.fetchContacts()
        
        customView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(customView)
        self.view.bringSubviewToFront(customView)
        
        customView.makeConstraints(top: self.view.topAnchor,
                                   left: self.view.leftAnchor,
                                   right: self.view.rightAnchor,
                                   bottom: self.view.bottomAnchor,
                                   topMargin: 0,
                                   leftMargin: 0,
                                   rightMargin: 0,
                                   bottomMargin: 0,
                                   width: 0,
                                   height: 0)
    }
    
    private func fetchContacts() {
//        self.names = ["Bill Gates", "Steve Jobs", "Elon Musk", "Alan Turing", "Jeff Bezos", "Larry Page", "Mark Zuckerberg", "Larry Ellison", "Steve Wozniak"]
        
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if names.count == 0 {
            tableView.setEmptyView(title: "You don't have any contact.", message: "Your contacts will be in here.", messageImage: UIImage(systemName: "externaldrive.fill.badge.exclamationmark"))
        }
        else {
            tableView.restore()
        }
        return names.count
    }
}

extension UITableView {
    
    func setEmptyView(title: String, message: String, messageImage: UIImage?) {
        
        let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
        
        let messageImageView = UIImageView()
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        
        messageImageView.backgroundColor = .clear
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageImageView.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textColor = UIColor.black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        
        messageLabel.textColor = UIColor.lightGray
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageImageView)
        emptyView.addSubview(messageLabel)
        
        messageImageView.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        messageImageView.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: -20).isActive = true
        messageImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        messageImageView.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        titleLabel.topAnchor.constraint(equalTo: messageImageView.bottomAnchor, constant: 10).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        
        
        if let img = messageImage {
            messageImageView.image = img
        }
        titleLabel.text = title
        messageLabel.text = message
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        
        UIView.animate(withDuration: 1, animations: {
            
            messageImageView.transform = CGAffineTransform(rotationAngle: .pi / 10)
        }, completion: { (finish) in
            UIView.animate(withDuration: 1, animations: {
                messageImageView.transform = CGAffineTransform(rotationAngle: -1 * (.pi / 10))
            }, completion: { (finishh) in
                UIView.animate(withDuration: 1, animations: {
                    messageImageView.transform = CGAffineTransform.identity
                })
            })
            
        })
        
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    
    func restore() {
        
        self.backgroundView = nil
        self.separatorStyle = .singleLine
        
    }
    
}
