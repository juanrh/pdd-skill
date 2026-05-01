---
name: pdd
description: Develop software using the Prompt-Driven Development (PDD) method for AI assisted coding. You should use this skill when the user wants a structured and high quality assisted coding experience
license: Apache-2.0
metadata:
  author: Juan Rodriguez Hortala <juanrh@pm.me>
  version: "1.0"
---

# Prompt-Driven Development assistant

## Overview

**Prompt-Driven Development (PDD)** is a methodology for AI assisted coding that guides both the user and the coding agent to follow a defined software development process, to implement a new feature for a `{project_name}`. The process consists on the following **phases** (for **`{project_dir}` equals to `.agents/planning/{project_name}`**):

1. **Requirements Clarification**: Guide the user through a series of questions to refine the initial _rough idea_ and develop a thorough specification. Files: `{project_dir}/rough-idea.md` (containing the provided rough idea); `{project_dir}/idea-honing.md` (for requirements clarification)
2. **Preliminary Research**: Conduct research on relevant technologies, libraries, or existing code that could inform the design, while collaborating with the user for guidance. Directory for research notes: `{project_dir}/research/`
3. **Technical Design**: Develop a comprehensive design document based on the requirements and research. Then create a structured implementation plan with a series of steps for implementing the design. 
    - Directory for design documents: `{project_dir}/design/`
    - Directory for implementation plans: `{project_dir}/implementation/`
4. **Implementation**: Implement the implementation plan
    - Generate structured code task files to implement the plan. Directory for task files: `{project_dir}/tasks/`
    - Complete each of the tasks

Each phase can be completed in 1 or more agent sessions, using the files at `{project_dir}` as **persistent memory**.
The **project progress file** `{project_dir}/progress.md` tracks the progress folowing the PDD process. 

## File resources

For every file path specified here, you MUST interpret it as a relative path from the skill root (the directory containing this SKILL.md).

- `scripts_dir` = `./scripts`
- `help_pdd_sop` = `./assets/help-pdd.sop.md`
- `continue_pdd_sop` = `./assets/continue-pdd.sop.md`
- `setup_pdd_sop` = `./assets/0-setup-pdd.sop.md`
- `requirements_pdd_sop` = `./assets/1-requirements-pdd.sop.md`
- `research_pdd_sop` = `./assets/2-research-pdd.sop.md`
- `design_pdd_sop` = `./assets/3-design-pdd.sop.md`
- `implementation_pdd_sop` = `./assets/4-implementation-pdd.sop.md` 
- `codebase_summary_sop` = `./assets/codebase-summary.sop.md`
- `code_task_generator_sop` = `./assets/code-task-generator.sop.md`

## After loading this skill

After loading this skill you MUST follow the instructions in "### List available operations ("help")" below.

## Operations

### List available operations ("help")

Read `{help_pdd_sop}` and follow its instructions:

### Continue PDD process ("continue")

Read `{continue_pdd_sop}` and follow its instructions:

### Setup new PDD project ("setup")

Read `{setup_pdd_sop}` and follow its instructions:

### Requirements Clarification ("requirements")

Read `{requirements_pdd_sop}` and follow its instructions:

- You MUST use the default value for `project_dir`: do not ask for it

### Preliminary Research ("research")

Read `{research_pdd_sop}` and follow its instructions:

- You MUST use the default value for `project_dir`: do not ask for it

### Technical Design ("design")

Read `{design_pdd_sop}` and follow its instructions:

- You MUST use the default value for `project_dir`: do not ask for it

### Implementation ("implementation")

Read `{implementation_pdd_sop}` and follow its instructions:

- You MUST use the default value for `project_dir`: do not ask for it

### Codebase Summary ("code-summary")

Read `{codebase_summary_sop}` and follow its instructions:

**Constraints:**
- You MUST locate the existing codebase, and set `codebase_path` to the root path of the existing codebase
- You MUST use default values for all other parameters of the codebase summary SOP
- You MUST summarize the current state of the code
