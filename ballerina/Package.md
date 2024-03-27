## Overview

[Zendesk](https://www.zendesk.com/) is a customer service software company that provides a cloud-based customer support platform. It is designed to offer a seamless and efficient customer service experience, enabling businesses to manage customer interactions across multiple channels, including email, chat, phone, and social media.

The Ballerina Zendesk Connector allows developers to interact with the [Zendesk REST API V2](https://developer.zendesk.com/api-reference/ticketing/introduction/), making it easier to integrate customer support features into Ballerina applications. This connector enables the automation of Zendesk Support operations such as ticket management, user and organization management, and more.

## Setup guide

To use the Zendesk Connector in Ballerina, you must have a Zendesk account and an API token for authentication. Follow the steps below to set up the connector with your Zendesk account. If you don't have an account, you can create one by visiting [Zendesk Sign Up page](https://www.zendesk.com/register/) and completing the registration process.

### Step 1: Log in to Zendesk

1. Sign in to your Zendesk account.
2. Navigate to the dashboard.

### Step 2: Access admin center

1. Click on the **Settings** icon in the sidebar.
2. Click on **Go to Admin Center**.

   ![Zendesk Admin Center](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-zendesk/master/docs/setup/resources/1-admin-center.png)

### Step 3: Create a new connection

1. In the Admin Center, click on **Apps and integrations**.
2. Click on **Connections** under the **Connections** section.
3. Click on **Create connection** to create a new connection.

   ![Zendesk Connection Settings](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-zendesk/master/docs/setup/resources/2-create-connection.png)

### Step 4: Configure connection settings

When creating a new connection, you will be prompted to provide the following details:

- **Connection name**: A descriptive name for the connection.
- **Authentication type**: Possible options are `API key`, `Basic Auth`, `Bearer Token`, and `OAuth 2.0`.
- **Allowed domain**: The domain that the connection is allowed to access. You can use a wildcard to allow requests made
  to any subdomain by adding an asterisk (*) at the start.

  ![Zendesk Connection Configuration](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-zendesk/master/docs/setup/resources/3-connection-configuration.png)

> **Note:** The rest of the fields (e.g. `username`, `password`, `token`) will appear based on the selected authentication type.

## Quickstart

To begin using the `Zendesk` connector in your Ballerina application, you'll need to follow these steps:

### Step 1: Import the connector

First, import the `ballerinax/zendesk` package into your Ballerina project.

```ballerina
import ballerinax/zendesk;
```

### Step 2: Instantiate a new connector

Create a `zendesk:Configuration` object with your domain and API token, and initialize the connector.

```ballerina
zendesk:ConnectionConfig zendeskConfig = {
    auth: {
        username: "<username>",
        password: "<password>"
    }
};

zendesk:Client zendesk = check new (zendeskConfig, "https://<your-domain>.zendesk.com");
```

### Step 3: Invoke the connector operation

Utilize the connector's operations to manage tickets, users, organizations, etc.

#### Create a ticket

```ballerina
zendesk:TicketCreateRequest ticket = {
    ticket: {
        subject: "Subject of the ticket",
        comment: {
            body: "Body of the ticket comment"
        }
    }
};

zendesk:TicketResponse createResponse = check zendesk->/api/v2/tickets.post(ticket);
```

#### List tickets

```ballerina
zendesk:TicketsResponse tickets = check zendesk->/api/v2/tickets;
```

## Examples

The `Zendesk` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-zendesk/tree/master/examples/), covering the following use cases:

1. [Multi channel support integration](https://github.com/ballerina-platform/module-ballerinax-zendesk/tree/master/examples/multi-channel-support-integration) - Integrate Zendesk with multiple customer support channels to streamline ticket management.
2. [Customer satisfaction survey analysis](https://github.com/ballerina-platform/module-ballerinax-zendesk/tree/master/examples/customer-satisfaction-survey-analysis) - Analyze customer satisfaction survey responses to improve support services.
