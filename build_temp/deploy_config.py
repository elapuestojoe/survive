# -*- coding: utf-8 -*-
# Deployment settings for /Applications/Marmalade.app/Contents/quick/target/osx/quick_prebuilt.
# This file is autogenerated by the mkb system and used by the s3e deployment
# tool during the build process.

config = {}
cmdline = ['/Applications/Marmalade.app/Contents/s3e/makefile_builder/mkb.py', '/Users/kevinislasabud/Documents/survive/JUANPI.mkb', '--deploy-only', '--hub-data', '/Users/kevinislasabud/Documents/survive/project_JUANPI/mkb-quick.txt', '--buildenv=QUICK', '--use-prebuilt']
mkb = '/Users/kevinislasabud/Documents/survive/JUANPI.mkb'
mkf = ['/Applications/Marmalade.app/Contents/s3e/s3e-default.mkf', '/Applications/Marmalade.app/Contents/extensions/s3eAmazonAds/s3eAmazonAds.mkf', '/Applications/Marmalade.app/Contents/modules/iwutil/iwutil.mkf', '/Applications/Marmalade.app/Contents/modules/third_party/libjpeg/libjpeg.mkf', '/Applications/Marmalade.app/Contents/modules/third_party/libpng/libpng.mkf', '/Applications/Marmalade.app/Contents/modules/third_party/zlib/zlib.mkf', '/Applications/Marmalade.app/Contents/platform_libs/android/amazon-ads-android-sdk/amazon-ads-android-sdk.mkf', '/Applications/Marmalade.app/Contents/platform_libs/iphone/amazon-ads-ios-sdk/amazon-ads-ios-sdk.mkf', '/Applications/Marmalade.app/Contents/quick/quick_prebuilt.mkf', '/Applications/Marmalade.app/Contents/extensions/s3eFacebook/s3eFacebook.mkf', '/Applications/Marmalade.app/Contents/platform_libs/android/marmalade-facebook-android-sdk/marmalade-facebook-android-sdk.mkf', '/Applications/Marmalade.app/Contents/platform_libs/android/android-support-v4/android-support-v4.mkf', '/Applications/Marmalade.app/Contents/platform_libs/android/bolts-android/bolts-android.mkf', '/Applications/Marmalade.app/Contents/platform_libs/iphone/marmalade-facebook-iphone-sdk/marmalade-facebook-iphone-sdk.mkf', '/Applications/Marmalade.app/Contents/extensions/s3eWebView/s3eWebView.mkf', '/Applications/Marmalade.app/Contents/modules/iwbilling/iwbilling.mkf', '/Applications/Marmalade.app/Contents/extensions/s3eBBAppWorldBilling/s3eBBAppWorldBilling.mkf', '/Applications/Marmalade.app/Contents/extensions/s3eIOSAppStoreBilling/s3eIOSAppStoreBilling.mkf', '/Applications/Marmalade.app/Contents/extensions/s3eWindowsStoreBilling/s3eWindowsStoreBilling.mkf', '/Applications/Marmalade.app/Contents/extensions/s3eAmazonInAppPurchasing/s3eAmazonInAppPurchasing.mkf', '/Applications/Marmalade.app/Contents/extensions/s3eAndroidMarketBilling/s3eAndroidMarketBilling.mkf', '/Applications/Marmalade.app/Contents/extensions/s3eAndroidGooglePlayBilling/s3eAndroidGooglePlayBilling.mkf', '/Applications/Marmalade.app/Contents/extensions/s3eSamsungInAppPurchasing/s3eSamsungInAppPurchasing.mkf', '/Applications/Marmalade.app/Contents/extensions/s3eFlurry/s3eFlurry.mkf', '/Applications/Marmalade.app/Contents/quick/quick_prebuilt_options.mkf']

class DeployConfig(object):
    pass

######### ASSET GROUPS #############

assets = {}

assets['Default'] = [
    ('/Applications/Marmalade.app/Contents/extensions/s3eWebView/s3eWebView.js', 's3eWebView.js', 0),
    ('/Users/kevinislasabud/Documents/survive/resources', '.', 0),
]

