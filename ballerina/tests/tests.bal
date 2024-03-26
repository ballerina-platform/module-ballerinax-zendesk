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

import ballerina/log;
import ballerina/os;
import ballerina/test;

configurable boolean isLiveServer = os:getEnv("IS_LIVE_SERVER") == "true";

configurable string username = isLiveServer ? os:getEnv("ZENDESK_USERNAME") : "test";
configurable string password = isLiveServer ? os:getEnv("ZENDESK_PASSWORD") : "test";
configurable string serviceUrl = isLiveServer ? os:getEnv("ZENDESK_URL") : "http://localhost:9090/";

ConnectionConfig zendeskConfig = {
    auth: {username, password}
};

Client zendesk = test:mock(Client);

int createdTicketId = -1;

@test:BeforeSuite
function setup() returns error? {
    if (isLiveServer) {
        log:printInfo("Running tests on actual server");
    } else {
        log:printInfo("Running tests on mock server");
    }

    zendesk = check new ({auth: {username, password}}, serviceUrl);
}

@test:Config {
    groups: ["live_tests", "mock_tests"]
}
function createTicketTest() returns error? {
    TicketCreateRequest ticket = {
        ticket: {
            subject: "Test Ticket",
            comment: {
                body: "This is a test ticket"
            },
            'type: "problem",
            priority: "normal"
        }
    };

    TicketResponse response = check zendesk->/api/v2/tickets.post(ticket);
    test:assertTrue(response?.ticket?.id != ());
    createdTicketId = response?.ticket?.id ?: -1;
}

@test:Config {
    groups: ["live_tests", "mock_tests"],
    dependsOn: [createTicketTest]
}
function getTicketTest() returns error? {
    TicketResponse response = check zendesk->/api/v2/tickets/[createdTicketId]();
    test:assertEquals(response?.ticket?.id, createdTicketId, "Ticket ID mismatch");
    test:assertEquals(response?.ticket?.subject, "Test Ticket", "Ticket subject mismatch");
    test:assertEquals(response?.ticket?.priority, "normal", "Ticket priority mismatch");
    test:assertEquals(response?.ticket?.'type, "problem", "Ticket type mismatch");
}

@test:Config {
    groups: ["live_tests", "mock_tests"],
    dependsOn: []
}
function getSatisfactionRatingTest() returns error? {
    SatisfactionRatingsResponse response = check zendesk->/api/v2/satisfaction_ratings;
    test:assertTrue((response?.satisfaction_ratings != ()), "Satisfaction ratings not found");
}
