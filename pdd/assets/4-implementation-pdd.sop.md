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

Read `{code_task_generator_sop}` and follow its instructions using the following parameters:
- `input` = `{project_dir}/implementation/plan.md`
- `step_number` = `{I}`
- `output_dir` = `{project_dir}/implementation/tasks` 
- `project_name` = `{project_name}`

**Constraints:**
- You MUST locate and read the code task generator SOP
- You MUST provide all required parameters to the SOP
- You MUST ensure the output directory exists before generating tasks
- You MUST follow all instructions in the code task generator SOP

### 3. Process Task Files

Find a **pending task file** at `{project_dir}/implementation/tasks/step{NN}` where `NN` is the zero-padded version of `I`.

**Constraints:**
- You MUST look for task files with the pattern `step{NN}.md` where NN is zero-padded (e.g., step01.md, step10.md)
- You MUST identify task files that do not start with "# DONE -" in their first heading
- If no pending task file exists, You MUST tell the user: "Please open a new session to continue with the next task, using the prompt 'PDD skill continue'"
- If a pending task file exists, You MUST proceed to read and implement it

### 4. Read Task Requirements

Read the contents of the pending task file to understand the implementation requirements.

**Constraints:**
- You MUST read the entire task file content
- You MUST identify all requirements, specifications, and constraints listed in the task file
- You MUST understand the expected outcomes and deliverables
- You MUST note any dependencies or prerequisites mentioned in the task

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

### 6. Mark Task Completion

After implementing a task file:

**Constraints:**
- You MUST mark the task as complete by adding "# DONE -" at the start of the first heading of the file
- You MUST verify the task was completed successfully by reviewing the implementation
- You MUST inform the user: "Task complete 🎉. Looking for more pending tasks"
- You MUST look for another pending task file to continue processing
- You MUST repeat steps 3-6 until no more pending task files exist for the current step

## Examples

### Example Task File Before Completion
```markdown
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
# DONE - Implement User Authentication

## Description
Create authentication endpoints and middleware

## Requirements
- Implement JWT token generation
- Add authentication middleware
- Write unit tests for authentication functions
```

### Example Implementation Process

**Step 3:** Find pending task file `step01.md`
**Step 4:** Read task requirements (authentication implementation)
**Step 5:** Implement the requirements:
- Create `auth/middleware.py` with JWT validation
- Create `auth/endpoints.py` with login/logout routes
- Create `tests/test_auth.py` with unit tests
**Step 6:** Mark task complete by adding "# DONE -" prefix

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
