'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"flutter_bootstrap.js": "59bac9db41d4866eeb4809c647cf085e",
"version.json": "ff966ab969ba381b900e61629bfb9789",
"index.html": "0ff437d2721fb011362172a6b65cdd33",
"/": "0ff437d2721fb011362172a6b65cdd33",
"main.dart.js": "7a7fc104e3cf0bb3dd6194141df7b80f",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"manifest.json": "0867c3e13649ac4d06fe34b7b3ddce08",
"assets/AssetManifest.json": "cd7eea0433dd3f4352774f710cba3f65",
"assets/NOTICES": "00ae3866bfe9c2de11ed9853c2e7788e",
"assets/FontManifest.json": "eedb9ad6efec5d49fbb0a934bd7cd794",
"assets/AssetManifest.bin.json": "f6a9c6e556205f3ac925ab869147f5b4",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/antd_flutter_mobile/assets/fonts/icons.otf": "f6ce8fe211920fbb029b1647f2ef567d",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/AssetManifest.bin": "9e77e45921fcd3447109ebd04ccea6b7",
"assets/fonts/MaterialIcons-Regular.otf": "c0ad29d56cfe3890223c02da3c6e0448",
"assets/assets/images/empty.png": "9634d320c6a59004b028de91a3bd9563",
"assets/assets/images/error_default.png": "6e1f99437c679b6a42bff5e43229dfc3",
"assets/assets/images/error_empty.png": "d4fb75aea2fd673798a4a68d8b1dffc1",
"assets/assets/images/error_busy.png": "98613a739bd0dd28d50d5355b7543283",
"assets/assets/images/error_disconnected.png": "66b9548ee458af2cbb5bc0ab58e26221",
"assets/assets/docs/AntdIndexBar.json": "32b1f1edc4c7c785285689e559edfaa1",
"assets/assets/docs/AntdTag.json": "94718826ace370a9aabd8bb1d516d632",
"assets/assets/docs/AntdDivider.json": "a3f8fd3ce621d73547a50b655289a9b4",
"assets/assets/docs/AntdSliderBar.json": "cb21c93f76ae001c6b9dd69b78837347",
"assets/assets/docs/AntdInput.json": "9cc3b533ba73f7ace00f10337015d3c9",
"assets/assets/docs/AntdProgressBar.json": "ead62b6184ca1b82fbd270ec9f9602d1",
"assets/assets/docs/AntdFormItem.json": "9e6afd31ffc510b42499a1a77cbab87f",
"assets/assets/docs/AntdSlider.json": "5f791ab6aba158b56e17192bf2806237",
"assets/assets/docs/AntdSearchBar.json": "752b4a0813e282790170317e059174dd",
"assets/assets/docs/AntdForm.json": "651a67ff646564117749da4c6b76abfa",
"assets/assets/docs/AntdTabBar.json": "0cf1afb26afed606318489bd9b5f5eb5",
"assets/assets/docs/AntdCard.json": "c50172bc9fe188b6ca2a30543eaa6b29",
"assets/assets/docs/AntdLoading.json": "90368f83cd6f1ed8d335aeba98a597fb",
"assets/assets/docs/AntdFooter.json": "2a493171decbe577848402f0bc9e52c8",
"assets/assets/docs/AntdEmpty.json": "6b1f4488a8fc3f3f70d9ea5ab3c6ef3f",
"assets/assets/docs/AntdSelector.json": "7817f2defdda3bfda05f5336521b8c84",
"assets/assets/docs/AntdIcon.json": "94afdf75febe8a26de6170a7809dc329",
"assets/assets/docs/AntdResult.json": "d184bdbd970f9804ab13f999ae3e4dce",
"assets/assets/docs/AntdActionSheet.json": "58a42376417ea2ca15614125fb7e8890",
"assets/assets/docs/AntdCascader.json": "7b0cdd55ff6d1a4f783d845be3e44427",
"assets/assets/docs/AntdModal.json": "07834f8465bcafed3546134a1d68332d",
"assets/assets/docs/AntdFlex.json": "7696014d0ae95cfed7a7dab86aa44e09",
"assets/assets/docs/AntdList.json": "d8e797ca3abc7908beb2bfc593c58ee9",
"assets/assets/docs/AntdNoticeBar.json": "fc23de05cd5d44aef800a6f4b3308a00",
"assets/assets/docs/AntdTabs.json": "60b138791ec97b4babaf8ec1a50facd3",
"assets/assets/docs/AntdSwitch.json": "b2658576a2ceaf7722518f31f1f86cc2",
"assets/assets/docs/AntdCollapse.json": "5cb9d152a01d6420fb1e7474cc3c5171",
"assets/assets/docs/AntdMask.json": "f0b60d47e384eb0214ef57b2cb1bb192",
"assets/assets/docs/AntdToast.json": "f013ace6f3ff63f8e9f8e24c8a7b6515",
"assets/assets/docs/AntdCheckList.json": "86f6328bab7e0508a07bb9d45a1e61f2",
"assets/assets/docs/AntdErrorBlock.json": "7395a76f7703bfddf28c58fc03e61570",
"assets/assets/docs/AntdNavBar.json": "0134f612eee7f9a922444570504ff868",
"assets/assets/docs/AntdFloatingPanel.json": "decb24a7393c5ece3cebca1103145bc6",
"assets/assets/docs/AntdBox.json": "38d4c559df57bda0c9c99f8e526416bd",
"assets/assets/docs/AntdCheckbox.json": "2e27ca862b54206e2f1928f4aabdece2",
"assets/assets/docs/AntdTour.json": "6c3a502d73ae8e60b0bef8e2afd38698",
"assets/assets/docs/AntdSegmented.json": "1eb1c5f0324acae4785f980f22ef01c2",
"assets/assets/docs/AntdTextArea.json": "a004508971cb592a13738fbd55a27a97",
"assets/assets/docs/AntdSkeleton.json": "27f62c9bb4fd9048b73ddfa50d94dfcd",
"assets/assets/docs/AntdJumboTabs.json": "8cb5ea96c8bb8c807567c70eee8d3f17",
"assets/assets/docs/AntdImage.json": "119192f7f7d7a5267c6470b716014f1b",
"assets/assets/docs/AntdBadge.json": "1eacddd8457a2ab915ed59b9630e9b47",
"assets/assets/docs/AntdPageIndicator.json": "32d562e60466cebd7eecc9a1cbb97128",
"assets/assets/docs/AntdPopover.json": "b8eaf8981fa6f456e9248530247726f1",
"assets/assets/docs/AntdAvatar.json": "77bf0a59f2ffb90bd4aa794ff3ef4bdb",
"assets/assets/docs/AntdEllipsis.json": "b8cf6c5faec05a1eaa82818b375964b5",
"assets/assets/docs/AntdSwiper.json": "ec43ef1bfe2a29ac4ef1d416318588cf",
"assets/assets/docs/AntdSteps.json": "49ef73f64a3dc19d43fa23df4a3ab26e",
"assets/assets/docs/AntdButton.json": "55f2fcf9812f3e9d62e1248c0dc3e361",
"assets/assets/docs/AntdRadio.json": "b0d2061820cf76578022a4aa13cc7a95",
"assets/assets/docs/AntdCascaderView.json": "a840a70bb5a17c6732938e6e98469c3a",
"assets/assets/docs/AntdImageViewer.json": "0667e75d8392bed67f8191c7429da37c",
"assets/assets/docs/AntdPopup.json": "262a12c473dc77ee42382eabd831ee4a",
"assets/assets/docs/AntdCapsuleTabs.json": "629cb85924cb5b7ec6c55670fa6c0dfa",
"assets/assets/docs/AntdSwipeAction.json": "665ca24150867ca61c1d29236130b2ce",
"assets/assets/docs/AntdPullToRefresh.json": "96fc682459fd71fae2dc32cf0f4caf79",
"assets/assets/docs/AntdProgressCircle.json": "7d0f642b1a74085dd991db9ea82200be",
"assets/assets/docs/AntdDialog.json": "47e0bbb00a6f1924e417b7390043364e",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b"};
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
