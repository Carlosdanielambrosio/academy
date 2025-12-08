*** Settings ***
Documentation     cenario feliz
Resource    ../../resources/user.resource
Resource    ../resources/dev.resource

*** Test Cases ***
Listagem users
    Listagem users

*** Test Cases ***
Count Users
    Count Users

*** Test Cases ***
Get users by id
    Get User by id

*** Test Cases ***
Update User password
    Put user password

*** Test Cases ***
Delete users
    Delete User by id


*** Test Cases ***
Create Users
     Create new user
    