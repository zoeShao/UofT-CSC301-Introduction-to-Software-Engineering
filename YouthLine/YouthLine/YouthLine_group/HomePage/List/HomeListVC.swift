//
//  HomeListVC.swift
//  YouthLine
//
//  Created by 林诗琪 on 2019-03-10.
//  Copyright © 2019 RainbowWarrior. All rights reserved.
//
// new
import UIKit
import Alamofire
import HandyJSON
import MJRefresh
import SwiftyJSON
import MessageUI

class HomeListVC: BaseViewController,UITableViewDelegate, UITableViewDataSource,UICollectionViewDelegate, UICollectionViewDataSource {
    let NewsFeedBaseTableViewCellID = "NewsFeedBaseTableViewCell"
    let NewsFeedImageTableViewCellID = "NewsFeedImageTableViewCell"
    let HomeEventCollectionViewCellID = "HomeEventCollectionViewCell"
//    var fetchingMore = false
    var currentNewsIndex = 0
    // fixed size = 8
    var AllNewsFeedModelList: [NewsFeedModel]? = []
    // fixed size = 2
    var CurrentNewsFeedModelList: [NewsFeedModel]? = []
    // never changed
    var YouthlineIntroModelList: [YouthlineIntroModel]? = [event1, event2, event3]
    
