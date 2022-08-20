import UIKit

final class SeasonViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var api: F1API = .init()
    
    var races: [Race] = []
    
    lazy var seasonView: SeasonView = .init(delegate: self, dataSource: self)
    
    override func loadView() {
        view = seasonView
        self.title = "Season"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return races.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: SeasonCell = tableView.dequeueReusableCell(withIdentifier: "seasonCell", for: indexPath) as? SeasonCell else {
            return UITableViewCell()
        }
        cell.accessoryType = .disclosureIndicator
        let race: Race = races[indexPath.row]
        cell.setupDashboardCell(title: race.raceName, image: race.circuit.imageURL, date: race.date, round: "ROUND \(race.round)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCircuit: Race = races[indexPath.row]
        let circuitInformations: CircuitInformationsViewController = .init(selectedCircuit)
        self.navigationController?.pushViewController(circuitInformations, animated: true)
    }
    
    init(api: F1API = F1API()) {
        self.api = api
        super.init(nibName: nil, bundle: nil)
        self.title = "Season"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        api.getRaces { season in
            DispatchQueue.main.async {
                self.races = season?.mrData.raceTable.races ?? []
                self.seasonView.seasonTableView.reloadData()
            }
        }
    }
}
