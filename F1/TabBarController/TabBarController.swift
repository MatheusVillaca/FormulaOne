import UIKit

final class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    //MARK: - Dependencies
    
    let seasonController = SeasonViewController()
    let teamsController = TeamsViewController()
    let classificationController = ClassificationViewController()
    
    //MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.modalPresentationStyle = .overFullScreen
        self.tabBarController?.tabBar.tintColor = .red
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureSeason()
        configureTeams()
        configureClassification()
        self.viewControllers =
        [seasonController,
         teamsController,
         classificationController]
        
    }
    
    //MARK: - Constructors
    
    private func configureSeason() {
        let seasonNavigationController: CustomNavigationController =
            .init(rootViewController: classificationController)
        let teamsBarItem = UITabBarItem(
            title: "Season",
            image: UIImage(named: "calendar"),
            selectedImage: UIImage(named: "calendar"))
        seasonController.tabBarItem = teamsBarItem
        seasonNavigationController.navigationItem.backBarButtonItem =
        UIBarButtonItem(title: "Season", style: .plain, target: nil, action: nil)
    }
    
    private func configureTeams() {
        let teamsNavigationController: CustomNavigationController =
            .init(rootViewController: classificationController)
        let teamsBarItem = UITabBarItem(
            title: "Teams",
            image: UIImage(named: "teams"),
            selectedImage: UIImage(named: "teams"))
        teamsController.tabBarItem = teamsBarItem
        teamsNavigationController.navigationItem.backBarButtonItem =
        UIBarButtonItem(title: "Teams", style: .plain, target: nil, action: nil)
    }
    
    private func configureClassification() {
        let classificationNavigationController: CustomNavigationController =
            .init(rootViewController: classificationController)
        let classificationBarItem = UITabBarItem(
            title: "Standings",
            image: UIImage(named: "standings"),
            selectedImage: UIImage(named: "standings"))
        classificationController.tabBarItem = classificationBarItem
        classificationNavigationController.navigationItem.backBarButtonItem =
        UIBarButtonItem(title: "Standings", style: .plain, target: nil, action: nil)
    }
}
