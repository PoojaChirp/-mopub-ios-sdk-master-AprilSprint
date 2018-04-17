//
//  MOPUBISAdapterIronSource.m
//

#import "IronSourceInterstitialCustomEvent.h"
#import "MPLogging.h"
#import "IronSourceConstants.h"

@interface IronSourceInterstitialCustomEvent()
@property (nonatomic, strong) NSString *placementName;
@property (nonatomic, strong) NSString *instanceId;
@property (nonatomic, assign) BOOL isTestEnabled;

@end

@implementation IronSourceInterstitialCustomEvent

static BOOL initInterstitialSuccessfully;

#pragma mark init dealloc Methods
- (instancetype)init {
    self = [super init];
    if (self) {
         MPLogInfo(@"is general init");
    }
    return self;
}

#pragma mark Mopub API

- (void)requestInterstitialWithCustomEventInfo:(NSDictionary *)info {
    [self onLog:@"requestInterstitialWithCustomEventInfo"];
    MPLogInfo(@"IronSource Interstital is requested");

    NSString *applicationKey = @"";
    _instanceId = @"0";
    
    if ([info objectForKey:kIronSourceAppKey] != nil){
        applicationKey = [info objectForKey:kIronSourceAppKey];
    }
    
    if ([info objectForKey:kIronSourceIsTestEnabled] != nil){
        _isTestEnabled = [[info objectForKey:kIronSourceIsTestEnabled] boolValue];
    }
    
    if ([info objectForKey:kIronSourceInstanceId] != nil){
        _instanceId = [info objectForKey:kIronSourceInstanceId];
    }
    
    if ([info objectForKey:kIronSourcePlacementName] != nil){
        _placementName = [info objectForKey:kIronSourcePlacementName];
    } else {
        _placementName = nil;
    }
    
    [self onLog:[NSString stringWithFormat:@"server params: %@", info.description]];

    if (![self isEmpty:applicationKey]) {
        [IronSource setISDemandOnlyInterstitialDelegate:self];
        [self initISIronSourceSDKWithAppKey:applicationKey];
        if (initInterstitialSuccessfully) {
            [self loadInterstitial];
        }
    } else {
        NSError *error = [self createErrorWith:@"IronSource Adapter failed to requestInterstitial"
                                     andReason:@"applicationKey parameter is missing"
                                 andSuggestion:@"make sure that 'applicationKey' server parameter is added"];
    
        [self.delegate interstitialCustomEvent:self didFailToLoadAdWithError:error];
    }
}

- (void)showInterstitialFromRootViewController:(UIViewController *)rootViewController {
    [self onLog:[NSString stringWithFormat:@"calling showInterstitialFromRootViewController for instance %@",_instanceId]];
    
    if (_placementName) {
        [IronSource showISDemandOnlyInterstitial:rootViewController placement:_placementName instanceId:_instanceId];
    } else {
        [IronSource showISDemandOnlyInterstitial:rootViewController instanceId:_instanceId];
    }
}

#pragma mark IronSource IS Methods

- (void)initISIronSourceSDKWithAppKey:(NSString *)appKey {
    
    if (!initInterstitialSuccessfully) {
        [self onLog:@"initISIronSourceSDKWithAppKey"];
        
        [IronSource setMediationType:kIronSourceMediationName];
        [IronSource initISDemandOnly:appKey adUnits:@[IS_INTERSTITIAL]];

        initInterstitialSuccessfully = YES;
    }
}

- (void)loadInterstitial {
    [self onLog:[NSString stringWithFormat:@"loadInterstitial for instance %@",_instanceId]];

    if([IronSource hasISDemandOnlyInterstitial:_instanceId]) {
        [self.delegate interstitialCustomEvent:self didLoadAd:self];
    } else {
        [IronSource loadISDemandOnlyInterstitial:_instanceId];
    }
}

#pragma mark Utiles Methods

- (void)onLog:(NSString *)log {
    if(_isTestEnabled) {
        NSLog(@"IronSourceInterstitialCustomEvent: %@" , log);
    }
}

