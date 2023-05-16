@isTest
public with sharing class UuidUtils_Test {
    @isTest
    static void generateValue(){
        Test.startTest();
        String uuid = new UuidUtils().getValue();
        Pattern pattern = Pattern.compile('[0-9a-f]{8}-[0-9a-f]{4}-4[0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}');
        Matcher matcher = pattern.matcher(uuid);
        System.assertEquals(36, uuid.length());
        System.assert(matcher.matches());
        Test.stopTest();
    }

    @isTest
    static void generateValueFromValue_valid(){
        String uuidStr = new UuidUtils().getValue();
        Test.startTest();
        UuidUtils uuid = UuidUtils.valueOf(uuidStr);
        Test.stopTest();
        System.assertEquals(uuidStr, uuid.getValue());        
    }

    @isTest
    static void generateValueFromValue_invalidLength(){
        String uuidStr = 'invalid-uuid-value';
        Test.startTest();
        try {
            UuidUtils convertedUuid = UuidUtils.valueOf(uuidStr);
        } catch (Exception e) {
            String expectedError = uuidStr + ' is not a valid UUID';
            System.assert(e.getMessage().contains(expectedError));
        }
        Test.stopTest();
    }

    @isTest
    static void generateValueFromValue_invalidValue(){
        String uuidStr = 'invalid-uuid-value-invalid-uuid-value';
        Test.startTest();
        try {
            UuidUtils convertedUuid = UuidUtils.valueOf(uuidStr);
        } catch (UuidUtils.UuidUtilsException e) {
            String expectedError = uuidStr + ' is not a valid UUID';
            System.assert(e.getMessage().contains(expectedError));
        }
        Test.stopTest();
    }

    @isTest
    static void validUuid_blank(){
        Test.startTest();
        System.assertEquals(false, UuidUtils.isValid(null));
        Test.stopTest();      
    }

    @isTest
    static void validUuid_length(){
        Test.startTest();
        System.assertEquals(false, UuidUtils.isValid('invalida-uuid-length'));
        Test.stopTest();      
    }
}