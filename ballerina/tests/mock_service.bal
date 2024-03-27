// Copyright (c) 2024 WSO2 LLC. (http://www.wso2.org).
//
// WSO2 LLC. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/http;
import ballerina/log;

listener http:Listener httpListener = new (9090);

http:Service mockService = service object {

    # Create Ticket
    #
    # + return - Create ticket
    resource isolated function post api/v2/tickets(@http:Payload TicketCreateRequest payload) returns TicketResponse => {
        ticket: {
            'id: 1,
            requester_id: 1,
            subject: payload?.ticket?.subject,
            comment: payload?.ticket?.comment,
            'type: payload?.ticket?.'type,
            priority: payload?.ticket?.priority
        }
    };

    # Show Ticket
    #
    # + ticket_id - The ID of the ticket
    # + return - Ticket
    resource isolated function get api/v2/tickets/[int ticket_id](string accept = "application/json") returns TicketResponse|error => {
        ticket: {
            'id: 1,
            requester_id: 1,
            subject: "Test Ticket",
            comment: {
                "body": "This is a test ticket"
            },
            'type: "problem",
            priority: "normal"
        }
    };

    # List Satisfaction Ratings
    #
    # + return - Success response
    resource isolated function get api/v2/satisfaction_ratings(string accept = "application/json") returns SatisfactionRatingsResponse|error => {
        satisfaction_ratings: [
            {
                assignee_id: 1,
                group_id: 1,
                ticket_id: 1,
                requester_id: 1,
                score: "good",
                comment: "Good"
            }
        ]
    };
};

function init() returns error? {
    if isLiveServer {
        log:printInfo("Skiping mock server initialization as the tests are running on live server");
        return;
    }
    log:printInfo("Initiating mock server");
    check httpListener.attach(mockService, "/");
    check httpListener.'start();
}
