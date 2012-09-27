////////////////////////////////////////////////////////////////////////////////
// Copyright 2012, Qualcomm Innovation Center, Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////////////////////
//
//  ALLJOYN MODELING TOOL - GENERATED CODE
//
////////////////////////////////////////////////////////////////////////////////
//
//  DO NOT EDIT
//
//  Add a category or subclass in separate .h/.m files to extend these classes
//
////////////////////////////////////////////////////////////////////////////////
//
//  AJNSampleObject.h
//
////////////////////////////////////////////////////////////////////////////////

#import <Foundation/Foundation.h>
#import "AJNBusAttachment.h"
#import "AJNBusInterface.h"
#import "AJNProxyBusObject.h"


////////////////////////////////////////////////////////////////////////////////
//
// SampleObjectDelegate Bus Interface
//
////////////////////////////////////////////////////////////////////////////////

@protocol SampleObjectDelegate <AJNBusInterface>


// methods
//
- (NSString*)concatenateString:(NSString*)str1 withString:(NSString*)str2;


@end

////////////////////////////////////////////////////////////////////////////////

    

////////////////////////////////////////////////////////////////////////////////
//
//  AJNSampleObject Bus Object superclass
//
////////////////////////////////////////////////////////////////////////////////

@interface AJNSampleObject : AJNBusObject<SampleObjectDelegate>

// properties
//


// methods
//
- (NSString*)concatenateString:(NSString*)str1 withString:(NSString*)str2;


// signals
//


@end

////////////////////////////////////////////////////////////////////////////////


////////////////////////////////////////////////////////////////////////////////
//
//  SampleObject Proxy
//
////////////////////////////////////////////////////////////////////////////////

@interface SampleObjectProxy : AJNProxyBusObject

// properties
//


// methods
//
- (NSString*)concatenateString:(NSString*)str1 withString:(NSString*)str2;


@end

////////////////////////////////////////////////////////////////////////////////