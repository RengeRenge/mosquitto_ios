#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "mosquitto_ios.h"
#import "config.h"
#import "mosquitto.h"

FOUNDATION_EXPORT double mosquitto_iosVersionNumber;
FOUNDATION_EXPORT const unsigned char mosquitto_iosVersionString[];

