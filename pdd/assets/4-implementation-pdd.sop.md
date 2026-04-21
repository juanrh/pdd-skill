# Implementation PDD SOP

## Overview

This SOP guides the implementation phase of a PDD (Plan-Driven Development) project by processing pending steps from the implementation plan, generating corresponding task files, and implementing them.

## Parameters

- **project_name** (required): A short, descriptive name for the project.
- **project_dir** (optional, default: ".agents/planning/{project_name}"): The base directory where all project files will be stored

## Steps

### 1. Identify Pending Step

Determine the step number `I` for the first pending step on the checklist at the beginning of `{project_dir}/implementation/plan.md`.

**Constraints:**
- You MUST read the checklist at the beginning of the implementation plan file
- You MUST identify the first step that is not marked as complete
- You MUST extract the step number as an integer value
- If no step is pending, You MUST complete this SOP by informing the user: "All implementation steps are complete 🚀"

### 2. Generate Task Files

First, check if `{project_dir}/implementation/tasks/step{NN}` where `NN` is the zero-padded version of `I` already exists.

**Constraints for existing task check:**
- You MUST check if a task file already exists for the current step
- If the task file exists, You MUST inform the user: "Resuming implementation of step {NN}"
- If the task file exists, You MUST skip task generation and proceed directly to step 3

If no existing task file is found, read `{code_task_generator_sop}` and follow its instructions using the following parameters:
- `input` = `{project_dir}/implementation/plan.md`
- `step_number` = `{I}`
- `output_dir` = `{project_dir}/implementation/tasks` 
- `project_name` = `{project_name}`

**Constraints for task generation:**
- You MUST locate and read the code task generator SOP
- You MUST load any relevant agent skills you have available
- You MUST provide all required parameters to the SOP
- You MUST ensure the output directory exists before generating tasks
- You MUST follow all instructions in the code task generator SOP

After generating tasks (or if resuming existing tasks), You MUST present the implementation plan to the user and ask for their feedback:
- You MUST show the user what tasks will be implemented
- You MUST ask: "What do you think about this implementation plan?"
- You MUST iterate with the user, making adjustments based on their feedback
- You MUST continue this dialogue until the user indicates they are satisfied
- Only when the user is satisfied, You MUST proceed to step 3

**Constraints for user approval:**
- You MUST clearly communicate the planned implementation approach
- You MUST be responsive to user concerns and suggestions
- You MUST make requested adjustments to the plan
- You MUST obtain explicit user approval before proceeding
- You MUST document any changes made based on user feedback

### 3. Process Task Files

Find a **pending task file** at `{project_dir}/implementation/tasks/step{NN}` where `NN` is the zero-padded version of `I`.

**Constraints:**
- You MUST look for task files with the pattern `step{NN}/task-*.code-task.md` where NN is zero-padded (e.g., step01/task-01-project-setup.code-task.md, step10/task-01-another-task.code-task.md)
- You MUST identify task files that start with "task-" in their filename (not "DONE-task-")
- If no pending task file exists, You MUST tell the user: "Please open a new session to continue with the next task, using the prompt 'PDD skill continue'"
- If a pending task file exists, You MUST proceed to read and implement it

### 4. Read Task Requirements

Read the contents of the pending task file to understand the implementation requirements.

**Constraints:**
- You MUST read the entire task file content
- You MUST identify all requirements, specifications, and constraints listed in the task file
- You MUST understand the expected outcomes and deliverables
- You MUST note any dependencies or prerequisites mentioned in the task
- You MUST load any relevant agent skills you have available

### 5. Implement Task Requirements

Perform the coding work and other changes required to implement the task as described in the task file.

**Constraints:**
- You MUST follow all instructions specified in the task file
- You MUST create or modify files as required by the task
- You MUST write clean, well-structured code following project conventions
- You MUST test your implementation to ensure it works correctly
- You MUST handle any errors or edge cases appropriately
- You MUST document your changes if required by the task
- You MUST verify that all requirements from the task file are met
- You MUST load any agent skills you have available that are relevant for implementing these requirements

### 6. Mark Task Completion

After implementing a task file:

**Constraints:**
- You MUST mark the task as complete by renaming the file from `task-*.code-task.md` to `DONE-task-*.code-task.md`
- You MUST verify the task was completed successfully by reviewing the implementation
- You MUST inform the user: "Task complete 🎉. Looking for more pending tasks"
- You MUST look for another pending task file to continue processing
- You MUST repeat steps 3-6 until no more pending task files exist for the current step

### 7. Update Codebase Summary

You MUST read `{codebase_summary_sop}` and follow its instructions to summarize the code base.

**Constraints:**
- You MUST update the codebase summary on every change
- You MUST follow all instructions in the codebase summary SOP

### 8. Validate Step Completion

In `{project_dir}/implementation/tasks/step{NN}` see if there is any files that start with "task-" in their filename (not "DONE-task-"). If there is no such file, then ask the user to check `{project_dir}/implementation/plan.md` and validate if the current step is complete, and mark it as done if so.

**Constraints:**
- You MUST check for any remaining pending task files
- You MUST ask the user to validate step completion if no pending tasks remain
- You MUST follow the user's instruction on marking the step as complete

## Examples

### Example Task File Before Completion
```markdown
Filename: step01/task-01-implement-auth.code-task.md

# Implement User Authentication

## Description
Create authentication endpoints and middleware

## Requirements
- Implement JWT token generation
- Add authentication middleware
- Write unit tests for authentication functions
```

### Example Task File After Completion
```markdown
Filename: step01/DONE-task-01-implement-auth.code-task.md

# Implement User Authentication

## Description
Create authentication endpoints and middleware

## Requirements
- Implement JWT token generation
- Add authentication middleware
- Write unit tests for authentication functions
```

### Example Implementation Process

**Step 3:** Find pending task file `step01/task-01-implement-auth.code-task.md`
**Step 4:** Read task requirements (authentication implementation)
**Step 5:** Implement the requirements:
- Create `auth/middleware.py` with JWT validation
- Create `auth/endpoints.py` with login/logout routes
- Create `tests/test_auth.py` with unit tests
**Step 6:** Mark task complete by renaming to `step01/DONE-task-01-implement-auth.code-task.md`

## Troubleshooting

### No Pending Steps Found
If the system indicates all steps are complete but you believe there are remaining tasks:
- Verify the implementation plan file exists at the correct path
- Check that the checklist format is correct with proper step numbering
- Ensure steps are properly marked as complete in the checklist

### Task Files Not Generated
If task files are not being generated:
- Verify the code task generator SOP exists and is accessible
- Check that all required parameters are provided correctly
- Ensure the output directory exists and has proper write permissions
- Review the implementation plan file for proper formatting
