# List available operations ("help")

## Overview

This SOP provides a structured way to list available operations in the PDD (Prompt-Driven Development) process and guide the user to choose the next step.

## Parameters

None

## Steps

### 1. Show Available Operations

Display the following message to the user and wait for their response:

```md
**Prompt-Driven Development (PDD)** is a methodology for AI-assisted coding that guides both the user and the coding agent to follow a defined software development process.

The available operations and their shorthands are:

- List available operations ("help")
- Continue PDD process ("continue")
- Setup new PDD project ("setup")
- Requirements Clarification ("requirements")
- Preliminary Research ("research")
- Technical Design ("design")
- Implementation ("implementation")

To **track the progress** use the following files:

- Project: `{project_dir}/progress.md`
- Implementation: `{project_dir}/implementation/plan.md`
- Implementation step: `{project_dir}/implementation/tasks/step{NN}`

What would you like to do next?
```

**Constraints:**
- You MUST display the message exactly as written above.
- You MUST wait for the user's response before proceeding.

### 2. Determine User's Choice

Analyze the user's response to determine if it matches one of the available operations listed in the "## Available operations" section.

**Constraints:**
- You MUST check if the user's response matches any of the following operations:
  - "help"
  - "continue"
  - "setup"
  - "requirements"
  - "research"
  - "design"
  - "implementation"
- You MUST execute the corresponding operation if a match is found.
- If no match is found, you MUST list the available operations again and ask the user, "What would you like to do next?"
- You MUST NOT proceed without a valid user response.

## Examples

### Example User Response (Valid)

**User Input:**
```
I want to continue the PDD process.
```

**Expected Action:**
Execute the "continue" operation.

### Example User Response (Invalid)

**User Input:**
```
I'm not sure what to do.
```

**Expected Action:**
List the available operations again and ask, "What would you like to do next?"