- (NSError *)createErrorWith:(NSString *)description andReason:(NSString *)reaason andSuggestion:(NSString *)suggestion {
    NSDictionary *userInfo = @{
                               NSLocalizedDescriptionKey: NSLocalizedString(description, nil),
                               NSLocalizedFailureReasonErrorKey: NSLocalizedString(reaason, nil),
                               NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString(suggestion, nil)
                               };
    
    return [NSError errorWithDomain:NSStringFromClass([self class]) code:0 userInfo:userInfo];
}

- (BOOL)isEmpty:(id)value {
    return value == nil
        || [value isKindOfClass:[NSNull class]]
        || ([value respondsToSelector:@selector(length)] && [(NSString *)value length] == 0)
        || ([value respondsToSelector:@selector(length)] && [(NSData *)value length] == 0)
        || ([value respondsToSelector:@selector(count)] && [(NSArray *)value count] == 0);
}

#pragma mark IronSource DemandOnly Delegates implementation

/*!
 * @discussion Called each time an ad is available
 */
- (void)interstitialDidLoad:(NSString *)instanceId {
    [self onLog:[NSString stringWithFormat:@"interstitialDidLoad for instance %@",instanceId]];

    if(![_instanceId isEqualToString:instanceId])
        return;
    
    [self.delegate interstitialCustomEvent:self didLoadAd:nil];
}

/*!
 * @discussion Called each time an ad is not available
 */
- (void)interstitialDidFailToLoadWithError:(NSError *)error instanceId:(NSString *)instanceId {
    [self onLog:[NSString stringWithFormat:@"interstitialDidFailToLoadWithError: %@, instanceId: %@", error.localizedDescription, instanceId]];
    
    // Ignore callback
    if(![_instanceId isEqualToString:instanceId])
        return;
    
    if (!error) {
        error = [self createErrorWith:@"netowrk load error"
                            andReason:@"ironSource network failed to load"
                        andSuggestion:@"check that your network configuration are according to the documentation."];
    }
    
    [self.delegate interstitialCustomEvent:self didFailToLoadAdWithError:error];
}

/*!
 * @discussion Called each time the Interstitial window is about to open
 */
- (void)interstitialDidOpen:(NSString *)instanceId {
    [self onLog:[NSString stringWithFormat:@"interstitialDidOpen for instance %@",instanceId]];

    // Ignore callback
    if(![_instanceId isEqualToString:instanceId])
        return;
    
    [self.delegate interstitialCustomEventWillAppear:self];
}

/*!
 * @discussion Called each time the Interstitial window is about to close
 */
- (void)interstitialDidClose:(NSString *)instanceId {
    [self onLog:[NSString stringWithFormat:@"interstitialDidClose for instance %@",instanceId]];

    id<MPInterstitialCustomEventDelegate> strongDelegate = self.delegate;
    [strongDelegate interstitialCustomEventWillDisappear:self];
    [strongDelegate interstitialCustomEventDidDisappear:self];
}

/*!
 * @discussion Called each time the Interstitial window has opened successfully.
 */
- (void)interstitialDidShow:(NSString *)instanceId {
    [self onLog:[NSString stringWithFormat:@"interstitialDidShow for instance %@",instanceId]];

    [self.delegate interstitialCustomEventDidAppear:self];
}

/*!
 * @discussion Called if showing the Interstitial for the user has failed.
 *
 *              You can learn about the reason by examining the ‘error’ value
 */
- (void)interstitialDidFailToShowWithError:(NSError *)error instanceId:(NSString *)instanceId {
    [self onLog:[NSString stringWithFormat:@"interstitialDidFailToShowWithError for instance %@",instanceId]];

}

/*!
 * @discussion Called each time the end user has clicked on the Interstitial ad.
 */
- (void)didClickInterstitial:(NSString *)instanceId {
    [self onLog:[NSString stringWithFormat:@"didClickInterstitial for instance %@",instanceId]];

    id<MPInterstitialCustomEventDelegate> strongDelegate = self.delegate;
    [strongDelegate interstitialCustomEventDidReceiveTapEvent:self];
    [strongDelegate interstitialCustomEventWillLeaveApplication:self];
}

@end
