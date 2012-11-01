
Feature: Devision

  Scenario Outline: Division two numbers
    Given the input "<input>.to_f.round(2)"
    When the calculator is run
    Then the output should be "<output>"

Examples:

      | input		| output|
      | 7/15		| 0.46	|
      | 175/348		| 0.50	|
      | 4/41		| 0.09	|
      | 1243/25432	| 0.04	|
      | 769/76		| 10.11	|
      | 21/567		| 0.03	|
      | 2/997		| 0.00	|
      | 234/943		| 0.24	|
      | 100/2346	| 0.04	|
      | 5.2/77.12	| 0.06	|
      | 7/15		| 55	|
      | 215/48956	| 4     |
      | 124/987		| 14568	|