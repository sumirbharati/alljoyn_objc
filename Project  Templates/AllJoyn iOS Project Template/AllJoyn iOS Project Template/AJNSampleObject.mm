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
//  AJNSampleObject.mm
//
////////////////////////////////////////////////////////////////////////////////

#import <alljoyn/BusAttachment.h>
#import <alljoyn/BusObject.h>
#import "AJNBusObjectImpl.h"
#import "AJNInterfaceDescription.h"
#import "AJNSignalHandlerImpl.h"

#import "SampleObject.h"

using namespace ajn;

////////////////////////////////////////////////////////////////////////////////
//
//  C++ Bus Object class declaration for SampleObjectImpl
//
////////////////////////////////////////////////////////////////////////////////
class SampleObjectImpl : public AJNBusObjectImpl
{
private:
    
    
public:
    SampleObjectImpl(BusAttachment &bus, const char *path, id<SampleObjectDelegate> aDelegate);

    
    
    // methods
    //
    void Concatentate(const InterfaceDescription::Member* member, Message& msg);

    
    // signals
    //
    
};
////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//
//  C++ Bus Object implementation for SampleObjectImpl
//
////////////////////////////////////////////////////////////////////////////////

SampleObjectImpl::SampleObjectImpl(BusAttachment &bus, const char *path, id<SampleObjectDelegate> aDelegate) : 
    AJNBusObjectImpl(bus,path,aDelegate)
{
    const InterfaceDescription* interfaceDescription = NULL;
    QStatus status = ER_OK;
    
    
    // Add the org.alljoyn.bus.sample interface to this object
    //
    interfaceDescription = bus.GetInterface([@"org.alljoyn.bus.sample" UTF8String]);
    assert(interfaceDescription);
    AddInterface(*interfaceDescription);

    
    // Register the method handlers for interface SampleObjectDelegate with the object
    //
    const MethodEntry methodEntriesForSampleObjectDelegate[] = {

        {
			interfaceDescription->GetMember("Concatentate"), static_cast<MessageReceiver::MethodHandler>(&SampleObjectImpl::Concatentate)
		}
    
    };
    
    status = AddMethodHandlers(methodEntriesForSampleObjectDelegate, sizeof(methodEntriesForSampleObjectDelegate) / sizeof(methodEntriesForSampleObjectDelegate[0]));
    if (ER_OK != status) {
        NSLog(@"ERROR: An error occurred while adding method handlers for interface org.alljoyn.bus.sample to the interface description. %@", [AJNStatus descriptionForStatusCode:status]);
    }
    

}


void SampleObjectImpl::Concatentate(const InterfaceDescription::Member *member, Message& msg)
{
    @autoreleasepool {
    
    
    
    
    // get all input arguments
    //
    
    qcc::String inArg0 = msg->GetArg(0)->v_string.str;
        
    qcc::String inArg1 = msg->GetArg(1)->v_string.str;
        
    // declare the output arguments
    //
    
	NSString* outArg0;

    
    // call the Objective-C delegate method
    //
    
	outArg0 = [(id<SampleObjectDelegate>)delegate concatenateString:[NSString stringWithCString:inArg0.c_str() encoding:NSUTF8StringEncoding] withString:[NSString stringWithCString:inArg1.c_str() encoding:NSUTF8StringEncoding]];
            
        
    // formulate the reply
    //
    MsgArg outArgs[1];
    
    outArgs[0].Set("s", [outArg0 UTF8String]);

    QStatus status = MethodReply(msg, outArgs, 1);
    if (ER_OK != status) {
        NSLog(@"ERROR: An error occurred when attempting to send a method reply for Concatentate. %@", [AJNStatus descriptionForStatusCode:status]);
    }        
    
    
    }
}



////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//
//  Objective-C Bus Object implementation for AJNSampleObject
//
////////////////////////////////////////////////////////////////////////////////

@implementation AJNSampleObject

@dynamic handle;



- (SampleObjectImpl*)busObject
{
    return static_cast<SampleObjectImpl*>(self.handle);
}

- (id)initWithBusAttachment:(AJNBusAttachment *)busAttachment onPath:(NSString *)path
{
    self = [super initWithBusAttachment:busAttachment onPath:path];
    if (self) {
        QStatus status = ER_OK;
        
        AJNInterfaceDescription *interfaceDescription;
        
    
        //
        // SampleObjectDelegate interface (org.alljoyn.bus.sample)
        //
        // create an interface description
        //
        interfaceDescription = [busAttachment createInterfaceWithName:@"org.alljoyn.bus.sample"];

    
        // add the methods to the interface description
        //
    
        status = [interfaceDescription addMethodWithName:@"Concatentate" inputSignature:@"ss" outputSignature:@"s" argumentNames:[NSArray arrayWithObjects:@"str1",@"str2",@"outStr", nil]];
        
        if (status != ER_OK && status != ER_BUS_MEMBER_ALREADY_EXISTS) {
            @throw [NSException exceptionWithName:@"BusObjectInitFailed" reason:@"Unable to add method to interface: Concatentate" userInfo:nil];
        }

    
        [interfaceDescription activate];


        // create the internal C++ bus object
        //
        SampleObjectImpl *busObject = new SampleObjectImpl(*((ajn::BusAttachment*)busAttachment.handle), [path UTF8String], (id<SampleObjectDelegate>)self);
        
        self.handle = busObject;
    }
    return self;
}

- (void)dealloc
{
    SampleObjectImpl *busObject = [self busObject];
    delete busObject;
    self.handle = nil;
}

    
- (NSString*)concatenateString:(NSString*)str1 withString:(NSString*)str2
{
    //
    // GENERATED CODE - DO NOT EDIT
    //
    // Create a category or subclass in separate .h/.m files
    @throw([NSException exceptionWithName:@"NotImplementedException" reason:@"You must override this method in a subclass" userInfo:nil]);
}

    
@end

////////////////////////////////////////////////////////////////////////////////

////////////////////////////////////////////////////////////////////////////////
//
//  Objective-C Proxy Bus Object implementation for SampleObject
//
////////////////////////////////////////////////////////////////////////////////

@interface SampleObjectProxy(Private)

@property (nonatomic, strong) AJNBusAttachment *bus;

- (ProxyBusObject*)proxyBusObject;

@end

@implementation SampleObjectProxy
    
- (NSString*)concatenateString:(NSString*)str1 withString:(NSString*)str2
{
    [self addInterfaceNamed:@"org.alljoyn.bus.sample"];
    
    // prepare the input arguments
    //
    
    Message reply(*((BusAttachment*)self.bus.handle));    
    MsgArg inArgs[2];
    
    inArgs[0].Set("s", [str1 UTF8String]);

    inArgs[1].Set("s", [str2 UTF8String]);


    // make the function call using the C++ proxy object
    //
    QStatus status = self.proxyBusObject->MethodCall([@"org.alljoyn.bus.sample" UTF8String], "Concatentate", inArgs, 2, reply, 5000);
    if (ER_OK != status) {
        NSLog(@"ERROR: ProxyBusObject::MethodCall on org.alljoyn.bus.sample failed. %@", [AJNStatus descriptionForStatusCode:status]);
        
        return nil;
            
    }

    
    // pass the output arguments back to the caller
    //
        
    return [NSString stringWithCString:reply->GetArg()->v_string.str encoding:NSUTF8StringEncoding];
        

}

@end

////////////////////////////////////////////////////////////////////////////////
