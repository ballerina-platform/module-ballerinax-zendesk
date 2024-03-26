# Zendesk customer satisfaction survey analysis

This use case demonstrates how the Zendesk REST API v2 can be utilized to improve customer service quality by 
analyzing feedback from satisfaction surveys sent after resolving support tickets. The example involves a sequence 
of actions that leverage the Zendesk REST API to automate and streamline these efforts.

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
