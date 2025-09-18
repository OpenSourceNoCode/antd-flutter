'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"main.dart.wasm": "45c2e6636e8ea7369eb766e5b8a3c254",
"manifest.json": "0867c3e13649ac4d06fe34b7b3ddce08",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"main.dart.js": "cbd7a7d9febbe2df68db85259bc423e5",
"version.json": "ff966ab969ba381b900e61629bfb9789",
"assets/NOTICES": "a1eb25fb83a90d5c8bc3f5750930cda5",
"assets/fonts/MaterialIcons-Regular.otf": "c0ad29d56cfe3890223c02da3c6e0448",
"assets/AssetManifest.json": "2cf93d0c2bf236c89f9a7e287f618e47",
"assets/assets/docs/AntdList.json": "a79e9c836ac596a8dccf369d8ddd80c9",
"assets/assets/docs/AntdResult.json": "9fc07f72fe564e1aaf35b48fe4b7d305",
"assets/assets/docs/AntdSwiper.json": "141d1f61fbcc56d5ab331d6381beb3bd",
"assets/assets/docs/AntdForm.json": "785f6ed98f71d89f322e7b32a297efcf",
"assets/assets/docs/AntdNoticeBar.json": "dbe601aea3d10664bd0deff540e72346",
"assets/assets/docs/AntdEllipsis.json": "3764abf72fa00c555267695fbb6c81e4",
"assets/assets/docs/AntdTabBar.json": "5b0757fea71e429698040feb1c7176d0",
"assets/assets/docs/AntdIcon.json": "4d74a32c109a782c679cd5dba8933bc6",
"assets/assets/docs/AntdJumboTabs.json": "b3502cad5250960a932872c5d306027f",
"assets/assets/docs/AntdTabs.json": "0bff68a99bda75ca45edd60f5c7eaef6",
"assets/assets/docs/AntdPageIndicator.json": "5df32639d0d0efa43f07a0e23842436c",
"assets/assets/docs/AntdSliderBar.json": "6931af26fef9d60d8d340563adb03c9c",
"assets/assets/docs/AntdSteps.json": "6312b8b6c45fc2b59138965d1f79d311",
"assets/assets/docs/AntdBadge.json": "4d9b2ce894fd97e96887eff0d9cacf36",
"assets/assets/docs/AntdInput.json": "7da8539bba6f07edb0e09c3a60aaa061",
"assets/assets/docs/AntdPopover.json": "a69462731e65861bb2ce18f011059474",
"assets/assets/docs/AntdCapsuleTabs.json": "90c8840609f6482b6634a3bb17b53416",
"assets/assets/docs/AntdNavBar.json": "c879ec6d10e5861a22cf33a5a1db85c6",
"assets/assets/docs/AntdSegmented.json": "1d1b6b76349972aa7da8f79193fda1dd",
"assets/assets/docs/AntdSwipeAction.json": "cdc69e8c08cc8030d78771573bfef4ac",
"assets/assets/docs/AntdSkeleton.json": "45aefc4739f0bc3dd4b35485cbce0f67",
"assets/assets/docs/AntdFooter.json": "bba5582215a636704ac18188dbee35df",
"assets/assets/docs/AntdFormItem.json": "d819b65a34b8f110b344c21e23e60e24",
"assets/assets/docs/AntdProgressBar.json": "3a59b37c47dececd19c2ec10adac3591",
"assets/assets/docs/AntdLoading.json": "777d04932868a0598ccf50b8c2042af3",
"assets/assets/docs/AntdPullToRefresh.json": "bf960d540bf9ea8286bb21555972efb6",
"assets/assets/docs/AntdTextArea.json": "8057b3aba978c78739344b4552532933",
"assets/assets/docs/AntdSearchBar.json": "a05df9e2739c3bc65d3761dd718bc467",
"assets/assets/docs/AntdImage.json": "f466c3e33bb96505f21ff478314ab59b",
"assets/assets/docs/AntdActionSheet.json": "7d372bf027d4218d93336fd01dae3d34",
"assets/assets/docs/AntdToast.json": "2b4cff0e7982d6cc2263000e765c5d63",
"assets/assets/docs/AntdFloatingPanel.json": "b4fc7b1a328ec2af01e299948fb26349",
"assets/assets/docs/AntdSwitch.json": "5b6dfe61ad016b04e6107a35d72e7106",
"assets/assets/docs/AntdBox.json": "40ca557a99ef2c229543fce38f681fa1",
"assets/assets/docs/AntdCascader.json": "171aa85720452193a4f8b8405e37c30c",
"assets/assets/docs/AntdDialog.json": "691dff56a7165702860ab8f2c00b21c3",
"assets/assets/docs/AntdDivider.json": "6772a343a1cd22cb6fc63540a521d08c",
"assets/assets/docs/AntdImageViewer.json": "abbfe674bcc88853d1214614aae915fe",
"assets/assets/docs/AntdDropdown.json": "3fe87dfcc528c2b30a4626f4322f10c0",
"assets/assets/docs/AntdCollapse.json": "71915bc43719222f46ad8eac1774b276",
"assets/assets/docs/AntdCascaderView.json": "0d439d4dbb32a362a512ec6ffc9be872",
"assets/assets/docs/AntdFlex.json": "274788a398e7b39653889821fcd731a2",
"assets/assets/docs/AntdCheckList.json": "9fac0f3b604d51d4c4518fa1bc66035d",
"assets/assets/docs/AntdEmpty.json": "1f9221632c38c6da9d60cf073c7dc406",
"assets/assets/docs/AntdRadio.json": "a42486629807c3e3969b5f23b70c248e",
"assets/assets/docs/AntdIndexBar.json": "03661a41c3b766e4e2242432765eb35b",
"assets/assets/docs/AntdAvatar.json": "70334eb19b2aae6dd887749731a6792c",
"assets/assets/docs/AntdErrorBlock.json": "6db9175e634571e9aeeeb14639dc8753",
"assets/assets/docs/AntdPopup.json": "38151633da615535b21d7f82c2d4177e",
"assets/assets/docs/AntdButton.json": "a4bea0b0d930bec1c41ac8c52639f2b6",
"assets/assets/docs/AntdCard.json": "a1b6924ff673fc98f8c2ea6c79b4b7c8",
"assets/assets/docs/AntdMask.json": "aaeae0cc362f6acf25a084138e925a71",
"assets/assets/docs/AntdSelector.json": "066101e1f146d2c293b816d38ff793d6",
"assets/assets/docs/AntdSlider.json": "f4d89aa62663fb931d90c24c5711d666",
"assets/assets/docs/AntdModal.json": "068493031acb4b34a740bb4831f23067",
"assets/assets/docs/AntdCheckbox.json": "942c78df39ed7d822b7477ac69022316",
"assets/assets/docs/AntdTour.json": "f41303f696dee08cab2bd39d48a73060",
"assets/assets/docs/AntdTag.json": "41d0609443ca76b1104869e50e78a39c",
"assets/assets/docs/AntdProgressCircle.json": "00caea661bcf4951dbc740025f6a61f4",
"assets/assets/images/empty.png": "9634d320c6a59004b028de91a3bd9563",
"assets/assets/images/error_empty.png": "d4fb75aea2fd673798a4a68d8b1dffc1",
"assets/assets/images/error_default.png": "6e1f99437c679b6a42bff5e43229dfc3",
"assets/assets/images/error_busy.png": "98613a739bd0dd28d50d5355b7543283",
"assets/assets/images/error_disconnected.png": "66b9548ee458af2cbb5bc0ab58e26221",
"assets/FontManifest.json": "eedb9ad6efec5d49fbb0a934bd7cd794",
"assets/AssetManifest.bin.json": "cf99dbaa71194deed88150d24e3096f1",
"assets/AssetManifest.bin": "779337bcd7ecee47ed43299c07f72a4b",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/antd_flutter_mobile/assets/fonts/icons.otf": "f6ce8fe211920fbb029b1647f2ef567d",
"main.dart.mjs": "4963b8eeebab80dc18cfa36a28d6d9e1",
"flutter_bootstrap.js": "255ef6450ddde4e26e69b5137811aba0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"index.html": "8dbfc050d50fc29d9c384e90fba88ea9",
"/": "8dbfc050d50fc29d9c384e90fba88ea9"};
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
