//
//  MPAdInfo.m
//  MoPub
//
//  Copyright (c) 2013 MoPub. All rights reserved.
//

#import "MPAdInfo.h"

#import <Foundation/Foundation.h>

NSString * const kAdInfoIdKey = @"adUnitId";
NSString * const kAdInfoFormatKey = @"format";
NSString * const kAdInfoKeywordsKey = @"keywords";
NSString * const kAdInfoNameKey = @"name";

@implementation MPAdInfo

+ (NSDictionary *)supportedAddedAdTypes
{
    static NSDictionary *adTypes = nil;

    static dispatch_once_t once;
    dispatch_once(&once, ^{
        adTypes = @{@"Banner":@(MPAdInfoBanner), @"Interstitial":@(MPAdInfoInterstitial), @"MRect":@(MPAdInfoMRectBanner), @"Leaderboard":@(MPAdInfoLeaderboardBanner), @"Native":@(MPAdInfoNative), @"Rewarded Video":@(MPAdInfoRewardedVideo), @"Rewarded":@(MPAdInfoRewardedVideo), @"NativeTablePlacer":@(MPAdInfoNativeTableViewPlacer), @"NativeCollectionPlacer":@(MPAdInfoNativeInCollectionView)};
    });

    return adTypes;
}

+ (NSArray *)bannerAds
{
    NSMutableArray *ads = [NSMutableArray array];

    [ads addObjectsFromArray:@[
                               [MPAdInfo infoWithTitle:@"HTML Banner Ad" ID:@"1b9d7719372845a88cddfe005e8cf401" type:MPAdInfoBanner],
                               [MPAdInfo infoWithTitle:@"MRAID Banner Ad" ID:@"ad7cbf0ade734102b94b95ca66c2a8be" type:MPAdInfoBanner],
                               [MPAdInfo infoWithTitle:@"HTML MRECT Banner Ad" ID:@"67e13661e78b4e42bad7cdceee991431" type:MPAdInfoMRectBanner],
                               ]];

    if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
    {
        [ads addObject:[MPAdInfo infoWithTitle:@"HTML Leaderboard Banner Ad" ID:@"d456ea115eec497ab33e02531a5efcbc" type:MPAdInfoLeaderboardBanner]];
    }

    // 3rd Party Networks
#if CUSTOM_EVENTS_ENABLED
    [ads addObject:[MPAdInfo infoWithTitle:@"Facebook" ID:@"0575b051596745b6a0909fe741f6aac7" type:MPAdInfoBanner]];
    [ads addObject:[MPAdInfo infoWithTitle:@"FM" ID:@"1b9d7719372845a88cddfe005e8cf401" type:MPAdInfoBanner]];
    [ads addObject:[MPAdInfo infoWithTitle:@"Flurry" ID:@"e7a676eb58b44f8695a5c5f133568c67" type:MPAdInfoBanner]];
    [ads addObject:[MPAdInfo infoWithTitle:@"Google AdMob" ID:@"c9c2ea9a8e1249b68496978b072d2fd2" type:MPAdInfoBanner]];
    [ads addObject:[MPAdInfo infoWithTitle:@"Millennial" ID:@"b506db1f3e054c78bff513f188727748" type:MPAdInfoBanner]];
    [ads addObject:[MPAdInfo infoWithTitle:@"Applovin" ID:@"1e3442763b3b498692fc8d817f23df61" type:MPAdInfoBanner]];

#endif

    return ads;
}