assets['shared'] = [
    ('/Users/kevinislasabud/Documents/survive/resources/quicklua/dbg.lua', 'quicklua/dbg.lua', 0),
    ('/Users/kevinislasabud/Documents/survive/resources/quicklua/openquick.lua', 'quicklua/openquick.lua', 0),
    ('/Users/kevinislasabud/Documents/survive/resources/quicklua/QConfig.lua', 'quicklua/QConfig.lua', 0),
    ('/Users/kevinislasabud/Documents/survive/resources/config.lua', 'config.lua', 0),
    ('/Users/kevinislasabud/Documents/survive/resources/fonts', 'fonts', 0),
]

assets['precompiledLua'] = [
    ('/Users/kevinislasabud/Documents/survive/resources/quicklua/dbg.lua', 'quicklua/dbg.lua', 0),
    ('/Users/kevinislasabud/Documents/survive/resources/quicklua/openquick.lua', 'quicklua/openquick.lua', 0),
    ('/Users/kevinislasabud/Documents/survive/resources/quicklua/QConfig.lua', 'quicklua/QConfig.lua', 0),
    ('/Users/kevinislasabud/Documents/survive/resources/config.lua', 'config.lua', 0),
    ('/Users/kevinislasabud/Documents/survive/resources/fonts', 'fonts', 0),
    ('/Users/kevinislasabud/Documents/survive/resources-precompiled', '.', 0),
]

assets['optimisedLua'] = [
    ('/Users/kevinislasabud/Documents/survive/resources/quicklua/dbg.lua', 'quicklua/dbg.lua', 0),
    ('/Users/kevinislasabud/Documents/survive/resources/quicklua/openquick.lua', 'quicklua/openquick.lua', 0),
    ('/Users/kevinislasabud/Documents/survive/resources/quicklua/QConfig.lua', 'quicklua/QConfig.lua', 0),
    ('/Users/kevinislasabud/Documents/survive/resources/config.lua', 'config.lua', 0),
    ('/Users/kevinislasabud/Documents/survive/resources/fonts', 'fonts', 0),
    ('/Users/kevinislasabud/Documents/survive/resources-concatenated', '.', 0),
]

######### DEFAULT CONFIG #############

