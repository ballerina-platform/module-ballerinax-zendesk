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

