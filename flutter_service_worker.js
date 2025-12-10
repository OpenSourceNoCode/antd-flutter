'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter.js": "888483df48293866f9f41d3d9274a779",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"manifest.json": "0867c3e13649ac4d06fe34b7b3ddce08",
"main.dart.mjs": "945d0e68f6e815898533970a5d5a8390",
"index.html": "8dbfc050d50fc29d9c384e90fba88ea9",
"/": "8dbfc050d50fc29d9c384e90fba88ea9",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin.json": "cf99dbaa71194deed88150d24e3096f1",
"assets/assets/images/error_empty.png": "d4fb75aea2fd673798a4a68d8b1dffc1",
"assets/assets/images/error_default.png": "6e1f99437c679b6a42bff5e43229dfc3",
"assets/assets/images/empty.png": "9634d320c6a59004b028de91a3bd9563",
"assets/assets/images/error_disconnected.png": "66b9548ee458af2cbb5bc0ab58e26221",
"assets/assets/images/error_busy.png": "98613a739bd0dd28d50d5355b7543283",
"assets/assets/docs/AntdRadio.json": "9d481899c8ef562fe7195c65c67c5383",
"assets/assets/docs/AntdIcon.json": "5f63d5fe431e9d77b95f6ab581f2febf",
"assets/assets/docs/AntdSwiper.json": "a4384381accacfacbbd4cadf8f1b4acb",
"assets/assets/docs/AntdForm.json": "01e27b4d15b98bcc8c078dd9f72739eb",
"assets/assets/docs/AntdActionSheet.json": "d21ac874f2eaded1f976a4dc993ce38c",
"assets/assets/docs/AntdTextArea.json": "9a6ec8e2243d6f74d6ae909cf4035161",
"assets/assets/docs/AntdPageIndicator.json": "d2dbfad152f2445eb5150ce20ca47ee0",
"assets/assets/docs/AntdPullToRefresh.json": "662be511afbef31119f2a3924bca7061",
"assets/assets/docs/AntdSwitch.json": "b20e1e21437a1ddb770f025d8adadf02",
"assets/assets/docs/AntdProgressCircle.json": "40fcb79bf4ad157bd6fdb445186b496a",
"assets/assets/docs/AntdFloatingPanel.json": "45f34316f954d26cdd28674bff44639e",
"assets/assets/docs/AntdInput.json": "8942e58889447f64c5c285b546f9776f",
"assets/assets/docs/AntdFormItem.json": "7e0122f4981e3427c8cb7897b3699007",
"assets/assets/docs/AntdSearchBar.json": "976cc80c4c058d56423cf6cd75e024a5",
"assets/assets/docs/AntdBadge.json": "94eb09f425922c2a696b86650a6d9ce2",
"assets/assets/docs/AntdSlider.json": "a33f0c8470dff4cad9d0fbeb6ae1949a",
"assets/assets/docs/AntdTabBar.json": "cdc9a216efdb80ae456c13f310d3f363",
"assets/assets/docs/AntdJumboTabs.json": "90615380519f56a432f8b065023d5706",
"assets/assets/docs/AntdLoading.json": "6e54b5089ec3e7b2a792bec5a7962fa9",
"assets/assets/docs/AntdBox.json": "6b9968deba18cf22b81cdf075a728acc",
"assets/assets/docs/AntdSelector.json": "fc304a341582f33ac01dbad208aa4dc1",
"assets/assets/docs/AntdButton.json": "c1c2a775b2fad4938c1ce393f72e92e7",
"assets/assets/docs/AntdPopup.json": "39a87a7c96306917f767cc52d9073d45",
"assets/assets/docs/AntdSkeleton.json": "dc2c9151b696674c4123988404691908",
"assets/assets/docs/AntdEmpty.json": "1f9221632c38c6da9d60cf073c7dc406",
"assets/assets/docs/AntdDivider.json": "42fbc94ff51d94c768b6dbccab844267",
"assets/assets/docs/AntdCapsuleTabs.json": "5a958cae315551c398934fca42dee828",
"assets/assets/docs/AntdSliderBar.json": "4bea215b9a4a8024a011f2ff1abb807d",
"assets/assets/docs/AntdCascaderView.json": "60f6b79859a2b36bcaffee5e836f3920",
"assets/assets/docs/AntdTour.json": "33a62318a5c6b65cb51d3f367fd5532b",
"assets/assets/docs/AntdResult.json": "9fc07f72fe564e1aaf35b48fe4b7d305",
"assets/assets/docs/AntdTabs.json": "7d2329b8bff8d6db6e491d0875bb26fb",
"assets/assets/docs/AntdImageViewer.json": "abbfe674bcc88853d1214614aae915fe",
"assets/assets/docs/AntdAvatar.json": "70334eb19b2aae6dd887749731a6792c",
"assets/assets/docs/AntdCollapse.json": "49275bd2c42510d3cd542d0b5f942eef",
"assets/assets/docs/AntdCheckList.json": "42641164b2c88c38c2c958bd2a54d474",
"assets/assets/docs/AntdSegmented.json": "f785dd471ac2d1fc5ba96241ebd8da98",
"assets/assets/docs/AntdCascader.json": "97d90b247c40756d43de4d0fcc175282",
"assets/assets/docs/AntdFooter.json": "bba5582215a636704ac18188dbee35df",
"assets/assets/docs/AntdList.json": "0d249722946a10ee20bca2424c7de505",
"assets/assets/docs/AntdImage.json": "f466c3e33bb96505f21ff478314ab59b",
"assets/assets/docs/AntdMask.json": "eb1d9c146a1deb472e164fed10aba3a9",
"assets/assets/docs/AntdCheckbox.json": "a668b39b8b7eb8312958c2b1571479ea",
"assets/assets/docs/AntdProgressBar.json": "593bc7038fe5f9242848b243dba2f299",
"assets/assets/docs/AntdTag.json": "4f7706b629e468215402ba3733b1396e",
"assets/assets/docs/AntdSteps.json": "5bc3abc81cde1b951c57b65ed8e58942",
"assets/assets/docs/AntdErrorBlock.json": "cd499c4a5599fbc239df803881e51756",
"assets/assets/docs/AntdNoticeBar.json": "359767ffaae030f6c22285899e668611",
"assets/assets/docs/AntdDialog.json": "72f52a21d8ed0e060635ea83e1ecf303",
"assets/assets/docs/AntdModal.json": "bf2ce14509c4f54e5e016724c0446d76",
"assets/assets/docs/AntdPopover.json": "295cb0661424c038c7d36d6779bf2217",
"assets/assets/docs/AntdCard.json": "a1b6924ff673fc98f8c2ea6c79b4b7c8",
"assets/assets/docs/AntdFlex.json": "274788a398e7b39653889821fcd731a2",
"assets/assets/docs/AntdNavBar.json": "4791ef0102d1022dd94710cf5c061716",
"assets/assets/docs/AntdDropdown.json": "1e1b2a7cfefbff83a42666edfbd6ac73",
"assets/assets/docs/AntdIndexBar.json": "7b0f2ead11fd76c3179d4b86fe733676",
"assets/assets/docs/AntdSwipeAction.json": "3213bccab9f91577433bb2d189856042",
"assets/assets/docs/AntdToast.json": "818c0e9c2769492e1678ba901db86717",
"assets/assets/docs/AntdEllipsis.json": "42ce6ab9fa7cdfc56e20eb8d836c0ef8",
"assets/fonts/MaterialIcons-Regular.otf": "c0ad29d56cfe3890223c02da3c6e0448",
"assets/NOTICES": "a1eb25fb83a90d5c8bc3f5750930cda5",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/antd_flutter_mobile/assets/fonts/icons.otf": "f6ce8fe211920fbb029b1647f2ef567d",
"assets/FontManifest.json": "eedb9ad6efec5d49fbb0a934bd7cd794",
"assets/AssetManifest.bin": "779337bcd7ecee47ed43299c07f72a4b",
"assets/AssetManifest.json": "2cf93d0c2bf236c89f9a7e287f618e47",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"main.dart.wasm": "669af111542aec5603e5bce6bd52b37a",
"flutter_bootstrap.js": "b8754082ae60bd82d6ffa99388bfb5eb",
"version.json": "ff966ab969ba381b900e61629bfb9789",
"main.dart.js": "386eb8572be8613737c9dc5a925262c5"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"main.dart.wasm",
"main.dart.mjs",
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