    //    var pageIndex: Int = 0
    
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: view.frame.width, height: 160)
        
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: 160), collectionViewLayout: layout)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(HomeEventCollectionViewCell.self, forCellWithReuseIdentifier: HomeEventCollectionViewCellID)
        collectionView.backgroundColor = UIColor.gray
        return collectionView
    }()
    
    func contactView() -> UIView {
        let contactView = UIView.init()
        contactView.frame = CGRect(x: 0, y: 160, width: ScreenWidth, height: 60)
        contactView.backgroundColor = UIColor.white
        contactView.addSubview(contactLabel)
        contactView.addSubview(callButton)
        contactView.addSubview(messageButton())
        return contactView
    }
    
    func buttonView() -> UIView {
        let buttonView = UIView.init()
        buttonView.frame = CGRect(x: 0, y: 220, width: ScreenWidth, height: 80)
        buttonView.backgroundColor = UIColor.white
        buttonView.addSubview(buttonLabel)
        buttonView.addSubview(insButton)
        buttonView.addSubview(twitterButton)
        buttonView.addSubview(fbButton)
        buttonView.addSubview(youtbButton)
        buttonView.addSubview(tumblrButton)
        return buttonView
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 50, width: ScreenWidth, height: view.frame.height - NavigationBarHeight), style: UITableViewStyle.grouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsFeedBaseTableViewCell.self, forCellReuseIdentifier: NewsFeedBaseTableViewCellID)
        tableView.register(NewsFeedImageTableViewCell.self, forCellReuseIdentifier: NewsFeedImageTableViewCellID)
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.isScrollEnabled = false
        tableView.bounces = true
        tableView.rowHeight = 177.5
        
        return tableView
    }()
    
    func tableUIView() -> UIView {
        let tableUIView = UIView.init()
        tableUIView.frame = CGRect(x: 0, y: 300, width: ScreenWidth, height: view.frame.height)
        tableUIView.backgroundColor = UIColor.white
        tableUIView.addSubview(newsLabel)
        tableUIView.addSubview(changeNewsButton())
        tableUIView.addSubview(tableView)
        return tableUIView
    }
    
    func changeNewsButton() -> UIButton{
        let title = "Next"
        let iconName = "refresh"
        let button = UIButton.init(type: UIButtonType.custom) as UIButton
        button.setTitle(title, for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 10)
        button.setImage(UIImage(named: iconName), for: .normal)
        button.addTarget(self, action: #selector(nextNews(sender:)), for: .touchUpInside)
        let imageWidth = button.imageView!.frame.width
        let textWidth = (title as NSString).size(withAttributes:[NSAttributedStringKey.font:button.titleLabel!.font!]).width
        let width = textWidth + imageWidth + 24
        button.frame = CGRect(x: ScreenWidth - 60, y: 30, width: width, height: 20)
        button.layoutIfNeeded()
        return button
    }
    
    lazy var newsLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 10, y: 30, width: ScreenWidth, height: 20)
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.bold)
        label.numberOfLines = 1
        label.textColor = UIColor.darkGray
        label.text = "Check out our news below!"
        return label
    }()
    
    lazy var buttonLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: 20)
        label.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.bold)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "Check out our socialmedias!"
        return label
    }()
    
    lazy var insButton: UIButton = {
        let insButton = UIButton.init(type: UIButtonType.custom) as UIButton
        insButton.frame = CGRect(x: 20, y: 20, width: 60, height: 60)
        insButton.setImage(UIImage(named: "Instagram"), for: UIControlState.normal)
        insButton.addTarget(self, action: #selector(openInstagram(sender:)), for: .touchUpInside)
        return insButton
    }()
    
    lazy var twitterButton: UIButton = {
        let twitterButton = UIButton.init(type: UIButtonType.custom) as UIButton
        twitterButton.frame = CGRect(x: 100, y: 20, width: 60, height: 60)
        twitterButton.setImage(UIImage(named: "Twitter"), for: UIControlState.normal)
        twitterButton.addTarget(self, action: #selector(openTwitter(sender:)), for: .touchUpInside)
        return twitterButton
    }()
    
    lazy var fbButton: UIButton = {
        let fbButton = UIButton.init(type: UIButtonType.custom) as UIButton
        fbButton.frame = CGRect(x: 180, y: 20, width: 60, height: 60)
        fbButton.setImage(UIImage(named: "Facebook"), for: UIControlState.normal)
        fbButton.addTarget(self, action: #selector(openFacebook(sender:)), for: .touchUpInside)
        return fbButton
    }()
    
    lazy var youtbButton: UIButton = {
        let youtbButton = UIButton.init(type: UIButtonType.custom) as UIButton
        youtbButton.frame = CGRect(x: 260, y: 20, width: 60, height: 60)
        youtbButton.setImage(UIImage(named: "Youtube"), for: UIControlState.normal)
        youtbButton.addTarget(self, action: #selector(openYoutube(sender:)), for: .touchUpInside)
        return youtbButton
    }()
    
    lazy var tumblrButton: UIButton = {
        let tumblrButton = UIButton.init(type: UIButtonType.custom) as UIButton
        tumblrButton.frame = CGRect(x: 340, y: 20, width: 60, height: 60)
        tumblrButton.setImage(UIImage(named: "Tumblr"), for: UIControlState.normal)
        tumblrButton.addTarget(self, action: #selector(openTumblr(sender:)), for: .touchUpInside)
        return tumblrButton
    }()
    
    lazy var callButton: UIButton = {
        let title = "1-800-268-9688"
        let iconName = "call"
        let button = UIButton.init(type: UIButtonType.custom) as UIButton
        button.backgroundColor = UIColor(red: 0.93, green: 0.80, blue: 0.80, alpha: 1)
        button.setTitle(title, for: .normal)
        //        button.setTitle(title, for: .highlighted)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        //        button.setTitleColor(UIColor.white, for: .highlighted)
        button.setImage(UIImage(named: iconName), for: .normal)
        button.addTarget(self, action: #selector(makePhoneCall(sender:)), for: .touchUpInside)
        //        button.setImage(UIImage(named: iconName), for: .highlighted)
        let imageWidth = button.imageView!.frame.width
        let textWidth = (title as NSString).size(withAttributes:[NSAttributedStringKey.font:button.titleLabel!.font!]).width
        let width = textWidth + imageWidth + 40
        //24 - the sum of your insets from left and right
        //        widthConstraints.constant = width
        button.frame = CGRect(x: 60, y: 25, width: width, height: 30)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.layoutIfNeeded()
        return button
    }()
    
    func messageButton() -> UIButton{
        let title = "647-694-4275"
        let iconName = "message"
        let button = UIButton.init(type: UIButtonType.custom) as UIButton
        button.backgroundColor = UIColor(red: 0.93, green: 0.80, blue: 0.80, alpha: 1)
        button.setTitle(title, for: .normal)
        //        button.setTitle(title, for: .highlighted)
        button.setTitleColor(UIColor.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 12)
        //        button.setTitleColor(UIColor.white, for: .highlighted)
        button.setImage(UIImage(named: iconName), for: .normal)
        button.addTarget(self, action: #selector(sendMessage(sender:)), for: .touchUpInside)
        //        button.setImage(UIImage(named: iconName), for: .highlighted)
        let imageWidth = button.imageView!.frame.width
        let textWidth = (title as NSString).size(withAttributes:[NSAttributedStringKey.font:button.titleLabel!.font!]).width
        let width = textWidth + imageWidth + 40
        button.frame = CGRect(x: 240, y: 25, width: width, height: 30)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.layoutIfNeeded()
        return button
    }
    lazy var contactLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: 20)
        label.font = UIFont.systemFont(ofSize: 10, weight: UIFont.Weight.bold)
        label.numberOfLines = 1
        label.textAlignment = .center
        label.text = "Feel free to contact us!"
        return label
    }()
    
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: view.frame)
        scrollView.contentSize = CGSize(width: scrollView.frame.width, height: 1.0)
        
        //        scrollView.contentSize.height = 1.0 // disable vertical scroll
        scrollView.delegate = self
        scrollView.backgroundColor = UIColor.lightGray
        scrollView.addSubview(collectionView)
        scrollView.addSubview(contactView())
        scrollView.addSubview(buttonView())
        //        scrollView.addSubview(tableView)
        scrollView.addSubview(tableUIView())
        
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        updateData()
        fetchData()
        print(AllNewsFeedModelList!.count)
        view.backgroundColor = UIColor.lightGray
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(2)
        }
        self.scrollView.bounces = false
        self.scrollView.isScrollEnabled = true
       
    }
    func fetchData(){
        Alamofire.request("http://youthline-test-server.herokuapp.com/home").responseJSON { (responseObject) -> Void in
            
            //            print(responseObject)
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.result.value!)
                print("fetchsuccess")
                if let mappedObject = JSONDeserializer<NewsFeedModel>.deserializeModelArrayFrom(json: resJson.description){
                    print("heyy")
                    for model in mappedObject as! [NewsFeedModel] {
                        // if model.common_card != nil || model.fields != nil
                        self.AllNewsFeedModelList!.append(model)
                        print("neic")
                    }
                    print(self.AllNewsFeedModelList!.count)
                    if self.AllNewsFeedModelList!.count >= 2 {
                        self.CurrentNewsFeedModelList?.append(self.AllNewsFeedModelList![0])
                        self.CurrentNewsFeedModelList?.append(self.AllNewsFeedModelList![1])
                        print("buling")
                    } else if self.AllNewsFeedModelList!.count == 1{
                        self.CurrentNewsFeedModelList?.append(self.AllNewsFeedModelList![0])
                    }
                    self.tableView.reloadData()
                }
                
            }
            if responseObject.result.isFailure {
                let error : NSError = responseObject.result.error! as NSError
                print("news fetch failed")
            }
        }
    }
}





