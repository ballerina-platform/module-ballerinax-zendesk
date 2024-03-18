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

