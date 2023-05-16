# UUID
Generate Universally Unique Identifier (UUID) in Salesforce Apex class

## Setup & Use
1. Deploy the apex classes in your org
1. Generate the UUID
```
String uuid = new UuidUtils().getValue();
```
### Example
````
String uuid = new UuidUtils().getValue();
System.debug(uuid);
//Output: bac011cc-94d1-48d8-9919-4f6396ae9147
````

## Source
[ApexUUID](https://github.com/jongpie/ApexUUID/tree/main)