+ (NSArray *)interstitialAds
{
    return @[
             [MPAdInfo infoWithTitle:@"HTML Interstitial Ad" ID:@"5871797d4004456eb6be0d0299de80c5" type:MPAdInfoInterstitial],
             [MPAdInfo infoWithTitle:@"HTML Interstitial Ad" ID:@"19aa9fceec43455bb58f0842cf4b34cb" type:MPAdInfoInterstitial],
             [MPAdInfo infoWithTitle:@"MRAID Interstitial Ad" ID:@"b9aac532c70c49ea833bcc83979bd1ca" type:MPAdInfoInterstitial],
             [MPAdInfo infoWithTitle:@"MRAID Interstitial Ad" ID:@"cd54433a2dc34a3187d44a3c50fcf8d4" type:MPAdInfoInterstitial],
             [MPAdInfo infoWithTitle:@"MRAID Interstitial Ad" ID:@"2d3948d91a5d49d4b41b116071dc2089" type:MPAdInfoInterstitial],

    // 3rd Party Networks
    #if CUSTOM_EVENTS_ENABLED
             [MPAdInfo infoWithTitle:@"Chartboost" ID:@"a5506212ea404a64b2ce9bcf68d242fc" type:MPAdInfoInterstitial],
             [MPAdInfo infoWithTitle:@"Facebook" ID:@"d439571168f64021aeb50ba53d83ad8c" type:MPAdInfoInterstitial],
             [MPAdInfo infoWithTitle:@"Flurry" ID:@"49960150e2874e9294105af00a77b85c" type:MPAdInfoInterstitial],
             [MPAdInfo infoWithTitle:@"AdColony" ID:@"f274abbd278e481e8513abfa6a8affc1" type:MPAdInfoInterstitial],
             [MPAdInfo infoWithTitle:@"Google AdMob" ID:@"4a488029dafb423790423370dc5835c0" type:MPAdInfoInterstitial],
             [MPAdInfo infoWithTitle:@"Millennial" ID:@"93c3fc00fbb54825b6a33b20927315f7" type:MPAdInfoInterstitial],
             [MPAdInfo infoWithTitle:@"Tapjoy" ID:@"83b8ccba00de4d27a2b6d97a3a0d80ce" type:MPAdInfoInterstitial],
             [MPAdInfo infoWithTitle:@"Vungle" ID:@"62b74f131ddc49c0bd8b22cf6e8a0411" type:MPAdInfoInterstitial],
              [MPAdInfo infoWithTitle:@"Iron Source" ID:@"5871797d4004456eb6be0d0299de80c5" type:MPAdInfoInterstitial],
             [MPAdInfo infoWithTitle:@"Applovin" ID:@"a6ba011d4ac9421c97606757b8f4f619" type:MPAdInfoInterstitial],
    #endif
             ];
}

+ (NSArray *)rewardedVideoAds
{
    return @[
             [MPAdInfo infoWithTitle:@"Rewarded Video Ad" ID:@"8f000bd5e00246de9c789eed39ff6096" type:MPAdInfoRewardedVideo],
             [MPAdInfo infoWithTitle:@"Rewarded Rich Media Ad" ID:@"04643c2b6466418f9b535b420bf498af" type:MPAdInfoRewardedVideo],
    // 3rd Party Networks
    #if CUSTOM_EVENTS_ENABLED
             [MPAdInfo infoWithTitle:@"AdColony" ID:@"5fc475d65f014130acb556634b4af4cc" type:MPAdInfoRewardedVideo],
             [MPAdInfo infoWithTitle:@"AdMob" ID:@"0ceacb73895748ceadf0048a1f989855" type:MPAdInfoRewardedVideo],
             [MPAdInfo infoWithTitle:@"Chartboost" ID:@"7a79da4d6a644004956a26d6d0f16502" type:MPAdInfoRewardedVideo],
             [MPAdInfo infoWithTitle:@"Facebook" ID:@"9204bbf695b24f26a9a8b7066e712c10" type:MPAdInfoRewardedVideo],
             [MPAdInfo infoWithTitle:@"Millennial" ID:@"1908cd1ff0934f69bac04c316accc854" type:MPAdInfoRewardedVideo],
             [MPAdInfo infoWithTitle:@"Tapjoy" ID:@"db8b4f8134664c4d91d3196a53c5aad9" type:MPAdInfoRewardedVideo],
             [MPAdInfo infoWithTitle:@"Unity Ads" ID:@"21df32a2c53249a4ba23f9aba80c3cd0" type:MPAdInfoRewardedVideo],
             [MPAdInfo infoWithTitle:@"Vungle" ID:@"39f2a3f82f834d3fba1819d8b22f49cc" type:MPAdInfoRewardedVideo],
             [MPAdInfo infoWithTitle:@"Iron Source" ID:@"06f61404cf0046b8a3ca0802946818a0" type:MPAdInfoRewardedVideo],
             [MPAdInfo infoWithTitle:@"Applovin" ID:@"86edb2116ff24fc680697ac105b863b3" type:MPAdInfoRewardedVideo],
              [MPAdInfo infoWithTitle:@"Flurry" ID:@"49960150e2874e9294105af00a77b85c" type:MPAdInfoRewardedVideo],
             
             //unity -676a0fa97aca48cbbe489de5b2fa4cd1
    #endif
             ];
}

