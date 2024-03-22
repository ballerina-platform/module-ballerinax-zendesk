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

// Configuration for Zendesk API access
configurable string zendeskDomain = ?;
configurable string username = ?;
configurable string password = ?;

public function main() returns error? {
    // Base URL for Zendesk API
    string baseUrl = string `https://${zendeskDomain}.zendesk.com`;
    // Create a client object to interact with Zendesk
    zendesk:Client zendesk = check new ({auth: {username, password}}, baseUrl);

    // Fetch solved tickets 
    zendesk:TicketsResponse solvedTicketsResponse = check zendesk->/api/v2/tickets();
    zendesk:TicketObject[] tickets = solvedTicketsResponse?.tickets ?: [];

    foreach zendesk:TicketObject ticket in tickets {
        int ticketId = ticket?.id ?: -1;
        io:println("Processing Ticket: ", ticketId);

        // Send satisfaction survey for each solved ticket
        if (ticket.status == "solved") {
            zendesk:SatisfactionRatingResponse _ = check zendesk->/api/v2/tickets/[ticketId]/satisfaction_rating.post;
        }
    }

    // Optionally, fetch and analyze satisfaction ratings
    zendesk:SatisfactionRatingsResponse ratingsResponse = check zendesk->/api/v2/satisfaction_ratings;
    foreach var rating in ratingsResponse?.satisfaction_ratings ?: [] {
        io:println("Rating: ", rating.score);
    }
}
