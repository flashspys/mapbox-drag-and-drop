/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Demonstrates how to enable drag and drop for a UITableView instance.
*/

import UIKit
import MapboxMaps

class TableViewController: UITableViewController {
    // MARK: - Properties
    
    var model = Model()
    
    // MARK: - View Life Cycle
    
    // Specify the table as its own drag source and drop delegate.
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dragInteractionEnabled = true
        tableView.dragDelegate = self
        tableView.dropDelegate = self

        navigationItem.rightBarButtonItem = editButtonItem
        
        
        // Create a map view.
        let myResourceOptions = ResourceOptions(accessToken: "XXX")
        let myMapInitOptions = MapInitOptions(resourceOptions: myResourceOptions)
        let mapView = MapView(frame: view.bounds, mapInitOptions: myMapInitOptions)

        // Center the map camera over Stockholm.
        mapView.mapboxMap.setCamera(
            to: CameraOptions(
                center: CLLocationCoordinate2D(
                    latitude: 59.31,
                    longitude: 18.06
                ),
                zoom: 9.0
            )
        )
        
        self.tableView.tableHeaderView = mapView
        mapView.frame.size.height = 400
        self.tableView.tableHeaderView?.heightAnchor.constraint(equalToConstant: 400).isActive = true
        
    }
}
