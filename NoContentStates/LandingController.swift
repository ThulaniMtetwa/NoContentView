//
//  LandingController.swift
//  NoContentStates
//
//  Created by Thulani Mtetwa on 2023/10/31.
//

import UIKit

class LandingController: UIViewController {

    private lazy var customView: ErrorContentView = {
        let view = ErrorContentView(title: "Sample", description: "notth", iconImage: UIImage(systemName: "pen")){
            self.customView.removeFromSuperview()
        }
            return view
        }()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .blue
        // Do any additional setup after loading the view.
        
        customView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addSubview(customView)
        
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
