Feature: Employer Dashboard
  @e2e-test
  Scenario: Terminate an employee
    # login
    Given I'm at the Lively homepage
    When I click the "signup-layout:login" element
    And I enter my username
    And I enter my password
    And I click the "login:log-in" element

    # find Marie Cooper EE detail page
    And I click the "employer-navbor:employees" element
    And I clear the "employee-table:search-bar" element
    And I type Cooper into the "employee-table:search-bar" element
    And I click the "employee-table-autocomplete:Cooper, Marie" element
    And I click the ".status-badge-container" css element

    # terminate
    And I click the "terminate-btn" element

    # fill out and submit the form
    And I click the "ee-termination:termination-type:base-dropdown" element
    And I click the "ee-termination:termination-type:dropdown-item-0" element
    And I click the "ee-termination:email-on-file" element
    And I type "02" into the ".compound-field.month-field.form-control" css element
    And I type "01" into the ".compound-field.day-field.form-control" css element
    And I type "2021" into the ".compound-field.year-field.form-control" css element
    And I click the "ee-termination:confirm" element
    And I click the "ee-termination:terminate" element

    # navigate back to the EE detail page (temp hack, copy and paste...)
    And I click the "employer-navbor:employees" element
    And I clear the "employee-table:search-bar" element
    And I type Cooper into the "employee-table:search-bar" element
    And I click the "employee-table-autocomplete:Cooper, Marie" element
    And I click the ".status-badge-container" css element

    # verify termination notification message
    Then The ".task-message:first-child" css element should contain "Marie Cooper has been terminated effective 02/01/2021 by Jonathan Wheeler."
  Scenario: Re-activate an employee
    # login
    Given I'm at the Lively homepage
    When I click the "signup-layout:login" element
    And I enter my username
    And I enter my password
    And I click the "login:log-in" element

    # find Marie Cooper EE detail page
    And I click the "employer-navbor:employees" element
#    And I clear the "employee-table:search-bar" element
    And I type Cooper into the "employee-table:search-bar" element
    And I click the "employee-table-autocomplete:Cooper, Marie" element
    And I click the ".status-badge-container" css element

    # reactivate
    And I click the "reactivate-btn" element

    # fill out and submit the form
    And I select the "01" option from the "date-select:input:month-non-mobile" dropdown
    And I select the "01" option from the "date-select:input:day" dropdown
    And I select the "2021" option from the "date-select:input:year" dropdown
    And I click the "ee-reactivation" element
    And I click the "app-modal:close" element

    # navigate back to the EE detail page (temp hack, copy and paste...)
    And I click the "employer-navbor:employees" element
    And I clear the "employee-table:search-bar" element
    And I type Cooper into the "employee-table:search-bar" element
    And I click the "employee-table-autocomplete:Cooper, Marie" element
    And I click the ".status-badge-container" css element

  # verify termination notification message
    Then The ".task-message:first-child" css element should contain "Marie Cooper has been re-activated by Jonathan Wheeler."
    Then It should match visual snapshot
