# Ballerina Zendesk connector

[![Build](https://github.com/ballerina-platform/module-ballerinax-zendesk/actions/workflows/ci.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-zendesk/actions/workflows/ci.yml)
[![Trivy](https://github.com/ballerina-platform/module-ballerinax-zendesk/actions/workflows/trivy-scan.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-zendesk/actions/workflows/trivy-scan.yml)
[![GraalVM Check](https://github.com/ballerina-platform/module-ballerinax-zendesk/actions/workflows/build-with-bal-test-graalvm.yml/badge.svg)](https://github.com/ballerina-platform/module-ballerinax-zendesk/actions/workflows/build-with-bal-test-graalvm.yml)
[![GitHub Last Commit](https://img.shields.io/github/last-commit/ballerina-platform/module-ballerinax-zendesk.svg)](https://github.com/ballerina-platform/module-ballerinax-zendesk/commits/master)
[![GitHub Issues](https://img.shields.io/github/issues/ballerina-platform/ballerina-library/module/zendesk.svg?label=Open%20Issues)](https://github.com/ballerina-platform/ballerina-library/labels/module%2Fzendesk)

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

   ![Zendesk Admin Center](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-zendesk/main/docs/setup/resources/1-admin-center.png)

### Step 3: Create a new connection

1. In the Admin Center, click on **Apps and integrations**.
2. Click on **Connections** under the **Connections** section.
3. Click on **Create connection** to create a new connection.

   ![Zendesk Connection Settings](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-zendesk/main/docs/setup/resources/2-create-connection.png)

### Step 4: Configure connection settings

When creating a new connection, you will be prompted to provide the following details:

- **Connection name**: A descriptive name for the connection.
- **Authentication type**: Possible options are `API key`, `Basic Auth`, `Bearer Token`, and `OAuth 2.0`.
- **Allowed domain**: The domain that the connection is allowed to access. You can use a wildcard to allow requests made
  to any subdomain by adding an asterisk (*) at the start.

  ![Zendesk Connection Configuration](https://raw.githubusercontent.com/ballerina-platform/module-ballerinax-zendesk/main/docs/setup/resources/3-connection-configuration.png)

> **Note:** The rest of the fields (e.g. `username`, `password`, `token`) will appear based on the selected authentication type.

## Quickstart

To begin using the `Zendesk` connector in your Ballerina application, you'll need to follow these steps:

### Step 1: Import the connector

First, import the `ballerinax/zendesk` package into your Ballerina project.

```ballerina
import ballerinax/zendesk;
```

### Step 2: Instantiate a new connector

Create a `zendesk:ConnectionConfig` object with your domain and API token, and initialize the connector.

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

The `Zendesk` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-zendesk/tree/main/examples/), covering the following use cases:

1. [Multi channel support integration](https://github.com/ballerina-platform/module-ballerinax-zendesk/tree/main/examples/multi-channel-support-integration) - Integrate Zendesk with multiple customer support channels to streamline ticket management.
2. [Customer satisfaction survey analysis](https://github.com/ballerina-platform/module-ballerinax-zendesk/tree/main/examples/customer-satisfaction-survey-analysis) - Analyze customer satisfaction survey responses to improve support services.


## Issues and projects

The **Issues** and **Projects** tabs are disabled for this repository as this is part of the Ballerina library. To report bugs, request new features, start new discussions, view project boards, etc., visit the Ballerina library [parent repository](https://github.com/ballerina-platform/ballerina-library).

This repository only contains the source code for the package.

## Build from the source

### Prerequisites

1. Download and install Java SE Development Kit (JDK) version 17. You can download it from either of the following sources:

    * [Oracle JDK](https://www.oracle.com/java/technologies/downloads/)
    * [OpenJDK](https://adoptium.net/)

   > **Note:** After installation, remember to set the `JAVA_HOME` environment variable to the directory where JDK was installed.

2. Download and install [Ballerina Swan Lake](https://ballerina.io/).

3. Download and install [Docker](https://www.docker.com/get-started).

   > **Note**: Ensure that the Docker daemon is running before executing any tests.

### Build options

Execute the commands below to build from the source.

1. To build the package:

   ```bash
   ./gradlew clean build
   ```

2. To run the tests:

   ```bash
   ./gradlew clean test
   ```

3. To build the without the tests:

   ```bash
   ./gradlew clean build -x test
   ```

4. To run tests against different environment:

   ```bash
   ./gradlew clean test -Pgroups=<Comma separated groups/test cases>
   ```

5. To debug package with a remote debugger:

   ```bash
   ./gradlew clean build -Pdebug=<port>
   ```

6. To debug with the Ballerina language:

   ```bash
   ./gradlew clean build -PbalJavaDebug=<port>
   ```

7. Publish the generated artifacts to the local Ballerina Central repository:

    ```bash
    ./gradlew clean build -PpublishToLocalCentral=true
    ```

8. Publish the generated artifacts to the Ballerina Central repository:

   ```bash
   ./gradlew clean build -PpublishToCentral=true
   ```

## Contribute to Ballerina

As an open-source project, Ballerina welcomes contributions from the community.

For more information, go to the [contribution guidelines](https://github.com/ballerina-platform/ballerina-lang/blob/master/CONTRIBUTING.md).

## Code of conduct

All the contributors are encouraged to read the [Ballerina Code of Conduct](https://ballerina.io/code-of-conduct).

## Useful links

* For more information go to the [`zendesk` package](https://lib.ballerina.io/ballerinax/zendesk/latest).
* For example demonstrations of the usage, go to [Ballerina By Examples](https://ballerina.io/learn/by-example/).
* Chat live with us via our [Discord server](https://discord.gg/ballerinalang).
* Post all technical questions on Stack Overflow with the [#ballerina](https://stackoverflow.com/questions/tagged/ballerina) tag.
