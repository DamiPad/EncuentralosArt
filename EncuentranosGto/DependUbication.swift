//
//  DependUbication.swift
//  EncuentranosGto
//
//  Created by Laura Yaremith Damian  Padilla on 24/04/20.
//  Copyright © 2020 Laura Yaremith Damian  Padilla. All rights reserved.
//

import SwiftUI
import MapKit

struct DependUbication: View {
  @State var manager = CLLocationManager()
   @State var alert = false
    var body: some View {
        MapView(manager: $manager, alert: $alert).alert(isPresented: $alert) {
            Alert(title: Text("habilita el acceso a la ubicacion de la aplicación !!!"))
        }
    }
}

struct DependUbication_Previews: PreviewProvider {
    static var previews: some View {
        DependUbication()
    }
}

struct MapView : UIViewRepresentable {
    //@Environment(\.managedObjectContext) var managedObjectContext
    //@FetchRequest(entity: Ubicacion.entity, sortDescriptors:[])
    //var ubicacion: FetchedResults<Ubicacion>
    
    @Binding var manager : CLLocationManager
    @Binding var alert : Bool
    
    //var latitud = ubicacion.latitud
    //var longitud = ubicacion.longitud
    
    var latitud = 20.6627314
    var longitud = -101.3568807
    
    let map = MKMapView()
    
    func makeCoordinator() -> MapView.Coordinator {
        return MapView.Coordinator(parent1: self)
    }
    
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        manager.requestWhenInUseAuthorization()
        //obtiene tu ubicacion actual manager.location?.coordinate
        let center = CLLocationCoordinate2D(latitude: /*manager.location?.coordinate.latitude ??*/ 20.6672844, longitude: /*manager.location?.coordinate.longitude ?? */-101.3619728)
        
        let destinationCoordinater = CLLocationCoordinate2D(latitude:latitud,longitude:longitud)
        
        let region = MKCoordinateRegion(center: center, latitudinalMeters: 5000, longitudinalMeters: 5000)
        
        let sourcePin = MKPointAnnotation()
        sourcePin.coordinate = center
        sourcePin.title = "Origen"
        map.addAnnotation(sourcePin)
        
        let destinationPin = MKPointAnnotation()
        sourcePin.coordinate = destinationCoordinater
        sourcePin.title = "Destino"
        map.addAnnotation(destinationPin)
        
        map.region = region
        let req = MKDirections.Request()
        req.source = MKMapItem(placemark: MKPlacemark(coordinate:center))
        req.destination = MKMapItem(placemark: MKPlacemark(coordinate:destinationCoordinater))
        
        let directions = MKDirections(request: req)
        directions.calculate{ (direct, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
             let polyline =  direct?.routes.first?.polyline
             self.map.addOverlay(polyline!)
             self.map.setRegion(MKCoordinateRegion(polyline!.boundingMapRect),animated: true)
            
        }
        
        manager.delegate = context.coordinator
        manager.startUpdatingLocation()
        
        
        return map
    }
    func updateUIView(_ uiView: MKMapView, context: UIViewRepresentableContext<MapView>) {
    }
    
    class Coordinator : NSObject,CLLocationManagerDelegate, MKMapViewDelegate{
        var parent : MapView
        init(parent1 : MapView) {
            parent = parent1
        }
        
        func MapView(_mapView: MKMapView, rendererFor overlay: MKOverlay)->MKOverlayRenderer{
            let render = MKPolylineRenderer(overlay: overlay)
            render.strokeColor = .orange
            render.lineWidth = 2
            return render
        }
        
        func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
            if status == .denied{
                parent.alert.toggle()
            }
        }
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            let location = locations.last
            let point = MKPointAnnotation()
            
            let georeader = CLGeocoder()
            georeader.reverseGeocodeLocation(location!) { (places, err) in
                if err != nil{
                    print((err?.localizedDescription)!)
                    return
                }
                let place = places?.first?.locality
                point.title = place
                point.subtitle = "Current"
                point.coordinate = location!.coordinate
                self.parent.map.removeAnnotations(self.parent.map.annotations)
                self.parent.map.addAnnotation(point)
                let region = MKCoordinateRegion(center: location!.coordinate, latitudinalMeters: 5000, longitudinalMeters: 5000)
                self.parent.map.region = region
            }
        }
    }
}
