
Feature: Subtraction

  Scenario Outline: Subtraction two numbers
    Given the input "<input>"
    When the calculator is run
    Then the output should be "<output>"

Examples:

      | input		| output |
      | 7-15		| -8     |
      | 175-348		| -173   |
      | 4-41		| -37    |
      | 1243-25432	| -24189 |
      | 769-76		| 693	 |
      | 21-567		| -546	 |
      | 2-997		| -995	 |
      | 234-943		| -709	 |
      | 100-2346	| -2246	 |
      | 5.2-77.12	| -71.9 |
      | 7-15		| -55	 |
      | 215-48956	| -4	 |
      | 124-987		| -14568 |