# Running Tests

There are two test environments for running the Zendesk connector tests. The default test environment is the mock server
for Zendesk API. The other test environment is the actual Zendesk API. You can run the tests in either of these
environments and each has its own compatible set of tests.

 Test Groups | Environment                                       
-------------|---------------------------------------------------
 mock_tests  | Mock server for Zendesk API (Defualt Environment) 
 live_tests  | Zendesk API                                       

## Running Tests in the Mock Server

To execute the tests on the mock server, ensure that the `IS_LIVE_SERVER` environment variable is either set to
false or unset before initiating the tests. This environment variable can be configured within the `Config.toml` file
located in the tests directory or specified as an environmental variable.

#### Using a Config.toml File

Create a `Config.toml` file in the tests directory and add your authentication credentials and phone number for the
authorized user:

```toml
isLiveServer = false
```

#### Using Environment Variables

Alternatively, you can set your authentication credentials as environment variables:

```bash
export IS_LIVE_SERVER=false
```

Then, run the following command to run the tests:

```bash
   ./gradlew clean test
```

## Running Tests Against Zendesk Live API

#### Using a Config.toml File

Create a `Config.toml` file in the tests directory and add your authentication credentials a

```toml
isTestOnLiveServer = true
username = "<your-zendesk-username>"
password = "<your-zendesk-password>"
serviceUrl = "<your-zendesk-subdomain-service-url>"
```

#### Using Environment Variables

Alternatively, you can set your authentication credentials as environment variables:

```bash
export IS_LIVE_SERVER=true
export ZENDESK_USERNAME="<your-zendesk-username>"
export ZENDESK_PASSWORD="<your-zendesk-password>"
export ZENDESK_URL="<your-zendesk-subdomain-service-url>"
```

Then, run the following command to run the tests:

```bash
   ./gradlew clean test -Pgroups="live_tests"
```
