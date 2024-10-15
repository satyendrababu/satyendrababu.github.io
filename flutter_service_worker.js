'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "6d2fd4056babc68a3df3615c6361a522",
".git/config": "ea6accafdc16ffaabb35f2f0af60f33e",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "cf7dd3ce51958c5f13fece957cc417fb",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "7f1f9bfb1bd79f153283bc34f7562321",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "a6243f6ac8c43060ba7a724fd83a4287",
".git/logs/refs/heads/main": "f4291e7e94cc317a77e28a697774f66b",
".git/logs/refs/remotes/origin/main": "d92f521ff9f12e355d07859de78dcc99",
".git/objects/00/6b9f738cbe9c80b983a3821f73572d9230f001": "c2ec15a75ed25693f6d126618a72eb42",
".git/objects/02/8e160cb6edc958f591e033d6dbd7c1f48899e4": "c41426654c60364fda4aff2e0051367a",
".git/objects/05/3185e5d299739eee7218f2e93876f0c3a5463a": "d1031cd0f181a1e34b10b17db26a2038",
".git/objects/08/32d0db2def1613c1c45aa4fe9156a1c6b7d589": "e05df183e5eeaddf39672a2516f9c41d",
".git/objects/0b/172c16b7843d06b103fa578ef4f69849e9bdc3": "3d12214ec9d2ab2293aeb6bf441b5842",
".git/objects/0c/39ddd5521e0349802e0e4de715d0f9eab2a840": "a7899deb8b6a1b8644a5cc7ccade0341",
".git/objects/0e/f8677691766d19f7f2af975179937dc810e193": "7a0f72ad11fce411cfe6749590ef520c",
".git/objects/0f/6ad44898991fa4f92e6af72dde3c20ab5514ab": "aa51aa26240462415ec39bff80f32ae1",
".git/objects/10/90b569d32d9ac7b8c599f99c2bdb5ceb4e1afe": "2cb7535454c63e42b890b6ae1a777f40",
".git/objects/11/c48552fd4c2adea649358af2d891b4a7503b97": "efa038c987f3d8b7bf93cc7d31ad10c5",
".git/objects/11/ee4d1d40282be43997382b36400a5eeac533f1": "ffb2fd90aef37a376a1b643f1c59f8a8",
".git/objects/12/fe653bc8a445281597fead56e15c3767cc2694": "864b95998a0923565f76935b769532c9",
".git/objects/14/77578033687843c58fdc1e3e8dda3a2938c0b5": "b1077996346ec5952ee611442e75f4db",
".git/objects/14/d3595bc7260c30d8dcd777b1d7d5c2b9dfa241": "c3c071b742a7a0d066017db7b69cdd12",
".git/objects/19/a52c2b58a8470840503119851e116078205c29": "7adc4631d4112b8b5262e87c4c06ccbc",
".git/objects/1d/2ebb4b640c7f8e373288ad49bd5557438611bf": "b925c65c541c305fba4ae6e0cb812a76",
".git/objects/1f/45b5bcaac804825befd9117111e700e8fcb782": "7a9d811fd6ce7c7455466153561fb479",
".git/objects/20/4cf5f434c36cec5ef2125cf2cf0cd740644b32": "225a70b1145723f93d3831c84faccc0b",
".git/objects/21/05b2e955e32762ab113e2cf3a43c5c33da9abd": "ed280d13fad027005860e2476ed65ae0",
".git/objects/21/98348dbedf5a836173c437e494c1c613010542": "76da9f6eed5f6246017405915ccbcbb5",
".git/objects/23/ca8f50e3ad0f0dcb1d5d5a8aac6ef043ac5557": "9fb0884a32682af7be9abf4b05e68894",
".git/objects/24/1b83a4eef2ca1556ba8fad8a13c5eb62871ee2": "4221172c1011b6fc7d674518ab125e34",
".git/objects/25/8b3eee70f98b2ece403869d9fe41ff8d32b7e1": "05e38b9242f2ece7b4208c191bc7b258",
".git/objects/27/7bf1fefb228a118f2e50430773167a1ffc2f1b": "38357452f2f2b87f34f58bc3dfa1922c",
".git/objects/2c/3967943a9b04c5aafe1c2355d3c6d89a73cc84": "c9c571b1368be673596761fea9c934d4",
".git/objects/30/6695002193660b0841f97103c8080b411089fe": "7d08389215660e6aa3203a6de4fb3640",
".git/objects/31/225608a4b29f44a59a3fceb5578047fbb0139a": "338d043db2a63e709de8bca39cc0d05c",
".git/objects/32/092d8436baeaf92cd13589440e9c3c18d22862": "4f82c8bc5da7feafe07bf958a68f48f2",
".git/objects/32/aa3cae58a7432051fc105cc91fca4d95d1d011": "4f8558ca16d04c4f28116d3292ae263d",
".git/objects/37/8d5df039af026c470d0cbe78897a92e9652784": "103b02a4512bd7b6382f8f64c1fa8b47",
".git/objects/38/f95a0aeaba4b977c573dfb5ab0370795467067": "0e89815e2fb73edc83ebea208223c0c7",
".git/objects/3a/7525f2996a1138fe67d2a0904bf5d214bfd22c": "ab6f2f6356cba61e57d5c10c2e18739d",
".git/objects/3a/e37e0021c215831c8150643be2b981bdcbce3e": "7a44fcf18af59d91c612500748a05d97",
".git/objects/3b/64ad9c1d9777b04676b704be5f7d8d591ac964": "045cf58acda439e2c4f650da2add68e7",
".git/objects/40/0d5b186c9951e294699e64671b9dde52c6f6a0": "f6bd3c7f9b239e8898bace6f9a7446b9",
".git/objects/43/9d605b8d55acf6e19d52dc5502305d549f9619": "9089f140e0a227d9dba4b845d18cac83",
".git/objects/44/a8b8e41b111fcf913a963e318b98e7f6976886": "5014fdb68f6b941b7c134a717a3a2bc6",
".git/objects/48/6db0642488e2dea6af6399d1f223358687e506": "e85bdca70052fdf0d35089e5c4916d4c",
".git/objects/4b/9cd84e7d6265e1583d9493a71925465656e0ec": "d1120ed734604c96e46a9a07f2e1779b",
".git/objects/4c/336380c241e6d1b04e619cd6dfa1045c3f0ee7": "f127cc30dd384a4ed56ac7d2d9f5582f",
".git/objects/4d/4e36ceedba22a888240bc4fa8b1f547aad1839": "7adf89ac67099f7d08c28b55b557fd2b",
".git/objects/4e/1a2b9004f00946ba1b733a2406a6127e1de92f": "f803cf29e6125f357a7bcedb2de10fa2",
".git/objects/51/3f889c60cf658adcc7308e0ea1f92a694befcf": "9b9d274c11150f7740db1a481c8c5bbe",
".git/objects/52/f41960a350be7a4e19f1b1fe31b70449d576a9": "6f358ee2196138375eb984ff3d776f69",
".git/objects/57/87b9814d8fd55919dbb9a63c05314e1dc20f8c": "aa30d83afca804d23a473bf394cac262",
".git/objects/57/b4bf3cb8d0c01abe9e6db7ddac8e5c9f3504ef": "7e0b05189a00a9e7189571a0aa1c4acb",
".git/objects/5c/128fcda836a9fa74063ecd5b3026747f063565": "8652816c63440a78410d6703f96112e3",
".git/objects/5e/48d652a69702f825f89f5a68babda48afdaef3": "4bb49b410626baa8b8b5c3ac239f1be6",
".git/objects/5f/46b3e0330bfc317b88998c46dcb0c04e657528": "558abdb214fa4ca2e8fa0b44a17ce05e",
".git/objects/5f/d2bca3bb9b0fbb305839dbf900381660d9aa20": "da0c35795ce63d1226302eb330a16ef1",
".git/objects/62/c95729bc14ad3f8053e0a45106e8b6bd010f04": "d2241e3f9251397f4db1aa4e15765ced",
".git/objects/6b/98f08421cea1827126819c5d0db061e11a1f27": "67bb39ff8df8f86ffb43ca1683884cad",
".git/objects/6b/d6d8047b058f1920e08e6ed2c9f82ab1457a8f": "bc3c1fdf912529ac8739e5dd3cbf2783",
".git/objects/6b/e909fbf40b23748412f0ea89bf0fae827ed976": "5f118419157d9534688915220cc803f7",
".git/objects/71/d90172f10fab5ed0fd422a40cc09e7ef558072": "98ef36ed54597860a2bbfc23e813c97f",
".git/objects/73/75799b89205c6860f1a0ebac034a57bf10902f": "a5d3ea35c8399f92324481b081609a3e",
".git/objects/75/e95dd214fb63f3ff5400f0cfb7feaf30a10c90": "3fc4af58eb02d6fbb95db20a6d8d8075",
".git/objects/76/81cda7a0bf3b0c3e804de8a32986d3dd1f2efa": "de79e25c1aa7080bff397182494c152d",
".git/objects/77/45881f4131cc6eb2bb9a66cc9255dc8272bc1d": "cb518d37a633f8480f080c3bd0c9ab1e",
".git/objects/77/6af85e912b33411ba18595d7073c12cb181f62": "11ed58822fc8e616e1d1d23f4ff14ad0",
".git/objects/79/adaa0c9b8baf679ef46f500117206bb615bae3": "3638ce9f7e64ae96a993b34af6b20b9a",
".git/objects/7a/949e18ab8d6d29f6a593f307d054bce93b7709": "5b2e983e2b44035024cd30c69a46fbf0",
".git/objects/7b/84ed2e8ed61b8edfdd3b96728ca2bf62a5a975": "8e9e2d7b7132b656639032941dd4ab2a",
".git/objects/7c/4446d071f5475cd50ab2acb406deb74b5d5e12": "245cb61fad1755fe065164eebfd1cae9",
".git/objects/7d/4446401b728c33ded9aac080a2ee0301f7097f": "2aef2626d06d00a56087217d6cfd9f28",
".git/objects/7e/8d2db9e712cc6f47462e72dec673a9b00ce9fd": "cfa5327fffd575e4b2072450f1c89c8b",
".git/objects/84/0516208d35dcb4298847ab835e2ef84ada92fa": "36a4a870d8d9c1c623d8e1be329049da",
".git/objects/85/6a39233232244ba2497a38bdd13b2f0db12c82": "eef4643a9711cce94f555ae60fecd388",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/89/54b64347662505cf2fd20732c84b366a339488": "4b380120ee8e55114bcb422b314df5d2",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8b/88b9e4350cc6e8b07f4d3ffa0b47c568fa3d2f": "ae12f92e934aebf9654f348af7b58dc3",
".git/objects/8c/e0eae7acb499d63a8ede0357bd6ffcdea1858a": "8c3e469a17618c4241be8a732e8de9e4",
".git/objects/8f/ce154dde22a50d16bc8cbf10af1dd636f863b6": "34b07dd9e46f1099c89d68d4c711feff",
".git/objects/90/bcfcf0a77ab618a826db0fd8b0942963b653af": "fc109675cdf1233dd6599a4c3c0a7a69",
".git/objects/91/564e6023ab78a6f11e81023ae8cf3a6c529bb2": "a64139e911851de17a7a56f9286993c3",
".git/objects/93/9f14f71d34faaee0526d72b238f8bad6f69166": "ac1aff911bea39396469dbfa4f184bba",
".git/objects/98/57c9b3b0448c92818efc5fda0f206b21914168": "ecbde07c564dabbec0f249821051b8af",
".git/objects/99/bce4d3809de16dcde40a98758376931bf43ea5": "111e438ea45985e450f0375113ee19fd",
".git/objects/9c/ed1603831731ba7da9bacc0ea72768bfd54f16": "cf3ae1a8ed26ab8bafb7338e983f205a",
".git/objects/9f/d5371ce760872490f27a838b90d72ca2130c80": "aa7e718392108b8f68359a2000a7bad0",
".git/objects/a4/dc507176d4588de8fdf6f3f7f77bc2984f329d": "186d04f8245c6e0c3f42abc647561999",
".git/objects/a5/f6f97aece5dcf4bace729d928e4e01a9425629": "ffa30a34e5ebef6f3c71fa43e11ada94",
".git/objects/a6/bc7c0e90363f5e4d4941815e3a429ff2a57ed4": "033534a05e6cd62cdb4c53a2e9fddce5",
".git/objects/ac/ae361282a129f3f44b919dab13fdb139a9316d": "bc9d63557b6c95848b4066161a241685",
".git/objects/b1/5ad935a6a00c2433c7fadad53602c1d0324365": "8f96f41fe1f2721c9e97d75caa004410",
".git/objects/b1/84314f62363a2c1ea20b7f8750dcfe8752adad": "c784db95c33276679fd893f96cdbd90b",
".git/objects/b4/f3382c74df74b51db902eeff432b0384c2f257": "4eafd483abbdf2667fda73935587c225",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/06dc09a8668da8508a986e41bfa4571fba84fa": "fcd5303b88bbbb680ed045f955d79ce6",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/b9/5442dbf30ea1659962c3ad6c39289fe8e11ae4": "4f05c85d0b26cecf1adcb77efbd2f13d",
".git/objects/ba/5317db6066f0f7cfe94eec93dc654820ce848c": "9b7629bf1180798cf66df4142eb19a4e",
".git/objects/bd/d0bf6531c01a271494e31ef4c11d641e09823a": "1943266183db7d2f7a28dac54b2756f1",
".git/objects/c0/25f8fd6806d4b9603cb7af70e07da9717d7553": "8235c14acab50da699a2a3b8e80d691e",
".git/objects/c1/17f25e31e7f9b291e99525cda4b93e537cb00e": "e4184b22715a8aace6760f2ac6ab40cb",
".git/objects/c1/b29247ccab3a69fd443623fab2ef520a575b4d": "3dfb8a5f69a3471c6cf753b57e125f6e",
".git/objects/c1/b934583f4e1f17fe94c65b52c0203381ea7ba1": "65bc72383abb263e0ee30dc97499f07b",
".git/objects/c2/a6cb77a5420d2d6f51daa50691d06a53bee352": "557c5af6493d861caf80eace416ba676",
".git/objects/c5/6be26071364bb8dc5142feb645c1dfb1861515": "d6fbd43452521219da10e417e3fde31b",
".git/objects/c8/26f21a1169c06220553bfb39e86955a1950264": "85936069af77f1f7033fa92f521b2024",
".git/objects/ca/8c4775573187fc24d48f66075392a95f6b0ce0": "1cdffadfcb3ea92fb46c3060cc5f273f",
".git/objects/cd/13f60ce1987656c23484e5468d82dcaf6689a6": "f5af40304ba895732a52ea05fd10ffa5",
".git/objects/cd/14d93d1e483a64c597daac72d8318b10793151": "6b7065c6b6b015944d2bd885cdf9a883",
".git/objects/ce/097c8256a78e54c70e401c670a7fab0a138621": "800ca44358e7ca0de3ab5eae5b7aee97",
".git/objects/ce/64ae866d441f9e45830d75b9943dc124de3464": "198dae89c55dcec1603ff87e3a346bfb",
".git/objects/d0/23371979cf1e985205df19078051c10de0a82d": "700b71074bad7afee32068791dec7442",
".git/objects/d0/3283e990320e9b9c16450bbb0ee7d290ab148b": "627794fef75d33c7dc5f89d8eecb53fe",
".git/objects/d0/ade6874906d500e91822d8fb3e427092cb8cb5": "aaf2bf821274bb6edfcc28b8fb3467b4",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d5/bb50b3c3bc534b51ba035a5e8495ba7af5025b": "81d30e6f235d2cd1960b1a0d917b3043",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d7/33b79927bd882c2ce110fc522fba835b671b19": "594f6aa86a0b7bd9f6a160ab2b5136ca",
".git/objects/d7/b3179a580167bc2fe1ab253f62526dc4ed2825": "90326248272687e83553e380e84b0ac6",
".git/objects/d8/f4e4b993d5472692894028a0bce9b3c0ec99c1": "1c7f1fb2e7ed603e24e6dd8ebba330e7",
".git/objects/da/fd65422747502c19b5c74b4230282644d2169c": "d8a62caf99a372ff6c7692e143787ce3",
".git/objects/e0/21f325162da90c5964f2ef87860c7f894b4f35": "507d880210b856766903a2d83c231c96",
".git/objects/e0/559765fce6132c4e5fb9ad6346de403f7f0d1f": "bc305d80684276b4c51b71adb2743746",
".git/objects/e3/bba29f6614081f5cba5579b10922a8d8809524": "4ce91966cd927f0b7c100382a2c46963",
".git/objects/e8/a04f883350cd83dbaad03c979b0d7f43b0aa15": "c6a14e04778e7df07db4b2e447ac0061",
".git/objects/e9/195901b154e9fa8ca0afd25d2551d52cbe4500": "32d211a0f72b2c1b8f4c72ab5a898f2d",
".git/objects/ea/8e81c58201c39a9ef9b73ab132b2183189895f": "bf2509747e5506157cac03805371574c",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/f0/4b3834d07648f3278f982f71a46bf072545350": "a79d2a2a7eb8f192110c73adf344c61e",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f6/2c6f67483e7bfbbbb373e3c1acf89a95518c6d": "69942eb6959a953eb4175a1b9357fcc6",
".git/objects/f7/996a0757098a4cac6a02cd1462cd68893707bd": "1511ff2d0c53427ff431b05ecc759df2",
".git/objects/fc/efb356a6d33c793dfbdc3df3cd2aa6af8a3380": "215e38cc8618f0be1dc5366417c24b91",
".git/objects/ff/8abdcc44bcdbd1d4f674952c5c4686446d9c90": "97f57c5470150794e97115eed8272b2b",
".git/refs/heads/main": "3cf7674d958269ec943aa8af87b603ab",
".git/refs/remotes/origin/main": "3cf7674d958269ec943aa8af87b603ab",
"assets/AssetManifest.bin": "94c031f50f978aa8526d2f6dcba6e905",
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
"flutter_bootstrap.js": "6f7563e5ffebdbf0ccb8cb5cb8f951ea",
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
