
Feature: Adding

  Scenario Outline: Add two numbers
    Given the input "<input>"
    When the calculator is run
    Then the output should be "<output>"

Examples:

      | input		| output |
      | 7+5  		| 12     |
      | 175+348		| 523    |
      | 4+41 		| 45     |
      | 1243+25432	| 26675  |
      | 769+76 		| 845    |
      | 21+567   	| 588    |
      | 2+997		| 999    |
      | 234+943		| 1177   |
      | 100+2346	| 2446   |
      | 5.2+77.12	| 82.3  |
      | 7+15		| 55     |
      | 215+48956	| 4      |
      | 124+987		| 14568  |
  