Feature: Main page vk.com

  Background:
    When I am on the VK main page
    And The page title is Добро пожаловать | ВКонтакте

  Scenario Outline:  Registration with valid data
    And Fill the <first_name> and <last_name>
    And Select the <birth_day>, <birth_month> and <birth_year>
    Then Try to register
    Examples:
    |first_name|last_name|birth_day|birth_month|birth_year|
    |Анна      |Каренина |1        |Января     |1970      |
    |Anna      |Karenina |1        |Января     |1970      |
    |Алексей   |Вронский |1        |Января     |1970      |
    |Aleksey   |Vronskiy |1        |Января     |1970      |

  Scenario Outline:  Registration with invalid name
    And Fill the <first_name> and <last_name>
    And Select the <birth_day>, <birth_month> and <birth_year>
    Then Try to invalid name registration
    Examples:
    |first_name|last_name|birth_day|birth_month|birth_year|
    |@@@       |@@@      |1        |Января     |1970      |
    |&&&       |&&&      |1        |Января     |1970      |

  Scenario: Registration with invalid date of birth
    Then Try to register with empty fields
    And Fill the Anna and Karenina
    Then Try to invalid date registration

  Scenario: Authorization
    And Fill login and password
    Then Try to login

  Scenario Outline: Links
    Then Click at <link> and check <title>
    Examples:
    |link             |title                                         |
    |Все продукты     |Продукты \| ВКонтакте                         |
    |о компании       |О компании \| ВКонтакте                       |
    |правила          |Пользовательское соглашение \| ВКонтакте      |
    |реклама          |VK Business \| ВКонтакте                      |
    |разработчикам    |Разработчикам \| ВКонтакте                    |
    |Switch to English|Welcome! \| VK                                |
    |index_forgot     |Восстановление доступа к странице \| ВКонтакте|


