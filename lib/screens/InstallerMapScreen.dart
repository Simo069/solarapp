import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:solarapp/Models/InstallerProfile.dart';

class InstallerMapScreen extends StatefulWidget {
  InstallerMapScreen({super.key});
  @override
  State<InstallerMapScreen> createState() => _InstallerMapScreenState();
}

class _InstallerMapScreenState extends State<InstallerMapScreen> {
  late GoogleMapController _mapController;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  // Initial camera position centered on San Francisco
  // final CameraPosition _initialCameraPosition = const CameraPosition(
  //   target: LatLng(37.7749, -122.4194),
  //   zoom: 12.0,
  // );
  final CameraPosition _initialCameraPosition = const CameraPosition(
    target: LatLng(33.5731, -7.5898), // Casablanca, Morocco
    zoom: 12.0,
  );

  // Selected installer data (shows at bottom when a marker is tapped)
  InstallerProfile? _selectedInstaller;

  @override
  void initState() {
    super.initState();
    _loadInstallers();
  }

  void _loadInstallers() {
    // Sample installer data - in a real app this would come from your API/database

    final List<InstallerProfile> installers = [
      InstallerProfile(
        id: '1',
        name: 'mohammed boukhatem',
        rating: 4.5,
        certification: 'RGE certified',
        company: 'SolarTech Solutions',
        experience: '10 years in solar panel installation',
        serviceArea: 'Casablanca',
        contact: 'mohammed.boukhatem@solartech.fr | +212 604 470 620',
        description:
            'mohammed boukhatem is a certified installer specializing in photovoltaic and thermal solar panels.',
        imageUrl: 'assets/images/installer1.jpg',
        price: 199,
        position: const LatLng(33.5899, -7.6039), // Example: Maarif area
      ),
      InstallerProfile(
        id: '2',
        name: 'bity hiba',
        rating: 4.8,
        certification: 'NABCEP certified',
        company: 'EcoSolar',
        experience: '8 years in renewable energy',
        serviceArea: 'Ain Diab',
        contact: 'bity.hibah@ecosolar.com |  +212 604 470 620',
        description:
            'Sarah specializes in residential solar panel installations with expertise in energy efficiency.',
        imageUrl: 'assets/images/installer2.jpg',
        price: 210,
        position: const LatLng(33.5820, -7.6920), // Ain Diab area
      ),
      InstallerProfile(
        id: '3',
        name: 'malak zahid',
        rating: 4.3,
        certification: 'IREC certified',
        company: 'SunPower Pro',
        experience: '12 years in commercial solar',
        serviceArea: 'Anfa',
        contact: 'malak.zahid@sunpowerpro.com | +212 5 00 00 00 00',
        description:
            'malak zahid has installed solar solutions for businesses throughout the region.',
        imageUrl: 'assets/images/installer3.jpg',
        price: 220,
        position: const LatLng(33.5801, -7.6450), // Anfa
      ),
      InstallerProfile(
        id: '4',
        name: 'omar badal',
        rating: 4.6,
        certification: 'SEIA member',
        company: 'Green Energy Solutions',
        experience: '7 years in residential solar',
        serviceArea: 'Sidi Maarouf',
        contact: 'omar badal@greenenergy.com | +212 5 22 00 00 00',
        description:
            'omar badal provides custom solar solutions focusing on aesthetics and efficiency.',
        imageUrl: 'assets/images/installer4.jpg',
        price: 215,
        position: const LatLng(33.5386, -7.6190), // Sidi Maarouf
      ),
    ];

    // Create markers for each installer
    for (final installer in installers) {
      final markerId = MarkerId(installer.id);

      // Create a price marker for the map
      _createPriceMarkerWidget(installer.price).then((markerIcon) {
        final marker = Marker(
          markerId: markerId,
          position: installer.position,
          icon: markerIcon,
          onTap: () {
            setState(() {
              _selectedInstaller = installer;
            });
          },
        );

        setState(() {
          markers[markerId] = marker;
        });
      });
    }
  }

  // Create a price marker as a custom bitmap
  Future<BitmapDescriptor> _createPriceMarkerWidget(int price) async {
    // This is a placeholder - in a real app you would create
    // custom price markers with actual price text using a CustomPainter
    // For now, we'll use the default marker
    return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_sharp),
        ),
        title: Text(
          "Map to find Installers",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          // Google Map taking the full screen
          GoogleMap(
            initialCameraPosition: _initialCameraPosition,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            markers: Set<Marker>.of(markers.values),
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
          ),

          // Status bar area - showing battery, wifi, etc.
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              height: MediaQuery.of(context).padding.top,
              color: Colors.transparent,
            ),
          ),

          // Bottom card with installer info (shows when marker is tapped)
          if (_selectedInstaller != null)
            Positioned(
              bottom: 80,
              left: 20,
              right: 20,
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    // Installer image
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                      ),
                      child: Image.asset(
                        _selectedInstaller!.imageUrl,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey.shade300,
                            child: const Icon(
                              Icons.person,
                              size: 50,
                              color: Colors.grey,
                            ),
                          );
                        },
                      ),
                    ),

                    // Installer details
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _selectedInstaller!.name,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '\$${_selectedInstaller!.price}',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Bottom navigation bar
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -5),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildNavItem(Icons.home, isSelected: false),
                  _buildNavItem(Icons.bar_chart, isSelected: false),
                  _buildNavItem(
                    Icons.confirmation_number_outlined,
                    isSelected: true,
                  ),
                  _buildNavItem(
                    Icons.notifications_outlined,
                    isSelected: false,
                  ),
                  _buildNavItem(Icons.settings_outlined, isSelected: false),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, {required bool isSelected}) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: isSelected ? Colors.green.shade100 : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        icon,
        color: isSelected ? Colors.green : Colors.grey,
        size: 28,
      ),
    );
  }
}
