let map, heatmap;

function initMap() {
  // Initialize the map
  map = new google.maps.Map(document.getElementById("map"), {
    zoom: 13,
    center: { lat: 18.5204, lng: 73.8567 }, // Pune city center
    mapTypeId: "roadmap",
  });

  // Sample heatmap points (you can replace with Firebase data later)
  const heatmapData = [
    new google.maps.LatLng(18.5204, 73.8567),
    new google.maps.LatLng(18.5214, 73.8570),
    new google.maps.LatLng(18.5194, 73.8550),
    new google.maps.LatLng(18.5224, 73.8580),
    new google.maps.LatLng(18.5184, 73.8540),
    new google.maps.LatLng(18.5234, 73.8590),
  ];

  // Create heatmap layer
  heatmap = new google.maps.visualization.HeatmapLayer({
    data: heatmapData,
    map: map,
    radius: 30, // Adjust radius for visibility
  });
}
