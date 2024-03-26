# Zendesk multi-channel support integration

This use case demonstrates how the Zendesk REST API v2 can be utilized to consolidate support requests from multiple
channels into a single platform, automating the process of ticket creation, assignment, and initial customer
communication. By streamlining this process, companies can ensure a consistent and efficient support experience for
their customers, regardless of the communication channel used.

## Prerequisites

### 1. Setup Zendesk account

Refer to the [Setup guide](https://central.ballerina.io/ballerinax/zendesk/latest#setup-guide) to set up your zendesk
account, if you do not have one.

### 2. Configuration

Update your Zendesk account related configurations in the `Config.toml` file in the example root directory:

```toml
zedeskDomain = "<domain>"
username = "<username>"
password = "<password>"
```

## Run the example

Execute the following command to run the example:

```ballerina
bal run
```
