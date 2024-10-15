'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "94c031f50f978aa8526d2f6dcba6e905",
"assets/AssetManifest.bin.json": "74d217798a8e388bf9719e0f07aa2b5c",
"assets/AssetManifest.json": "865df32cd654df182270456f65662fb9",
"assets/assets/fonts/Inter_Bold.ttf": "7ef6f6d68c7fedc103180f2254985e8c",
"assets/assets/fonts/Inter_Italic.ttf": "ab4004692577ac82604c777fa83da556",
"assets/assets/fonts/Inter_Light.ttf": "dfaec8b8820224135d07f1b409ceb214",
"assets/assets/fonts/Inter_Medium.ttf": "8540f35bf8acd509b9ce356f1111e983",
"assets/assets/fonts/Inter_Regular.ttf": "37dcabff629c3690303739be2e0b3524",
"assets/assets/fonts/Inter_SemiBold.ttf": "e5532d993e2de30fa92422df0a8849dd",
"assets/assets/icons/add.svg": "a2c039926c7112ee88092c03dca5c9a1",
"assets/assets/icons/add_grey.svg": "0e3d10b13cd65b673f89e89301f0e168",
"assets/assets/icons/add_ring.svg": "7f28e8e07f956c04db9c012daac06d07",
"assets/assets/icons/add_ring_grey.svg": "c221c46cd69b69a2b5c8dde12d444b3d",
"assets/assets/icons/appointment.svg": "5ac1d70c2825c40d0ea055ad2c29e081",
"assets/assets/icons/arrow_down.svg": "932848e50e607e418e6ee028e89f1b82",
"assets/assets/icons/arrow_down_blue.svg": "360260bb9ce4c71ea2dc4d8b59cc38d8",
"assets/assets/icons/big_logo.svg": "ba4ba83392134aff289c72a141c45fbc",
"assets/assets/icons/calendar.svg": "cf70c6d2829a12e27a3b19fa8402d71a",
"assets/assets/icons/camera.svg": "b9dae5510f4f469e721e958e1cd0ce8b",
"assets/assets/icons/close.svg": "b174b434e6c812a8c4daa837fede9568",
"assets/assets/icons/close_ring.svg": "1782fa3931ec1fd7e4fcb9595c6a58b5",
"assets/assets/icons/double_tick.svg": "feec5dd416583cc501c580dd90787831",
"assets/assets/icons/edit.svg": "c1d732b05f77e7208f2e794effd63d85",
"assets/assets/icons/facebook.svg": "cad9629e278bed6aa15e0fcf6c9f3579",
"assets/assets/icons/frame.svg": "cc2a55e44b2c180be099a838a60d4137",
"assets/assets/icons/google.svg": "e6010e2ca72615c5da7f9107524db5cc",
"assets/assets/icons/high_tag.svg": "0272610dcf5f263e1fed04246fb538ff",
"assets/assets/icons/history.svg": "f1f40f7b07a2ab84e8ab8cf2220abbb3",
"assets/assets/icons/home.svg": "04e1a725cd56eed67f8ca31a0b4b08c7",
"assets/assets/icons/home_active.svg": "98f84db6d60ab3e0d11bffb560572456",
"assets/assets/icons/important_tag.svg": "8c85f6b7297a17237d4087cc30ae0d3a",
"assets/assets/icons/info.svg": "20e800cc9512ef0ece3a5d71ba658b35",
"assets/assets/icons/location.svg": "7c2beb5b85c15f235358146d6407c6cc",
"assets/assets/icons/lock.svg": "a8710404ee89a1f5f705999209d5c9e2",
"assets/assets/icons/logout.svg": "526a3f3a0c6e4dff0151cc01a2dac146",
"assets/assets/icons/low_tag.svg": "359c0a3ffab1db5562eadb890cab2be6",
"assets/assets/icons/menu_dot.svg": "3e2dc937ad2b7053c68dac71e89699c6",
"assets/assets/icons/mic.svg": "ed0b7966a934eefddef48b08fdc9fcc1",
"assets/assets/icons/notebook.svg": "b5bfad219abb9d9fbf8024a0a8ab44b3",
"assets/assets/icons/notification.svg": "62928b4ffdec752404246adf81330cb9",
"assets/assets/icons/order.svg": "42e878593269cccd4c77f340e631b30a",
"assets/assets/icons/patient_add.svg": "96bd34055d74cab3dd81cfbd18657c52",
"assets/assets/icons/photo_place_holder.svg": "20576757247968afa5a5d22727da68d8",
"assets/assets/icons/pil.svg": "0e5827b68ee1fec09c166fd9af0a2573",
"assets/assets/icons/search.svg": "7ca10d22f3c391b91e884fb837ba899b",
"assets/assets/icons/search_grey.svg": "0ec044a2aaecff64c07dd149b5828504",
"assets/assets/icons/setting.svg": "c738a13a69d8fa0fad9406b8bb5e720d",
"assets/assets/icons/simple_ehr_logo.svg": "2e9982ba69bf5d2cae5a99ae118026b8",
"assets/assets/icons/sms.svg": "4442738339e1ce1600321ff93cca67ef",
"assets/assets/icons/stethoscope.svg": "3336a47e42c947bf27b1276852f0f11a",
"assets/assets/icons/temperature.svg": "b3618a51cb4f144c6351a91113d45b64",
"assets/assets/icons/todo.svg": "c3ba51b736b52007e9df64a28164a878",
"assets/assets/icons/trash.svg": "1886ad0d9561e0f8183826befdb1fadf",
"assets/assets/images/emoji.png": "48f2c453b4937ca6ca664483082a1b0f",
"assets/assets/images/girl.png": "cc4c52b7d46bbbe6ea48a986e2aced91",
"assets/assets/images/line_blue.svg": "19412b2518c8fca66d09f3d0a525e356",
"assets/assets/images/line_red.svg": "ebc0811c16a12743a7f3401a479cfeca",
"assets/assets/images/line_yellow.svg": "621b4e0fe90f3669108a9819956bb103",
"assets/assets/images/place_holder.png": "787b3eb4f5c540f8a3dc4ecef114e0c8",
"assets/assets/images/splash_1.png": "8864ab68907617f93f57a06319bfa1d5",
"assets/assets/images/splash_2.png": "694249c518ec8545c9688ecea96eecdc",
"assets/assets/images/splash_3.png": "c6572d1ede45fa4640c2b8ab4f841c32",
"assets/assets/images/splash_4.png": "19e3583ce017b87dd95e409bf8ff094a",
"assets/assets/images/splash_5.png": "85018c422692652713f6f53f2ab4d340",
"assets/assets/images/splash_6.png": "918fb11bd0c5e9bd67b6901be01e5e1c",
"assets/assets/images/splash_7.png": "afe60e68d238c344544b7d4031ce0e3c",
"assets/FontManifest.json": "71ec0b907e47456b23e0d5ca6ab60ae1",
"assets/fonts/MaterialIcons-Regular.otf": "79e871ce4739604da5d563123972116d",
"assets/NOTICES": "98c780e02de9e467fd1e5720e02564d0",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "66177750aff65a66cb07bb44b8c6422b",
"canvaskit/canvaskit.js.symbols": "48c83a2ce573d9692e8d970e288d75f7",
"canvaskit/canvaskit.wasm": "1f237a213d7370cf95f443d896176460",
"canvaskit/chromium/canvaskit.js": "671c6b4f8fcc199dcc551c7bb125f239",
"canvaskit/chromium/canvaskit.js.symbols": "a012ed99ccba193cf96bb2643003f6fc",
"canvaskit/chromium/canvaskit.wasm": "b1ac05b29c127d86df4bcfbf50dd902a",
"canvaskit/skwasm.js": "694fda5704053957c2594de355805228",
"canvaskit/skwasm.js.symbols": "262f4827a1317abb59d71d6c587a93e2",
"canvaskit/skwasm.wasm": "9f0c0c02b82a910d12ce0543ec130e60",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "f393d3c16b631f36852323de8e583132",
"flutter_bootstrap.js": "0bc379938afb88f33f8e5e2f16906819",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "a8d9a610363763b033fbf716b783e17b",
"/": "a8d9a610363763b033fbf716b783e17b",
"main.dart.js": "3c8325a00718aeb3bcce36d9e788b542",
"manifest.json": "56cf8b3cf19fd528c3228fee4b93f535",
"version.json": "8598550327215a6063c028f21f27d78a"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
