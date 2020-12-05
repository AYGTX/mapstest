import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong/latlong.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PopupController _popupController = PopupController();

  List<Marker> markers;
//  int pointIndex;


  @override
  void initState() {
   // pointIndex = 0;
    markers = [
      Marker(
        description: 'test',
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 30,
        width: 30,
        //point: points[pointIndex],
        builder: (ctx) => Icon(Icons.location_on),
      ),
      Marker(
        description: 'test',

        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 30,
        width: 30,
        point: LatLng(35.8131185264763, 10.638436846039392),
        builder: (ctx) => Icon(Icons.location_on),
      ),
      Marker(
        description: 'test',

        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 30,
        width: 30,
        point: LatLng(35.82077445074772, 10.636376909409105),
        builder: (ctx) => Icon(Icons.location_on),
      ),
      Marker(
   
        description: 'test',
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 30,
        width: 30,
        point: LatLng(35.814023355995275, 10.626163056950594),
        builder: (ctx) => Icon(Icons.location_on),
      ),
      Marker(
        description: 'test',
   
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 30,
        width: 30,
        point: LatLng(35.824551648468194, 10.629590897079588),
        builder: (ctx) => Icon(Icons.location_on),
      ),
      Marker(
        description: 'test',
   
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 30,
        width: 30,
        point: LatLng(35.821555187480165, 10.628532833513086),
        builder: (ctx) => Icon(Icons.location_on),
      ),
      Marker(
        description: 'test',
   
        anchorPos: AnchorPos.align(AnchorAlign.center),
        height: 30,
        width: 30,
        point: LatLng(36.8435111968276, 10.196287830692928),
        builder: (ctx) => Icon(Icons.location_on),
      ),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: () {
          pointIndex++;
          /*if (pointIndex >= points.length) {
            pointIndex = 0;
          }*/
          setState(() {
            markers[0] = Marker(
            //  point: points[pointIndex],
              anchorPos: AnchorPos.align(AnchorAlign.center),
              height: 25,
              width: 25,
              builder: (ctx) => Icon(Icons.location_on),
            );
            markers = List.from(markers);
          });
        },
      ),*/
      body: FlutterMap(
        options: MapOptions(
          bounds: LatLngBounds(LatLng(36.2, 10), LatLng(35.3, 11.1)),
          boundsOptions: FitBoundsOptions(padding: EdgeInsets.all(8.0)),
          plugins: [
            MarkerClusterPlugin(),
          ],
          onTap: (_) => _popupController
              .hidePopup(), // Hide popup when the map is tapped.
        ),
        layers: [
          TileLayerOptions(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerClusterLayerOptions(
            maxClusterRadius: 100,
            disableClusteringAtZoom: 10,
            size: Size(40, 40),
            anchor: AnchorPos.align(AnchorAlign.center),
            fitBoundsOptions: FitBoundsOptions(
              padding: EdgeInsets.all(50),
            ),
            markers: markers,
            polygonOptions: PolygonOptions(
                borderColor: Colors.blueAccent,
                color: Colors.blue,
                borderStrokeWidth: 3),
            popupOptions: PopupOptions(
                popupSnap: PopupSnap.top,
                popupController: _popupController,
                popupBuilder: (_, marker) => Container(
                      width: 200,
                      height: 100,
                      color: Colors.white,
                      child: GestureDetector(
                        
                        child: Text(
                          " ${marker.description} ",
                        ),
                      ),
                    )),
            builder: (context, markers) {
              return FloatingActionButton(
                child: Text(markers.length.toString()),
                onPressed: null,
              );
            },
          ),
        ],
      ),
    );
  }
}
