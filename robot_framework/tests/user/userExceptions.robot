*** Settings ***
Documentation     cenarios de excessao
Resource     ../../resources/userExceptions.resource
Resource     ../../config/dev.resource



*** Test Cases ***
Update password with invalid ID
        Update pass with invalid id

*** Test Cases ***
Update password without token
        Update pass with invalid id

*** Test Cases ***
Validate password with more than 12 characters
        Update pass more than 12
*** Test Cases ***
Validate password with less than 12 characters
        Update pass less than 12
*** Test Cases ***
Validate field confirmar senha with a different pass
        Validate field with a different pass
*** Test Cases ***
Validate mandatoty password field
        validate field password as mandatory
*** Test Cases ***
Validate field without lowercase
        validate pass no lowercase

*** Test Cases ***
Validate field without uppercase
        validate pass no uppercase
*** Test Cases ***
Validate field without numbers
        validate pass no numbers
*** Test Cases ***
Validate field without special characters
        validate pass no special characters
*** Test Cases ***
Validate login with previous password
        login with previous pass
