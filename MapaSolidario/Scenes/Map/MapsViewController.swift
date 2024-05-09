//
//  ViewController.swift
//  Mapa Solidario
//
//  Created by Rodrigo Henrique Torres Cavalcanti on 05/05/24.
//

import UIKit
import GoogleMaps
//import GooglePlaces

class MapsViewController: UIViewController, GMSMapViewDelegate {
    var options: GMSMapViewOptions!
    var mapView: GMSMapView!
    var cardView: UIView!
    var cardTitleLabel: UILabel!
    var cardSubtitleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupMap()
        setupCard()
        setupMark()
        setupView()
    }

    func setupView() {
        self.view.addSubview(mapView)
    }

    func setupMap() {
        options = GMSMapViewOptions()
        options.camera = GMSCameraPosition.camera(
            withLatitude:  -30.0277, longitude: -51.2287 , zoom: 50.0)
        options.frame = self.view.bounds

        mapView = GMSMapView(options: options)
        mapView.delegate = self
    }

    func setupMark() {
        let marker = GMSMarker()
//        marker.icon = UIImage(resource: <#T##ImageResource#>)
        marker.position = CLLocationCoordinate2D(latitude:  -30.0277, longitude: -51.2287)
        marker.title = "Porto Alegre"
        marker.snippet = "Rio Grande do Sul"
        marker.map = mapView
    }

    func setupCard() {
        let cardHeight: CGFloat = 120
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height

        cardView = UIView(frame: CGRect(x: 0, y: screenHeight, width: screenWidth, height: cardHeight))
        cardView.backgroundColor = .white
        view.addSubview(cardView)

        cardTitleLabel = UILabel(frame: CGRect(x: 20, y: 10, width: screenWidth - 40, height: 30))
        cardTitleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        cardTitleLabel.textColor = .black
        cardView.addSubview(cardTitleLabel)

        cardSubtitleLabel = UILabel(frame: CGRect(x: 20, y: 40, width: screenWidth - 40, height: 60))
        cardSubtitleLabel.numberOfLines = 0
        cardSubtitleLabel.textColor = .black
        cardView.addSubview(cardSubtitleLabel)
    }

    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
        UIView.animate(withDuration: 0.3) {
            self.cardView.frame.origin.y = UIScreen.main.bounds.height - self.cardView.frame.height-100
        }

        cardTitleLabel.text = marker.title
        cardSubtitleLabel.text = marker.snippet
        return true
    }
}
