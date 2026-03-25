/*******************************************************************************
   1. PROGRAM UNITS (PROCEDURES)
   Description: Centralized logic for all application operations.
*******************************************************************************/
-- Procedure for Adding Employees
ROCEDURE add_emp IS
BEGIN
	--Make sure fields are not empty
  if :TXT_ID is null THEN
  	message('Please enter employee ID !! ');
  	GO_ITEM('TXT_ID');
  	raise form_trigger_failure;
  elsif	:TXT_NAME is null THEN
  	message('Please enter employee name !! ');
  	GO_ITEM('TXT_NAME');
  	raise form_trigger_failure;
  elsif	:TXT_SALARY is null THEN
  	message('Please enter employee salary !! ');
  	GO_ITEM('TXT_SALARY');
  	raise form_trigger_failure;
  elsif	:TXT_DEPT is null THEN
  	message('Please enter employee departement !! ');
  	GO_ITEM('TXT_DEPT');
  	raise form_trigger_failure;
  elsif :TXT_SALARY <= 0 THEN
  	message('Please enter a valid value !! ');
  	GO_ITEM('TXT_SALARY');
  	raise form_trigger_failure;
  end if;
  -- to save any changes
  commit_form;
  --To inform the user whether the operation was successful or not
  if form_success then
  	message(' Successful operation ');
  else
  	message('The operation was not completed !!');
  end if;
  
Exception
  when others then
  	message(' Error during add !! ' || SQLERRM); --To show errore code
END;
----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Procedure for clearing Employees data
PROCEDURE clear_screen IS
BEGIN
  --clear screen data
  CLEAR_FORM(NO_VALIDATE);
  -- go to employee id text item 
  GO_ITEM('TXT_ID');
  Message('Screen cleared.');
  
Exception
	when others  then
	message('Error during clear !! '||SQLERRM);
END;
----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Procedure for deleting Employees
PROCEDURE delete_emp IS
v_choice number ;
BEGIN
	--User confirmation message to ask user delete it or no.
  v_choice := show_alert('ALERT_DELETE');
  --conditions
  if v_choice = alert_button1  then
  	-- delete employee record
  	delete_record;
  	-- save changes 
  	commit_form;
  	message('Employee record is deleted '); message('Employee record is deleted ');
  else
    message('Delete cancelled');
  end if;
  
Exception
	when others then
	message('Error during delete !! '|| SQLERRM);  	
END;
----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Procedure for exiting the program
PROCEDURE exit_app IS
v_choice  number; -- 1-Yes / 2-NO
BEGIN

  v_choice := Show_Alert('ALERT_EXIT');
  if v_choice = ALERT_BUTTON1 THEN
  	exit_form(NO_VALIDATE);--
  else 
  	MESSAGE('Exit cancelled');
  end if;
  
  Exception
  	when others then 
  		MESSAGE('Error during Exit !! '||SQLERRM);
  
END;
----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Procedure for searching
PROCEDURE search_data IS
BEGIN
	-- Make sure that user entered Employee ID
  if :TXT_ID is null then
  	message('Please enter Employee ID to search!');
  	-- Return to employee id field
  	GO_ITEM('TXT_ID');
  	RAISE Form_Trigger_Failure;
  else
  	-- Go to the EMPLOYEES data block
  	GO_BLOCK('EMPLOYEES');
    -- Search condition
    SET_BLOCK_PROPERTY('EMPLOYEES', DEFAULT_WHERE,'EMP_ID = ' || :TXT_ID); --SET_BLOCK_PROPERTY('EMPLOYEES', DEFAULT_WHERE, 'EMP_NAME LIKE ''%' || :TXT_NAME || '%'''); To search by name
    --Execute the query to retrieve emp data
    EXECUTE_QUERY;
    --Clear the filter
    SET_BLOCK_PROPERTY('EMPLOYEES', DEFAULT_WHERE, NULL);
  end if;
  
 Exception
  	when others then
  		message('Error during search !! '|| SQLERRM);
END;
----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- Procedure for updating data
PROCEDURE update_emp IS
BEGIN
	--Make sure that fields are not empty
  if :TXT_ID is null THEN
  	message('Please enter employee ID !! ');
  	GO_ITEM('TXT_ID');
  	raise form_trigger_failure;
  elsif	:TXT_NAME is null THEN
  	message('Please enter employee name !! ');
  	GO_ITEM('TXT_NAME');
  	raise form_trigger_failure;
  elsif	:TXT_SALARY is null THEN
  	message('Please enter employee salary !! ');
  	GO_ITEM('TXT_SALARY');
  	raise form_trigger_failure;
  elsif	:TXT_DEPT is null THEN
  	message('Please enter employee departement !! ');
  	GO_ITEM('TXT_DEPT');
  	raise form_trigger_failure;
  	-- salary must be +ve number
  elsif :TXT_SALARY <= 0 THEN   
  	message('Please enter a valid value !! ');
  	GO_ITEM('TXT_SALARY');
  	raise form_trigger_failure;
  end if;
  -- to save any changes
  commit_form;
  --To inform the user whether the operation was successful or not
  if form_success then
  	message(' Successful operation ');
  else
  	message('The operation was not completed !!');
  end if;
  
Exception
  when others then
  	message(' Error during update !!' || SQLERRM); --To show errore code
END;
----------------------------------------------------------------------------------------------------------------------------------------------------------------
/*******************************************************************************
   2. BUTTON TRIGGERS (WHEN-BUTTON-PRESSED)
   Description: How UI buttons trigger the centralized procedures.
*******************************************************************************/
-- Add Button Trigger
begin
	add_emp;
end;
-- clear Button Trigger
Begin
	clear_screen;
End;
-- delete Button Trigger
Begin
	delete_emp;
End;
-- exit Button Trigger
Begin
	exit_app;
End;
-- search Button Trigger
Begin
	search_data;
End;
-- update Button Trigger
Begin
  update_emp;
End;

