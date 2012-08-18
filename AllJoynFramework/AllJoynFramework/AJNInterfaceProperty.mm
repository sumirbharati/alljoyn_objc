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

#import <alljoyn/InterfaceDescription.h>
#import "AJNInterfaceProperty.h"

@implementation AJNInterfaceProperty

/**
 * Helper to return the C++ API object that is encapsulated by this objective-c class
 */
- (ajn::InterfaceDescription::Property*)property
{
    return static_cast<ajn::InterfaceDescription::Property*>(self.handle);
}

- (NSString*)name
{
    return [NSString stringWithCString:self.property->name.c_str() encoding:NSUTF8StringEncoding];
}

- (NSString*)signature
{
    return [NSString stringWithCString:self.property->signature.c_str() encoding:NSUTF8StringEncoding];
}

- (AJNInterfacePropertyAccessPermissionsFlags)accessPermissions
{
    return self.property->access;
}

- (NSString *)annotationWithName:(NSString *)annotationName
{
    return [NSString stringWithCString:self.property->annotations[[annotationName UTF8String]].c_str() encoding:NSUTF8StringEncoding];
}

- (void)addAnnotationWithName:(NSString *)annotationName value:(NSString *)value
{
    self.property->annotations.insert(std::make_pair([annotationName UTF8String], [value UTF8String]));
}


@end
