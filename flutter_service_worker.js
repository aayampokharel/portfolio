'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "fc7d8431ab996a9e1ab1956f1d83b98d",
"assets/AssetManifest.bin.json": "f988d7308c0f6c5ed1143102eaee13db",
"assets/AssetManifest.json": "96bb852a8e916d27ae45f6c168defb3c",
"assets/assets/fonts/Cursive.ttf": "8d31107b80c8b0c5a896d4188b733d16",
"assets/assets/fonts/Inter.ttf": "0a77e23a8fdbe6caefd53cb04c26fabc",
"assets/assets/fonts/Opensans.ttf": "31d95e96058490552ea28f732456d002",
"assets/assets/fonts/SpaceGrotesk.ttf": "f8409c4c5e0b5ab0abc7783a1ce58fda",
"assets/assets/fonts/Urbanist.ttf": "bfeaaa729391fa9dfdfb3ae36cf5429b",
"assets/FontManifest.json": "ca81fdcd583ada92220fd5e26408b5e4",
"assets/fonts/MaterialIcons-Regular.otf": "0db35ae7a415370b89e807027510caf0",
"assets/NOTICES": "d49866961ccbba5e97a73e96f9a237ae",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "e986ebe42ef785b27164c36a9abc7818",
"assets/Photos/amayangri.jpg": "c69110486a3ca6ca8ae8851eb4db6707",
"assets/Photos/AndroidStudio-Dark.svg": "9a428cffc36c8799a4926c2ac9f9d40e",
"assets/Photos/bat_app_ss.png": "e7f43494f913b4b6b6ab9e28bea58f4a",
"assets/Photos/C.svg": "20f18e0ea89dec91535e65aaf33ff1ec",
"assets/Photos/CPP.svg": "11e9cbf72943fa126785528f83a87dbb",
"assets/Photos/CSS.svg": "bf9b8efac7a000fcde8ba90e6f186044",
"assets/Photos/Dart-Dark.svg": "1e2ef8649acb27545b23dca10a25055f",
"assets/Photos/Flutter-Dark.svg": "590fab54bb261d391526973ac7b18e77",
"assets/Photos/gartic_ss.png": "05f091293e14a5394f32cb118639a8c7",
"assets/Photos/Git.svg": "0923944f047fc1cf2dbbf5203f54bca2",
"assets/Photos/Github-Dark.svg": "a1bb7f221e127a95df9d5e51ed45a551",
"assets/Photos/github.png": "2c026f72c0f6e61168bb20b5a8be12b6",
"assets/Photos/GoLang.svg": "40c0bb535ddebd9cd1e4d5bda8e1c4bf",
"assets/Photos/HTML.svg": "48ce79c640714aaf5a11d800aae3adc4",
"assets/Photos/Illustrator.svg": "6c42a99e63cc5746f6810aa1eebbe7d6",
"assets/Photos/instagram.png": "f2d9389b21b38a69d37e95c9e0876296",
"assets/Photos/JavaScript.svg": "08ecf83a63fa4501a12eb2ddd05085c6",
"assets/Photos/librarian_ss.png": "3ed51707ff69edf5bcd8b7e0ec6817a2",
"assets/Photos/linkedin.png": "79a7d2dd7efd9a77bb953a33f0570a1f",
"assets/Photos/me.jpeg": "1693f7c6d1d1754e5ce035184cd0e796",
"assets/Photos/me1.jpeg": "f7fb8c4a740aeeec1b0d5a1f01bce898",
"assets/Photos/me2.jpeg": "0cc020df5e06bc589fb9e23c9a63ee92",
"assets/Photos/me3.jpeg": "1f75531f28c01c5ec04fc7a413819d9f",
"assets/Photos/me4.jpeg": "ce61baa024dc43506b1162526ec7c86d",
"assets/Photos/mountain.jpg": "2692b0260565ec49bb01608637409a5b",
"assets/Photos/myLogo.png": "e21c92b1796da2c0bea103d606554ecb",
"assets/Photos/MySQL-Dark.svg": "395736b2fa4d9bfd6543b280979e5d54",
"assets/Photos/Photoshop.svg": "bfc7734ada5e507961a2d9385a4124ae",
"assets/Photos/PHP-Dark.svg": "4f6817801c28ced5994fc91d9beb32b3",
"assets/Photos/Postman.svg": "ce91ea6debbe0b984685dcb062d9413e",
"assets/Photos/quotation.png": "7a403c98f75e67f640350ebdbbc16587",
"assets/Photos/sunset.jpg": "1efa7c052035d4181308da544e517834",
"assets/Photos/VSCode-Dark.svg": "a374b35942492bdef55707014cf80f96",
"assets/Photos/XD.svg": "de6b02e8623ae13e7c0c7559eb40446b",
"assets/Photos/zanpakto.png": "89141ba9fd3227b43969a25eb515ac7b",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "26eef3024dbc64886b7f48e1b6fb05cf",
"canvaskit/canvaskit.js.symbols": "efc2cd87d1ff6c586b7d4c7083063a40",
"canvaskit/canvaskit.wasm": "e7602c687313cfac5f495c5eac2fb324",
"canvaskit/chromium/canvaskit.js": "b7ba6d908089f706772b2007c37e6da4",
"canvaskit/chromium/canvaskit.js.symbols": "e115ddcfad5f5b98a90e389433606502",
"canvaskit/chromium/canvaskit.wasm": "ea5ab288728f7200f398f60089048b48",
"canvaskit/skwasm.js": "ac0f73826b925320a1e9b0d3fd7da61c",
"canvaskit/skwasm.js.symbols": "96263e00e3c9bd9cd878ead867c04f3c",
"canvaskit/skwasm.wasm": "828c26a0b1cc8eb1adacbdd0c5e8bcfa",
"canvaskit/skwasm.worker.js": "89990e8c92bcb123999aa81f7e203b1c",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "4b2350e14c6650ba82871f60906437ea",
"flutter_bootstrap.js": "17b8a113ea3f348f7d027f89e5f838e9",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "c58e1f9fbbfbf9a838d55f4c0bbd5776",
"/": "c58e1f9fbbfbf9a838d55f4c0bbd5776",
"main.dart.js": "80d2e08ca5faf3ddc0cf284518ae22bb",
"manifest.json": "44608ddcedf3810473068bf0157d6f9b",
"version.json": "93d939be7666eea4b51f79298486318a"};
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
