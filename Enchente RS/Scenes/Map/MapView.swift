//
//  MapView.swift
//  Mapa Solidário
//
//  Created by Brenno de Moura on 07/05/24.
//

import SwiftUI
import GoogleMaps

struct MapView: View {

    var body: some View {
        ZStack {
            _GoogleMapsViewWrapper(
                position: GMSCameraPosition.camera(
                    withLatitude:  -30.0277,
                    longitude: -51.2287 ,
                    zoom: 16.0
                ),
                onTap: { marker in
                    return false
                }
            )
            .ignoresSafeArea(edges: .top)
        }
    }
}

private struct _GoogleMapsViewWrapper: UIViewRepresentable {

    let position: GMSCameraPosition
    let markers: [GMSMarker]
    let tapHandler: (GMSMarker) -> Bool

    init(position: GMSCameraPosition, markers: [GMSMarker] = [], onTap tapHandler: @escaping (GMSMarker) -> Bool) {
        self.position = position
        self.markers = markers
        self.tapHandler = tapHandler
    }

    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    func makeUIView(context: Context) -> GMSMapView {
        context.coordinator.tapHandler = tapHandler
        let options = GMSMapViewOptions()
        options.camera = position
        let mapView = GMSMapView(options: options)
        mapView.delegate = context.coordinator
        return mapView
    }

    func updateUIView(_ uiView: GMSMapView, context: Context) {
        context.coordinator.tapHandler = tapHandler
        for marker in markers {
            marker.map = uiView
        }
    }

    class Coordinator: NSObject, GMSMapViewDelegate {
        var tapHandler: ((GMSMarker) -> Bool)?

        func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
            tapHandler?(marker) ?? false
        }
    }
}