+ (NSArray *)nativeAds
{
    return @[
             [MPAdInfo infoWithTitle:@"Native Ad" ID:@"57fd53ccacbf4e49a91b4f2cde681923" type:MPAdInfoNative],
             [MPAdInfo infoWithTitle:@"Native Video Ad" ID:@"f76cd684a70e4a70bc4040d57ef41518" type:MPAdInfoNative],
             [MPAdInfo infoWithTitle:@"Native Ad (CollectionView Placer)" ID:@"5f1f7a540671408c954eb8f0beefd239" type:MPAdInfoNativeInCollectionView],
             [MPAdInfo infoWithTitle:@"Native Ad (TableView Placer)" ID:@"5f1f7a540671408c954eb8f0beefd239" type:MPAdInfoNativeTableViewPlacer],
             [MPAdInfo infoWithTitle:@"Native Video Ad (TableView Placer)" ID:@"b2b67c2a8c0944eda272ed8e4ddf7ed4" type:MPAdInfoNativeTableViewPlacer],

    // 3rd Party Networks
    #if CUSTOM_EVENTS_ENABLED
             [MPAdInfo infoWithTitle:@"Facebook AN" ID:@"5f1f7a540671408c954eb8f0beefd239" type:MPAdInfoNative],
             [MPAdInfo infoWithTitle:@"Facebook AN(TableView Placer)" ID:@"5f1f7a540671408c954eb8f0beefd239" type:MPAdInfoNativeTableViewPlacer],
             [MPAdInfo infoWithTitle:@"Google" ID:@"e1598f16673a409e95c66e79ba592aeb" type:MPAdInfoNative],
             [MPAdInfo infoWithTitle:@"Google(TableView Placer)" ID:@"e1598f16673a409e95c66e79ba592aeb" type:MPAdInfoNativeTableViewPlacer],
             [MPAdInfo infoWithTitle:@"Flurry" ID:@"1023187dc1984ec28948b49220e1e3d4" type:MPAdInfoNative],
             [MPAdInfo infoWithTitle:@"Flurry(TableView Placer)" ID:@"1023187dc1984ec28948b49220e1e3d4" type:MPAdInfoNativeTableViewPlacer],
             [MPAdInfo infoWithTitle:@"Applovin" ID:@"1869cff565cd4717a68ef52f1c5aa346" type:MPAdInfoNative],
              [MPAdInfo infoWithTitle:@"Applovin(TableView Placer)" ID:@"1869cff565cd4717a68ef52f1c5aa346" type:MPAdInfoNativeTableViewPlacer],
             [MPAdInfo infoWithTitle:@"Millennial Media" ID:@"69b2d2cfda6a4d07aefa1847066c89ab" type:MPAdInfoNative],
             [MPAdInfo infoWithTitle:@"Millennial Media(TableView Placer)" ID:@"69b2d2cfda6a4d07aefa1847066c89ab" type:MPAdInfoNativeTableViewPlacer],
    #endif
             ];
}

+ (MPAdInfo *)infoWithTitle:(NSString *)title ID:(NSString *)ID type:(MPAdInfoType)type {
    MPAdInfo *info = [[MPAdInfo alloc] init];
    info.title = title;
    info.ID = ID;
    info.type = type;
    return info;
}

+ (MPAdInfo *)infoWithDictionary:(NSDictionary *)dict
{
    // Extract the required fields from the dictionary. If either of the required fields
    // is invalid, object creation will not be performed.
    NSString * adUnitId = [[dict objectForKey:kAdInfoIdKey] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString * formatString = [[dict objectForKey:kAdInfoFormatKey] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString * keywords = [[dict objectForKey:kAdInfoKeywordsKey] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString * name = [[dict objectForKey:kAdInfoNameKey] stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];

    if (adUnitId.length == 0 || formatString.length == 0 || (formatString != nil && [[self supportedAddedAdTypes] objectForKey:formatString] == nil)) {
        return nil;
    }

    MPAdInfoType format = (MPAdInfoType)[[[self supportedAddedAdTypes] objectForKey:formatString] integerValue];
    NSString * title = (name != nil ? name : adUnitId);
    MPAdInfo * info = [MPAdInfo infoWithTitle:title ID:adUnitId type:format];
    info.keywords = keywords;

    return info;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    if(self != nil)
    {
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.ID = [aDecoder decodeObjectForKey:@"ID"];
        self.type = [aDecoder decodeIntegerForKey:@"type"];
        self.keywords = [aDecoder decodeObjectForKey:@"keywords"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.ID forKey:@"ID"];
    [aCoder encodeInteger:self.type forKey:@"type"];
    [aCoder encodeObject:((self.keywords != nil) ? self.keywords : @"") forKey:@"keywords"];
}

@end
