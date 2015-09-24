# -*- coding: utf-8 -*-
#
# (C) 2001-2012 Marmalade. All Rights Reserved.
#
# This document is protected by copyright, and contains information
# proprietary to Marmalade.
#
# This file consists of source code released by Marmalade under
# the terms of the accompanying End User License Agreement (EULA).
# Please do not use this program/source code before you have read the
# EULA and have agreed to be bound by its terms.
#
import deploy_config

config = deploy_config.config
cmdline = deploy_config.cmdline
mkb = deploy_config.mkb
mkf = deploy_config.mkf

assets = deploy_config.assets

class HubConfig(deploy_config.DefaultConfig):
    android_icon_group = {}
    android_external_res = [ur"/Users/carlossebastianloredogomez/survive/../../../../Applications/Marmalade.app/Contents/platform_libs/android/marmalade-facebook-android-sdk/third_party/facebook/res", ur"/Users/carlossebastianloredogomez/survive/../../../../Applications/Marmalade.app/Contents/extensions/s3eAndroidGooglePlayBilling/source/android/res", ur"/Users/carlossebastianloredogomez/survive/../../../../Applications/Marmalade.app/Contents/extensions/s3eSamsungInAppPurchasing/source/android/res"]
    android_install_location = 1
    android_pkgname = r"com.carlossebastianloredogomez.JUANPI"
    assets = assets["Default"]
    config = [ur"/Users/carlossebastianloredogomez/survive/resources/common.icf", ur"/Users/carlossebastianloredogomez/survive/resources/app.icf"]
    name = ur"""JUANPI"""
    caption = ur"""JUANPI"""
    provider = ur"""carlossebastianloredogomez"""
    copyright = ur"""(C) carlossebastianloredogomez"""
    version = [0, 0, 1]
    android_extra_manifest = [ur"/Users/carlossebastianloredogomez/survive/../../../../Applications/Marmalade.app/Contents/extensions/s3eAndroidGooglePlayBilling/source/android/ExtraManifests.xml", ur"/Users/carlossebastianloredogomez/survive/../../../../Applications/Marmalade.app/Contents/extensions/s3eSamsungInAppPurchasing/source/android/ExtraManifests.xml"]
    android_extra_application_manifest = [ur"/Users/carlossebastianloredogomez/survive/../../../../Applications/Marmalade.app/Contents/extensions/s3eAmazonAds/source/android/ExtraAppManifests.xml", ur"/Users/carlossebastianloredogomez/survive/../../../../Applications/Marmalade.app/Contents/extensions/s3eFacebook/source/android/extra_app_manifest.xml", ur"/Users/carlossebastianloredogomez/survive/../../../../Applications/Marmalade.app/Contents/extensions/s3eAmazonInAppPurchasing/source/android/AmazonInAppPurchasingManifestSnippet.xml", ur"/Users/carlossebastianloredogomez/survive/../../../../Applications/Marmalade.app/Contents/extensions/s3eAndroidMarketBilling/s3eAndroidMarketBillingManifest.xml", ur"/Users/carlossebastianloredogomez/survive/../../../../Applications/Marmalade.app/Contents/extensions/s3eAndroidGooglePlayBilling/source/android/ExtraAppManifests.xml", ur"/Users/carlossebastianloredogomez/survive/../../../../Applications/Marmalade.app/Contents/extensions/s3eSamsungInAppPurchasing/source/android/ExtraAppManifests.xml"]
    android_sdk_build_tools_version = r"21.1.1"
    android_sdk_platform_version = r"21"
    pass

default = HubConfig()