class DefaultConfig(DeployConfig):
    embed_icf = -1
    name = 'JUANPI'
    pub_sign_key = 0
    priv_sign_key = 0
    caption = 'JUANPI'
    long_caption = 'JUANPI'
    version = [0, 0, 1]
    config = ['/Users/kevinislasabud/Documents/survive/resources/common.icf', '/Users/kevinislasabud/Documents/survive/resources/app.icf']
    data_dir = '/Users/kevinislasabud/Documents/survive/resources'
    mkb_dir = '/Users/kevinislasabud/Documents/survive'
    iphone_link_lib = ['s3eAmazonAds', 's3eFacebook', 's3eWebView', 's3eIOSAppStoreBilling', 'FlurryAnalytics', 's3eFlurry']
    osx_ext_dll = ['/Applications/Marmalade.app/Contents/extensions/s3eWebView/lib/osx/libs3eWebView.dylib', '/Applications/Marmalade.app/Contents/extensions/s3eFlurry/lib/osx/libs3eFlurry.dylib']
    wp81_extra_pri = []
    ws8_ext_capabilities = []
    ws8_ext_native_only_dll = []
    ws81_ext_native_only_dll = []
    android_external_res = ['/Applications/Marmalade.app/Contents/platform_libs/android/marmalade-facebook-android-sdk/third_party/facebook/res', '/Applications/Marmalade.app/Contents/extensions/s3eAndroidGooglePlayBilling/source/android/res', '/Applications/Marmalade.app/Contents/extensions/s3eSamsungInAppPurchasing/source/android/res']
    win32_ext_dll = ['/Applications/Marmalade.app/Contents/extensions/s3eWebView/lib/win32/s3eWebView.dll', '/Applications/Marmalade.app/Contents/extensions/s3eFlurry/lib/win32/s3eFlurry.dll']
    wp8_ext_capabilities = []
    ws8_extra_res = ['/Applications/Marmalade.app/Contents/extensions/s3eFacebook/third-party/facebook_ws8_lib/Facebook_Client']
    ws81_ext_managed_dll = ['/Applications/Marmalade.app/Contents/extensions/s3eFacebook/lib/ws81/s3eFacebookManaged.winmd', '/Applications/Marmalade.app/Contents/extensions/s3eFacebook/third-party/facebook_ws81_lib/Facebook.Client.dll', '/Applications/Marmalade.app/Contents/extensions/s3eFacebook/third-party/facebook_ws8_lib/Facebook.dll', '/Applications/Marmalade.app/Contents/extensions/s3eWebView/lib/ws81/s3eWebViewManaged.winmd']
    iphone_link_libdir = ['/Applications/Marmalade.app/Contents/extensions/s3eAmazonAds/lib/iphone', '/Applications/Marmalade.app/Contents/extensions/s3eFacebook/lib/iphone', '/Applications/Marmalade.app/Contents/extensions/s3eWebView/lib/iphone', '/Applications/Marmalade.app/Contents/extensions/s3eIOSAppStoreBilling/lib/iphone', '/Applications/Marmalade.app/Contents/extensions/s3eFlurry/lib/iphone']
    android_extra_application_manifest = ['/Applications/Marmalade.app/Contents/extensions/s3eAmazonAds/source/android/ExtraAppManifests.xml', '/Applications/Marmalade.app/Contents/extensions/s3eFacebook/source/android/extra_app_manifest.xml', '/Applications/Marmalade.app/Contents/extensions/s3eAmazonInAppPurchasing/source/android/AmazonInAppPurchasingManifestSnippet.xml', '/Applications/Marmalade.app/Contents/extensions/s3eAndroidMarketBilling/s3eAndroidMarketBillingManifest.xml', '/Applications/Marmalade.app/Contents/extensions/s3eAndroidGooglePlayBilling/source/android/ExtraAppManifests.xml', '/Applications/Marmalade.app/Contents/extensions/s3eSamsungInAppPurchasing/source/android/ExtraAppManifests.xml']
    ws8_ext_native_dll = ['/Applications/Marmalade.app/Contents/extensions/s3eFacebook/lib/ws8/s3eFacebookExtension.dll', '/Applications/Marmalade.app/Contents/extensions/s3eWebView/lib/ws8/s3eWebViewExtension.dll']
    android_external_assets = []
    blackberry_extra_descriptor = []
    android_ext_target_sdk_version = [17]
    android_extra_manifest = ['/Applications/Marmalade.app/Contents/extensions/s3eAndroidGooglePlayBilling/source/android/ExtraManifests.xml', '/Applications/Marmalade.app/Contents/extensions/s3eSamsungInAppPurchasing/source/android/ExtraManifests.xml']
    wp81_ext_sdk_ref = []
    iphone_link_libdirs = []
    wp81_ext_device_capabilities = []
    linux_ext_lib = []
    android_ext_min_sdk_version = [4, 9, 9]
    wp81_ext_native_only_dll = []
    ws8_ext_managed_dll = ['/Applications/Marmalade.app/Contents/extensions/s3eFacebook/lib/ws8/s3eFacebookManaged.winmd', '/Applications/Marmalade.app/Contents/extensions/s3eFacebook/third-party/facebook_ws8_lib/Facebook.Client.dll', '/Applications/Marmalade.app/Contents/extensions/s3eFacebook/third-party/facebook_ws8_lib/Facebook.dll', '/Applications/Marmalade.app/Contents/extensions/s3eWebView/lib/ws8/s3eWebViewManaged.winmd']
    ws8_ext_sdk_manifest_part = []
    ws8_ext_device_capabilities = []
    ws81_extra_pri = []
    android_external_jars = ['/Applications/Marmalade.app/Contents/platform_libs/android/amazon-ads-android-sdk/third_party/lib/amazon-ads-5.4.235.jar', '/Applications/Marmalade.app/Contents/extensions/s3eAmazonAds/lib/android/s3eAmazonAds.jar', '/Applications/Marmalade.app/Contents/platform_libs/android/android-support-v4/android-support-v4.jar', '/Applications/Marmalade.app/Contents/platform_libs/android/bolts-android/bolts-android-1.1.2.jar', '/Applications/Marmalade.app/Contents/platform_libs/android/marmalade-facebook-android-sdk/lib/android/marmalade-facebook-android-sdk-3.22.0.jar', '/Applications/Marmalade.app/Contents/extensions/s3eFacebook/lib/android/s3eFacebook.jar', '/Applications/Marmalade.app/Contents/extensions/s3eWebView/lib/android/s3eWebView.jar', '/Applications/Marmalade.app/Contents/extensions/s3eAmazonInAppPurchasing/lib/android/s3eAmazonInAppPurchasing.jar', '/Applications/Marmalade.app/Contents/extensions/s3eAmazonInAppPurchasing/lib/android/in-app-purchasing-1.0.3.jar', '/Applications/Marmalade.app/Contents/extensions/s3eAndroidMarketBilling/lib/android/s3eAndroidMarketBilling.jar', '/Applications/Marmalade.app/Contents/extensions/s3eAndroidGooglePlayBilling/lib/android/s3eAndroidGooglePlayBilling.jar', '/Applications/Marmalade.app/Contents/extensions/s3eSamsungInAppPurchasing/lib/android/s3eSamsungInAppPurchasing.jar', '/Applications/Marmalade.app/Contents/extensions/s3eSamsungInAppPurchasing/lib/android/iap2.0_lib.jar', '/Applications/Marmalade.app/Contents/extensions/s3eFlurry/lib/android/s3eFlurry.jar', '/Applications/Marmalade.app/Contents/extensions/s3eFlurry/lib/android/FlurryAgent.jar']
    win8_winrt_extra_res = ['/Applications/Marmalade.app/Contents/extensions/s3eWebView/source/ws8/WebViewModal.xaml=>']
    wp81_ext_sdk_manifest_part = []
    android_supports_gl_texture = []
    wp81_extra_res = ['/Applications/Marmalade.app/Contents/extensions/s3eFacebook/third-party/facebook_wp81_lib/Facebook.Client']
    wp81_ext_managed_dll = ['/Applications/Marmalade.app/Contents/extensions/s3eFacebook/lib/wp81/s3eFacebookManaged.winmd', '/Applications/Marmalade.app/Contents/extensions/s3eFacebook/third-party/facebook_wp81_lib/Facebook.Client.dll', '/Applications/Marmalade.app/Contents/extensions/s3eFacebook/third-party/facebook_ws81_lib/Facebook.dll', '/Applications/Marmalade.app/Contents/extensions/s3eWebView/lib/wp81/s3eWebViewManaged.winmd']
    wp81_ext_capabilities = []
    iphone_extra_plist = []
    ws81_ext_sdk_manifest_part = []
    ws81_ext_device_capabilities = []
    ws8_ext_sdk_ref = []
    iphone_extra_string = []
    tizen_so = []
    wp8_ext_native_dll = ['/Applications/Marmalade.app/Contents/extensions/s3eFacebook/lib/wp8/s3eFacebookExtension.dll', '/Applications/Marmalade.app/Contents/extensions/s3eWebView/lib/wp8/s3eWebViewExtension.dll', '/Applications/Marmalade.app/Contents/extensions/s3eFlurry/lib/wp8/s3eFlurryExtension.dll']
    win8_phone_extra_res = []
    win32_aux_dll = ['/Applications/Marmalade.app/Contents/extensions/s3eWebView/lib/win32/icudt.dll', '/Applications/Marmalade.app/Contents/extensions/s3eWebView/lib/win32/libcef.dll', '/Applications/Marmalade.app/Contents/extensions/s3eWebView/lib/win32/avcodec-53.dll', '/Applications/Marmalade.app/Contents/extensions/s3eWebView/lib/win32/avformat-53.dll', '/Applications/Marmalade.app/Contents/extensions/s3eWebView/lib/win32/avutil-51.dll', '/Applications/Marmalade.app/Contents/extensions/s3eWebView/lib/win32/d3dcompiler_43.dll', '/Applications/Marmalade.app/Contents/extensions/s3eWebView/lib/win32/d3dx9_43.dll', '/Applications/Marmalade.app/Contents/extensions/s3eWebView/lib/win32/locales', '/Applications/Marmalade.app/Contents/extensions/s3eWebView/lib/win32/chrome.pak']
    win8_store_extra_res = ['/Applications/Marmalade.app/Contents/extensions/s3eFacebook/third-party/facebook_ws81_lib/Facebook.Client']
    iphone_link_opts = ['-F/Applications/Marmalade.app/Contents/platform_libs/iphone/amazon-ads-ios-sdk/third_party/Ads -framework AmazonAd', '-weak_framework AdSupport -weak_framework CoreLocation -weak_framework SystemConfiguration', '-weak_framework CoreTelephony -weak_framework MediaPlayer', '-weak_framework EventKit -weak_framework EventKitUI', '-F/Applications/Marmalade.app/Contents/platform_libs/iphone/marmalade-facebook-iphone-sdk -framework FBAudienceNetwork -framework FacebookSDK', '-weak_framework UIKit -weak_framework Foundation -weak_framework CoreGraphics -weak_framework Social', '-framework SystemConfiguration -framework Security']
    ws81_ext_sdk_ref = []
    wp8_extra_res = ['/Applications/Marmalade.app/Contents/extensions/s3eWebView/source/wp8/WebBrowserModal.xaml=>']
    ws81_ext_native_dll = ['/Applications/Marmalade.app/Contents/extensions/s3eFacebook/lib/ws81/s3eFacebookExtension.dll', '/Applications/Marmalade.app/Contents/extensions/s3eWebView/lib/ws81/s3eWebViewExtension.dll']
    ws8_extra_pri = []
    wp8_ext_managed_dll = ['/Applications/Marmalade.app/Contents/extensions/s3eFacebook/lib/wp8/s3eFacebookManaged.dll', '/Applications/Marmalade.app/Contents/extensions/s3eFacebook/third-party/facebook_wp8_lib/Facebook.Client.dll', '/Applications/Marmalade.app/Contents/extensions/s3eFacebook/third-party/facebook_wp8_lib/Facebook.dll', '/Applications/Marmalade.app/Contents/extensions/s3eFacebook/third-party/facebook_wp8_lib/System.Net.Http.dll', '/Applications/Marmalade.app/Contents/extensions/s3eWebView/lib/wp8/s3eWebViewManaged.dll', '/Applications/Marmalade.app/Contents/extensions/s3eFlurry/lib/wp8/FlurryWP8SDK.dll', '/Applications/Marmalade.app/Contents/extensions/s3eFlurry/lib/wp8/s3eFlurryManaged.dll']
    android_extra_packages = ['com.facebook.android']
    android_so = ['/Applications/Marmalade.app/Contents/extensions/s3eAmazonAds/lib/android/libs3eAmazonAds.so', '/Applications/Marmalade.app/Contents/extensions/s3eFacebook/lib/android/libs3eFacebook.so', '/Applications/Marmalade.app/Contents/extensions/s3eWebView/lib/android/libs3eWebView.so', '/Applications/Marmalade.app/Contents/extensions/s3eAmazonInAppPurchasing/lib/android/libs3eAmazonInAppPurchasing.so', '/Applications/Marmalade.app/Contents/extensions/s3eAndroidMarketBilling/lib/android/libs3eAndroidMarketBilling.so', '/Applications/Marmalade.app/Contents/extensions/s3eAndroidGooglePlayBilling/lib/android/libs3eAndroidGooglePlayBilling.so', '/Applications/Marmalade.app/Contents/extensions/s3eSamsungInAppPurchasing/lib/android/libs3eSamsungInAppPurchasing.so', '/Applications/Marmalade.app/Contents/extensions/s3eFlurry/lib/android/libs3eFlurry.so']
    wp8_ext_sdk_ref = []
    osx_extra_res = []
    ws81_extra_res = []
    wp81_ext_native_dll = ['/Applications/Marmalade.app/Contents/extensions/s3eFacebook/lib/wp81/s3eFacebookExtension.dll', '/Applications/Marmalade.app/Contents/extensions/s3eWebView/lib/wp81/s3eWebViewExtension.dll']
    ws81_ext_capabilities = []
    iphone_link_libs = []
    android_extra_strings = ['(facebook_app_id,FACEBOOK_APP_ID)', '(facebook_app_id,FACEBOOK_APP_ID)']
    target = {
         'mips' : {
                   'debug'   : r'/Applications/Marmalade.app/Contents/quick/target/android/mips/quick_prebuilt_d.so',
                   'release' : r'/Applications/Marmalade.app/Contents/quick/target/android/mips/quick_prebuilt.so',
                 },
         'gcc_x86' : {
                   'debug'   : r'/Applications/Marmalade.app/Contents/quick/target/notavailable/quick_prebuilt_d.so',
                   'release' : r'/Applications/Marmalade.app/Contents/quick/target/notavailable/quick_prebuilt.so',
                 },
         'gcc_x86_tizen' : {
                   'debug'   : r'/Applications/Marmalade.app/Contents/quick/target/tizen/x86/quick_prebuilt_d.s86',
                   'release' : r'/Applications/Marmalade.app/Contents/quick/target/tizen/x86/quick_prebuilt.s86',
                 },
         'firefoxos' : {
                   'debug'   : r'/Applications/Marmalade.app/Contents/quick/target/notavailable/quick_prebuilt_d.js',
                   'release' : r'/Applications/Marmalade.app/Contents/quick/target/notavailable/quick_prebuilt.js',
                 },
         'mips_gcc' : {
                   'debug'   : r'/Applications/Marmalade.app/Contents/quick/target/android/mips/quick_prebuilt_d.so',
                   'release' : r'/Applications/Marmalade.app/Contents/quick/target/android/mips/quick_prebuilt.so',
                 },
         'arm_gcc' : {
                   'debug'   : r'/Applications/Marmalade.app/Contents/quick/target/arm/quick_prebuilt_d.s3e',
                   'release' : r'/Applications/Marmalade.app/Contents/quick/target/arm/quick_prebuilt.s3e',
                 },
         'naclx86_64' : {
                   'debug'   : r'/Applications/Marmalade.app/Contents/quick/target/nacl/quick_prebuilt_d.so.s64',
                   'release' : r'/Applications/Marmalade.app/Contents/quick/target/nacl/quick_prebuilt.so.s64',
                 },
         'aarch64_gcc' : {
                   'debug'   : r'/Applications/Marmalade.app/Contents/quick/target/aarch64/quick_prebuilt_d.s3e',
                   'release' : r'/Applications/Marmalade.app/Contents/quick/target/aarch64/quick_prebuilt.s3e',
                 },
         'gcc_x86_android' : {
                   'debug'   : r'/Applications/Marmalade.app/Contents/quick/target/android/x86/quick_prebuilt_d.so',
                   'release' : r'/Applications/Marmalade.app/Contents/quick/target/android/x86/quick_prebuilt.so',
                 },
         'x86' : {
                   'debug'   : r'/Applications/Marmalade.app/Contents/quick/target/osx/quick_prebuilt_d.s86',
                   'release' : r'/Applications/Marmalade.app/Contents/quick/target/osx/quick_prebuilt.s86',
                 },
        }
    arm_arch = ''
    assets_original = assets
    assets = assets['Default']

default = DefaultConfig()
