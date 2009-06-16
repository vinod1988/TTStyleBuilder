//
//  TTPropertyField.m
//  TTStyleBuilder
//
//  Created by Keith Lazuka on 6/15/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PropertyField.h"


@implementation PropertyField

@synthesize object;
@synthesize propertyName;
@synthesize propertyType;

- (id)initWithObject:(id)anObject property:(objc_property_t)aProperty url:(NSString *)url
{
    NSString *propName = [NSString stringWithCString:property_getName(aProperty) encoding:NSUTF8StringEncoding];
    if (self = [self initWithText:propName url:url]) {
        object = [anObject retain];
        propertyName = [propName retain];
        propertyType = [[NSString alloc] initWithCString:property_getAttributes(aProperty) encoding:NSUTF8StringEncoding];
    }
    return self;
}

- (NSString *)valueDescription
{
    return [[object valueForKey:propertyName] description];
}

- (void)dealloc
{
    [object release];
    [propertyName release];
    [propertyType release];
    [super dealloc];
}


@end