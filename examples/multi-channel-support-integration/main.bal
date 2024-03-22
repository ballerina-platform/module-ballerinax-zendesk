// Copyright (c) 2024 WSO2 LLC. (http://www.wso2.com).
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

import ballerina/io;
import ballerinax/zendesk;

// Configuration for the Zendesk client
configurable string zendeskDomain = ?;
configurable string username = ?;
configurable string password = ?;

public function main() returns error? {
    // Base URL for Zendesk API
    string baseUrl = string `https://${zendeskDomain}.zendesk.com`;
    // Create a client object to interact with Zendesk
    zendesk:Client zendesk = check new ({auth: {username, password}}, baseUrl);

    // Simulate fetching an inquiry from a multi-channel support aggregation endpoint
    // In a real-world scenario, this could be replaced with actual API calls to various platforms
    string inquiryDescription = "Customer inquiry from [Channel Name] regarding [Issue Summary]";
    string inquirySubject = "Multi-Channel Support Inquiry";

    // Step 1: Create a ticket in Zendesk for the inquiry
    zendesk:TicketCreateRequest ticketCreateRequest = {
        ticket: {
            subject: inquirySubject,
            comment: {
                body: inquiryDescription
            },
            priority: "normal"
        }
    };

    zendesk:TicketResponse createTicketResponse = check zendesk->/api/v2/tickets.post(ticketCreateRequest);
    int ticketId = createTicketResponse?.ticket?.id ?: -1;
    io:println("Ticket Created: ", ticketId);

    // Simulate a condition to update the ticket's status (e.g., inquiry addressed)
    // This is a simplified example. In a real-world application, you might check for updates or responses from the customer or support agents
    string updateDescription = "Inquiry has been addressed by the support team.";

    zendesk:TicketUpdateRequest ticketUpdateRequest = {
        ticket: {
            status: "solved",
            comment: {
                body: updateDescription,
                'public: true
            }
        }
    };

    // Step 2: Update the ticket's status to 'solved'
    zendesk:TicketUpdateResponse updateTicketResponse = check zendesk->/api/v2/tickets/[ticketId].put(ticketUpdateRequest);
    io:println("Ticket Updated: ", updateTicketResponse?.ticket?.id);
}
