Feature: Database migration tests


  Background: System is in default state and database exist
    Given the system is in default state
      And the database is named test
      And database user is set to postgres
      And database password is set to postgres
      And aggregator database is in initial state


  @database
  Scenario: Check that default migration is set to 0
     When database connection is established
      And I look for the table migration_info in database
     Then I should be able to find it
     When I read current migration number from database
     Then I should see that migration #0 is returned
      And I should see 1 table in the database
      And I should see these tables in the database
          | Table name     |
          | migration_info |


  @database
  Scenario: Check database migration from version #0 to version #1
     When database connection is established
      And I look for the table migration_info in database
     Then I should be able to find it
     When I read current migration number from database
     Then I should see that migration #0 is returned
      And I should see 1 table in the database
      And I should see these tables in the database
          | Table name     |
          | migration_info |
     When I migrate aggregator database to version #1
      And I read current migration number from database
     Then I should see that migration #1 is returned
      And I should see 2 tables in the database
      And I should see these tables in the database
          | Table name     |
          | migration_info |
          | report         |


  @database
  Scenario: Check database migration from version #0 to version #2 and back to version #1
     When database connection is established
      And I look for the table migration_info in database
     Then I should be able to find it
     When I read current migration number from database
     Then I should see that migration #0 is returned
      And I should see 1 table in the database
      And I should see these tables in the database
          | Table name     |
          | migration_info |
     When I migrate aggregator database to version #2
      And I read current migration number from database
     Then I should see that migration #2 is returned
      And I should see 4 tables in the database
      And I should see these tables in the database
          | Table name     |
          | migration_info |
          | report         |
          | rule           |
          | rule_error_key |
     When I migrate aggregator database to version #1
      And I read current migration number from database
     Then I should see that migration #1 is returned
      And I should see 2 tables in the database
      And I should see these tables in the database
          | Table name     |
          | migration_info |
          | report         |


  @database
  Scenario: Check database migration from version #0 to version #3
     When database connection is established
      And I look for the table migration_info in database
     Then I should be able to find it
     When I read current migration number from database
     Then I should see that migration #0 is returned
      And I should see 1 table in the database
      And I should see these tables in the database
          | Table name     |
          | migration_info |
     When I migrate aggregator database to version #3
      And I read current migration number from database
     Then I should see that migration #3 is returned
      And I should see 5 tables in the database
      And I should see these tables in the database
          | Table name                 |
          | migration_info             |
          | report                     |
          | rule                       |
          | rule_error_key             |
          | cluster_rule_user_feedback |


  @database
  Scenario: Check database migration from version #0 to version #4
     When database connection is established
      And I look for the table migration_info in database
     Then I should be able to find it
     When I read current migration number from database
     Then I should see that migration #0 is returned
      And I should see 1 table in the database
      And I should see these tables in the database
          | Table name     |
          | migration_info |
     When I migrate aggregator database to version #4
      And I read current migration number from database
     Then I should see that migration #4 is returned
      And I should see 5 tables in the database
      And I should see these tables in the database
          | Table name                 |
          | migration_info             |
          | report                     |
          | rule                       |
          | rule_error_key             |
          | cluster_rule_user_feedback |


  @database
  Scenario: Check database migration from version #0 to version #5
     When database connection is established
      And I look for the table migration_info in database
     Then I should be able to find it
     When I read current migration number from database
     Then I should see that migration #0 is returned
      And I should see 1 table in the database
      And I should see these tables in the database
          | Table name     |
          | migration_info |
     When I migrate aggregator database to version #5
      And I read current migration number from database
     Then I should see that migration #5 is returned
      And I should see 6 tables in the database
      And I should see these tables in the database
          | Table name                 |
          | migration_info             |
          | report                     |
          | rule                       |
          | rule_error_key             |
          | cluster_rule_user_feedback |
          | consumer_error             |


  @database
  Scenario: Check database migration from version #0 to version #6
     When database connection is established
      And I look for the table migration_info in database
     Then I should be able to find it
     When I read current migration number from database
     Then I should see that migration #0 is returned
      And I should see 1 table in the database
      And I should see these tables in the database
          | Table name     |
          | migration_info |
     When I migrate aggregator database to version #6
      And I read current migration number from database
     Then I should see that migration #6 is returned
      And I should see 6 tables in the database
      And I should see these tables in the database
          | Table name                 |
          | migration_info             |
          | report                     |
          | rule                       |
          | rule_error_key             |
          | cluster_rule_user_feedback |
          | consumer_error             |


  @database
  Scenario: Check database migration from version #0 to version #7
     When database connection is established
      And I look for the table migration_info in database
     Then I should be able to find it
     When I read current migration number from database
     Then I should see that migration #0 is returned
      And I should see 1 table in the database
      And I should see these tables in the database
          | Table name     |
          | migration_info |
     When I migrate aggregator database to version #7
      And I read current migration number from database
     Then I should see that migration #7 is returned
      And I should see 7 tables in the database
      And I should see these tables in the database
          | Table name                 |
          | migration_info             |
          | report                     |
          | rule                       |
          | rule_error_key             |
          | cluster_rule_user_feedback |
          | consumer_error             |
          | cluster_rule_toggle        |


  @database
  Scenario: Check database migration from version #0 to version #8
     When database connection is established
      And I look for the table migration_info in database
     Then I should be able to find it
     When I read current migration number from database
     Then I should see that migration #0 is returned
      And I should see 1 table in the database
      And I should see these tables in the database
          | Table name     |
          | migration_info |
     When I migrate aggregator database to version #8
      And I read current migration number from database
     Then I should see that migration #8 is returned
      And I should see 7 tables in the database
      And I should see these tables in the database
          | Table name                 |
          | migration_info             |
          | report                     |
          | rule                       |
          | rule_error_key             |
          | cluster_rule_user_feedback |
          | consumer_error             |
          | cluster_rule_toggle        |


  @database
  Scenario: Check database migration from version #0 to version #9
     When database connection is established
      And I look for the table migration_info in database
     Then I should be able to find it
     When I read current migration number from database
     Then I should see that migration #0 is returned
      And I should see 1 table in the database
      And I should see these tables in the database
          | Table name     |
          | migration_info |
     When I migrate aggregator database to version #9
      And I read current migration number from database
     Then I should see that migration #9 is returned
      And I should see 7 tables in the database
      And I should see these tables in the database
          | Table name                 |
          | migration_info             |
          | report                     |
          | rule                       |
          | rule_error_key             |
          | cluster_rule_user_feedback |
          | consumer_error             |
          | cluster_rule_toggle        |


  @database
  Scenario: Check database migration from version #0 to version #10
     When database connection is established
      And I look for the table migration_info in database
     Then I should be able to find it
     When I read current migration number from database
     Then I should see that migration #0 is returned
      And I should see 1 table in the database
      And I should see these tables in the database
          | Table name     |
          | migration_info |
     When I migrate aggregator database to version #10
      And I read current migration number from database
     Then I should see that migration #10 is returned
      And I should see 7 tables in the database
      And I should see these tables in the database
          | Table name                 |
          | migration_info             |
          | report                     |
          | rule                       |
          | rule_error_key             |
          | cluster_rule_user_feedback |
          | consumer_error             |
          | cluster_rule_toggle        |
