# Examples

The `ballerinax/zendesk` connector provides practical examples illustrating usage in various scenarios. Explore these [examples](https://github.com/ballerina-platform/module-ballerinax-zendesk/tree/main/examples), covering use cases like cache management, session management, and rate limiting.

1. [Multi channel support integration](https://github.com/ballerina-platform/module-ballerinax-zendesk/tree/mqin/examples/multi-channel-support-integration) - Integrate Zendesk with multiple customer support channels to streamline ticket management.

2. [Customer satisfaction survey analysis](https://github.com/ballerina-platform/module-ballerinax-zendesk/tree/mqin/examples/customer-satisfaction-survey-analysis) - Analyze customer satisfaction survey responses to improve support services.


## Prerequisites

1. Generate Zendesk credentials to authenticate the connector as described in the [Setup guide](https://central.ballerina.io/ballerinax/zendesk/latest#setup-guide).

2. For each example, create a `Config.toml` file the related configuration. Here's an example of how your `Config.toml` file should look:

    ```toml
    username="<username>"
    password="<password>"
    ```

## Running an Example

Execute the following commands to build an example from the source:

* To build an example:

    ```bash
    bal build
    ```

* To run an example:

    ```bash
    bal run
    ```

## Building the Examples with the Local Module

**Warning**: Due to the absence of support for reading local repositories for single Ballerina files, the Bala of the module is manually written to the central repository as a workaround. Consequently, the bash script may modify your local Ballerina repositories.

Execute the following commands to build all the examples against the changes you have made to the module locally:

* To build all the examples:

    ```bash
    ./build.sh build
    ```

* To run all the examples:

    ```bash
    ./build.sh run
    ```
