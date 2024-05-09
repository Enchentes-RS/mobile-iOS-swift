//
//  MapView.swift
//  Mapa Solidário
//
//  Created by Brenno de Moura on 07/05/24.
//

import SwiftUI
import GoogleMaps

struct MapView: View {

    @StateObject var viewModel = MapViewModel(service: .init())
    @State var isShowingError = false
    @State var itemSelected: Shelter?
    @State var isDetailsVisible = false

    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                _GoogleMapsViewWrapper(
                    position: GMSCameraPosition.camera(
                        withLatitude:  -23.5505199,
                        longitude: -46.6333094,
                        zoom: 16.0
                    ),
                    markers: viewModel.items.map(\.marker),
                    onTap: { marker in
                        itemSelected = marker.userData as? Shelter
                        return false
                    }
                )
                .ignoresSafeArea(edges: .top)

                if viewModel.isItemsLoading {
                    // TODO: - Loading
                    Rectangle()
                        .fill(.clear)
                        .overlay(Text("Carregando"))
                }

                if itemSelected != nil {
                    // TODO: - Lista de markers
                }

                if let itemSelected {
                    NavigationLink(
                        destination: ShelterDetailsView(shelter: itemSelected),
                        isActive: $isDetailsVisible,
                        label: {
                            EmptyView()
                        }
                    )
                    .hidden()
                }

                if itemSelected != nil {
                    MSCardView(itemSelected: itemSelected!, close: { itemSelected = nil })
                        .onTapGesture {
                            isDetailsVisible.toggle()
                        }
                        .padding(.all, 16)
                }
            }
            .onAppear {
                if viewModel.items.isEmpty || viewModel.error != nil {
                    viewModel.loadItemsSubject.send(())
                }
            }
            .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
            .alert(
                isPresented: $isShowingError,
                content: {
                    Alert(
                        title: Text("Ocorreu um erro"),
                        message: Text("Ocorreu um erro durante o carregamento das informações"),
                        dismissButton: .cancel()
                    )
                }
            )
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

        func mapView(_ mapView: GMSMapView, markerInfoWindow marker: GMSMarker) -> UIView? {
            UIView()
        }
    }
}
