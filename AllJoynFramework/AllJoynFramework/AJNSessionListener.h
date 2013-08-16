////////////////////////////////////////////////////////////////////////////////
// Copyright 2013, Qualcomm Innovation Center, Inc.
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

#import <Foundation/Foundation.h>
#import "AJNSessionOptions.h"

/**
 * Protocol implemented by AllJoyn apps and called by AllJoyn to inform
 * the app of session related events.
 */
@protocol AJNSessionListener <NSObject>

/** Reason for the session being lost */
typedef enum{
    ALLJOYN_SESSIONLOST_INVALID                      = 0x00, /**< Invalid */
    ALLJOYN_SESSIONLOST_REMOTE_END_LEFT_SESSION      = 0x01, /**< Remote end called LeaveSession
                                                              */
    ALLJOYN_SESSIONLOST_REMOTE_END_CLOSED_ABRUPTLY   = 0x02, /**< Remote end closed abruptly */
    ALLJOYN_SESSIONLOST_REMOVED_BY_BINDER            = 0x03, /**< Session binder removed this en
                                                              dpoint by calling RemoveSessionMember */
    ALLJOYN_SESSIONLOST_LINK_TIMEOUT                 = 0x04, /**< Link was timed-out */
    ALLJOYN_SESSIONLOST_REASON_OTHER                 = 0x05 /**< Unspecified reason for session loss */
}AJNSessionLostReason;

@optional

/**
 * Called by the bus when an existing session becomes disconnected.
 *
 * @param sessionId     Id of session that was lost.
 */
- (void)sessionWasLost:(AJNSessionId)sessionId;

/**
* Called by the bus when an existing session becomes disconnected.
*
* @param sessionId     Id of session that was lost.
* @param reason        The reason for the session being lost
*
*/
- (void)sessionWasLost:(AJNSessionId)sessionId forReason:(AJNSessionLostReason)reason;

/**
 * Called by the bus when a member of a multipoint session is added.
 *
 * @param memberName    Unique name of member who was added.
 * @param sessionId     Id of session whose member(s) changed.
 */
- (void)didAddMemberNamed:(NSString *)memberName toSession:(AJNSessionId)sessionId;

/**
 * Called by the bus when a member of a multipoint session is removed.
 *
 * @param memberName    Unique name of member who was added.
 * @param sessionId     Id of session whose member(s) changed.
 */
- (void)didRemoveMemberNamed:(NSString *)memberName fromSession:(AJNSessionId)sessionId;

@end
