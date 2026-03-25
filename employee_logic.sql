/*******************************************************************************
   1. PROGRAM UNITS (PROCEDURES)
   Description: Centralized logic for all application operations.
*******************************************************************************/

-- Procedure for Adding Employees
PROCEDURE add_emp IS
BEGIN
    -- Make sure fields are not empty
    IF :TXT_ID IS NULL THEN
        MESSAGE('Please enter employee ID !! ');
        GO_ITEM('TXT_ID');
        RAISE form_trigger_failure;
    ELSIF :TXT_NAME IS NULL THEN
        MESSAGE('Please enter employee name !! ');
        GO_ITEM('TXT_NAME');
        RAISE form_trigger_failure;
    ELSIF :TXT_SALARY IS NULL THEN
        MESSAGE('Please enter employee salary !! ');
        GO_ITEM('TXT_SALARY');
        RAISE form_trigger_failure;
    ELSIF :TXT_DEPT IS NULL THEN
        MESSAGE('Please enter employee department !! ');
        GO_ITEM('TXT_DEPT');
        RAISE form_trigger_failure;
    ELSIF :TXT_SALARY <= 0 THEN
        MESSAGE('Please enter a valid value !! ');
        GO_ITEM('TXT_SALARY');
        RAISE form_trigger_failure;
    END IF;

    -- To save any changes
    COMMIT_FORM;

    -- To inform the user whether the operation was successful or not
    IF FORM_SUCCESS THEN
        MESSAGE(' Successful operation ');
    ELSE
        MESSAGE('The operation was not completed !!');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        MESSAGE(' Error during add !! ' || SQLERRM); -- To show error code
END;

----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Procedure for clearing Employees data
PROCEDURE clear_screen IS
BEGIN
    -- Clear screen data
    CLEAR_FORM(NO_VALIDATE);
    -- Go to employee id text item 
    GO_ITEM('TXT_ID');
    MESSAGE('Screen cleared.');
    MESSAGE('Screen cleared.'); -- Double message to force dialog box

EXCEPTION
    WHEN OTHERS THEN
        MESSAGE('Error during clear !! '||SQLERRM);
END;

----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Procedure for deleting Employees
PROCEDURE delete_emp IS
    v_choice NUMBER;
BEGIN
    -- User confirmation message to ask user delete it or no.
    v_choice := SHOW_ALERT('ALERT_DELETE');
    
    -- Conditions
    IF v_choice = ALERT_BUTTON1 THEN
        -- Delete employee record
        DELETE_RECORD;
        -- Save changes 
        COMMIT_FORM;
        MESSAGE('Employee record is deleted '); 
        MESSAGE('Employee record is deleted ');
    ELSE
        MESSAGE('Delete cancelled');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        MESSAGE('Error during delete !! '|| SQLERRM);     
END;

----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Procedure for exiting the program
PROCEDURE exit_app IS
    v_choice NUMBER; -- 1-Yes / 2-NO
BEGIN
    v_choice := SHOW_ALERT('ALERT_EXIT');
    
    IF v_choice = ALERT_BUTTON1 THEN
        EXIT_FORM(NO_VALIDATE);
    ELSE 
        MESSAGE('Exit cancelled');
    END IF;

EXCEPTION
    WHEN OTHERS THEN 
        MESSAGE('Error during Exit !! '||SQLERRM);
END;

----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Procedure for searching
PROCEDURE search_data IS
BEGIN
    -- Make sure that user entered Employee ID
    IF :TXT_ID IS NULL THEN
        MESSAGE('Please enter Employee ID to search!');
        -- Return to employee id field
        GO_ITEM('TXT_ID');
        RAISE Form_Trigger_Failure;
    ELSE
        -- Go to the EMPLOYEES data block
        GO_BLOCK('EMPLOYEES');
        -- Search condition
        SET_BLOCK_PROPERTY('EMPLOYEES', DEFAULT_WHERE, 'EMP_ID = ' || :TXT_ID);
        -- Execute the query to retrieve emp data
        EXECUTE_QUERY;
        -- Clear the filter
        SET_BLOCK_PROPERTY('EMPLOYEES', DEFAULT_WHERE, NULL);
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        MESSAGE('Error during search !! '|| SQLERRM);
END;

----------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Procedure for updating data
PROCEDURE update_emp IS
BEGIN
    -- Make sure that fields are not empty
    IF :TXT_ID IS NULL THEN
        MESSAGE('Please enter employee ID !! ');
        GO_ITEM('TXT_ID');
        RAISE form_trigger_failure;
    ELSIF :TXT_NAME IS NULL THEN
        MESSAGE('Please enter employee name !! ');
        GO_ITEM('TXT_NAME');
        RAISE form_trigger_failure;
    ELSIF :TXT_SALARY IS NULL THEN
        MESSAGE('Please enter employee salary !! ');
        GO_ITEM('TXT_SALARY');
        RAISE form_trigger_failure;
    ELSIF :TXT_DEPT IS NULL THEN
        MESSAGE('Please enter employee department !! ');
        GO_ITEM('TXT_DEPT');
        RAISE form_trigger_failure;
    -- Salary must be positive number
    ELSIF :TXT_SALARY <= 0 THEN   
        MESSAGE('Please enter a valid value !! ');
        GO_ITEM('TXT_SALARY');
        RAISE form_trigger_failure;
    END IF;

    -- To save any changes
    COMMIT_FORM;

    -- To inform the user whether the operation was successful or not
    IF FORM_SUCCESS THEN
        MESSAGE(' Successful operation ');
    ELSE
        MESSAGE('The operation was not completed !!');
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        MESSAGE(' Error during update !!' || SQLERRM); -- To show error code
END;

----------------------------------------------------------------------------------------------------------------------------------------------------------------

/*******************************************************************************
   2. BUTTON TRIGGERS (WHEN-BUTTON-PRESSED)
   Description: How UI buttons trigger the centralized procedures.
*******************************************************************************/

-- Add Button Trigger
BEGIN
    add_emp;
END;

-- Clear Button Trigger
BEGIN
    clear_screen;
END;

-- Delete Button Trigger
BEGIN
    delete_emp;
END;

-- Exit Button Trigger
BEGIN
    exit_app;
END;

-- Search Button Trigger
BEGIN
    search_data;
END;

-- Update Button Trigger
BEGIN
    update_emp;
END;
