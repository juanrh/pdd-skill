# Continue PDD process

## Overview

This SOP automates the progression through the Prompt-Driven Development (PDD) process by identifying the next pending phase and executing it. It reads the project progress file to determine which phase should be executed next, then runs the corresponding phase SOP.

## Parameters

- **project_name** (required): A short, descriptive name for the project.

**Constraints for parameter acquisition:**
- You MUST ask for the project_name parameter upfront
- You MUST confirm the project exists at `.agents/planning/{project_name}` before proceeding
- You MUST use appropriate tools to verify the project directory structure

## Steps

### 1. Validate Project and Read Progress

Verify the project exists and read the current progress status from the progress file.

**Constraints:**
- You MUST check that the project directory `.agents/planning/{project_name}` exists
- You MUST read the progress file `.agents/planning/{project_name}/progress.md`
- You MUST parse the progress file to determine which phases are marked as completed
- You MUST identify the first phase that is not marked as completed

### 2. Determine Next Phase

Based on the PDD phase order, determine which phase should be executed next.

**Constraints:**
- You MUST follow the PDD phase order: Requirements Clarification → Preliminary Research → Technical Design → Implementation Plan → Task Breakdown → Implementation
- You MUST skip phases that are already marked as completed in the progress file
- You MUST select the first incomplete phase in the sequence

### 3. Execute the operation for the identified phase

You MUST Execute the operation for the identified phase, as explained on "## Available operations" before.

## Examples

### Example Input
```
project_name: "my-feature"
```

## Troubleshooting

### Project Directory Not Found
If the project directory does not exist, you should guide the user to run the setup PDD project SOP first.

### Progress File Not Found
If the progress file does not exist, you should create it with the initial phase marked as pending.

### Phase Operation Not Available
If the operation for the phase is not yet implemented, you should inform the user and suggest manual progression or wait for operation availability.
