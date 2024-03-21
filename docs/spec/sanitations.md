_Author_: @NipunaRanasinghe \
_Created_: 2024/03/18 \
_Updated_: 2024/03/18 \
_Edition_: Swan Lake

# Sanitation for OpenAPI specification

This document records the sanitation done on top of the official OpenAPI specification from ZenDesk. 
The OpenAPI specification is obtained from the [ZenDesk API reference](https://developer.zendesk.com/api-reference/voice-api/voice-api-v2). 
These changes are done in order to improve the overall usability, and as workarounds for some known language limitations.

1. Add support for `apiKeys` and `OAuth2` security schemes. 
    * The ZenDesk API supports both `apiKeys` and `OAuth2` security schemes. 
    * The OpenAPI specification obtained from the ZenDesk API reference does not include these security schemes. 
    * Therefore, these security schemes are added to the OpenAPI specification.

2. Use `--nullable` option when generating the client using the Ballerina OpenAPI tool. 
    * The ZenDesk API reference does not properly include the "nullable" property for some the request and response schemas. 
    * Therefore, the `--nullable` option is used as a precaution to avoid potential data-binding issues in the runtime,  
      which will generate all the request/response type fields with the support to handle null values.
    * This workaround can be removed once https://github.com/ballerina-platform/ballerina-library/issues/4870 is addressed.

3. Change the types `Organization_field_id` and `User_field_id` from `int|string?` to `int|string`.
    * This is done as a post-workaround after using the `--nullable` option to generate the client, as nilable types are not supported for path parameters in Ballerina

4. Add `Accept` header (as `application/json`) to all the operations.
    * The ZenDesk OpenAPI reference does not include the `Accept` header in the operations, but the server returns an 
    unsupported media type error if the `Accept` header is not included in the requests.

## OpenAPI cli command

The following command was used to generate the Ballerina client from the OpenAPI specification. The command should be 
executed from the repository root directory.

```bash
bal openapi -i docs/spec/openapi.yaml --mode client  --license docs/license.txt -o ballerina/ --nullable
```
Note: The license year is hardcoded to 2024, change if necessary.
