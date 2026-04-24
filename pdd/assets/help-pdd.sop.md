# List available operations ("help")

## Overview

This SOP provides a structured way to list available operations in the PDD (Prompt-Driven Development) process and guide the user to choose the next step.

## Parameters

None

## Steps

### 1. Check Prior User Context

Before displaying any help message, check if the user already mentioned a command that matches one of the available operations in their previous prompts (before this SOP was loaded).

**Constraints:**
- You MUST check if the user's prior messages (from before this SOP was loaded) contain any mention of the following operations:
  - "help"
  - "continue"
  - "setup"
  - "requirements"
  - "research"
  - "design"
  - "implementation"
- If a match is found, you MUST skip directly to executing the corresponding operation without executing any other steps of this SOP, because the user has already indicated what they want to do.
- If no match is found, you MUST proceed to step 2 (Show Available Operations).
- You MUST NOT display the help message (step 2) if a prior operation match was found, since the user has already indicated their intent and showing the help would be redundant and disruptive.

### 2. Show Available Operations

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

**Recommendations**: 
- Start a new agent session for each phase (requirements, research, design, ...). The project directory will save the project context for the agent.
- Use "PDD skill continue" on the new session to quickly load the skill and move to the next phase.

---

_What would you like to do next?_
```

**Constraints:**
- You MUST display the message exactly as written above.
- You MUST wait for the user's response before proceeding.

### 3. Determine User's Choice

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
