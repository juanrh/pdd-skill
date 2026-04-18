---
name: pdd
description: Develop software using the Prompt-Driven Development (PDD) method for AI assisted coding. You should use this skill when the user wants a structured and high quality assisted coding experience
---

# Prompt-Driven Development assistant

## Overview

**Prompt-Driven Development (PDD)** is a methodology for AI assisted coding that guides both the user and the coding agent to follow a defined software development process, to implement a new feature for a __project_name__. The process consists on the following **phases**:

1. **Requirements Clarification**: Guide the user through a series of questions to refine the initial _rough idea_ and develop a thorough specification. Files: `{project_dir}/rough-idea.md` (containing the provided rough idea); `{project_dir}/idea-honing.md` (for requirements clarification)
2. **Preliminary Research**: Conduct research on relevant technologies, libraries, or existing code that could inform the design, while collaborating with the user for guidance. Directory for research notes: `{project_dir}/research/`
3. **Technical design**: Develop a comprehensive design document based on the requirements and research. Directory for design documents: `{project_dir}/design/`
4. **Implementation plan**: Create a structured implementation plan with a series of steps for implementing the design. Directory for implementation plans: `{project_dir}/implementation/`
5. **Task breakdown**: Generate structured code task files to implement the plan. Directory for task files: `{project_dir}/tasks/`
6. **Implementation**: Complete each of the tasks

for **`{project_dir}` equals to `.agents/planning/{project_name}`**. Each phase can be completed in 1 or more agent sessions, using the files at `{project_dir}` as **persistent memory**.

## Available operations

For every file path specified here, you MUST interpret it as a relative path from the parent directory of this file.  

- `pdd_sop` = `assets/pdd.sop.md`

After loading this skill you MUST follow the instructions in "### List available operations" below.

### List available operations

The available operations are:

- List available operations
- Start new PDD project

If the user prompt matches some operation, you MUST execute the corresponding operation. 
Otherwise, you MUST ask the user "What should I do next?", and then execute the corresponding operation.

### Start new PDD project

Read `{pdd_sop}` and follow its instructions, with the following modifications:

- You MUST use the default value for `project_dir`: do not ask for it
- You MUST stop after step 1.
