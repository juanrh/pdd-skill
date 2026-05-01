# PDD Project Setup

## Overview

This SOP sets up a new Prompt-Driven Development (PDD) project by creating the directory structure and initializing all required files. Use this SOP when starting work on a new rough idea that needs a dedicated project directory under `.agents/planning/`.

## Parameters

- **rough_idea** (required): The initial concept or idea you want to develop into a detailed design
- **project_name** (optional, default: generated from the rough idea): A short, descriptive name for the project. The name MUST contain only alphanumeric characters, hyphens, and underscores (see Troubleshooting for details)

**Constraints for parameter acquisition:**
- You MUST ask for all required parameters upfront in a single prompt rather than one at a time
- You MUST support multiple input methods including:
  - Direct input: Text provided directly in the conversation
  - File path: Path to a local file containing the rough idea
  - URL: Link to an internal resource (e.g., Quip doc, wiki page)
  - Other methods: You SHOULD be open to other ways the user might want to provide the idea
- You MUST use appropriate tools to access content based on the input method
- You MUST confirm successful acquisition of all parameters before proceeding
- If project_name is not provided, You MUST generate a short kebab-case name from the rough idea, prefixed with the current date in YYYY-MM-DD format (e.g., "2026-01-30-template-manager", "2026-01-30-auth-system")
- You MUST NOT overwrite the existing project directory because this could destroy previous work and cause data loss
- You MUST use `project_dir` = `.agents/planning/{project_name}` for the remainder of this SOP. This is the base directory where all project files will be stored.

## Steps

### 1. Create Project Structure

Set up a directory structure to organize all artifacts created during the process.

**Constraints:**
- You MUST run the command `{scripts_dir}/setup_pdd_project_dir.sh {project_name}` from the project root to create and populate the project directory under `{project_dir}`
- If the script outputs a message indicating the project directory already exists (i.e., "already exists"), You MUST inform the user that a project with this name already exists, and stop the SOP immediately. This is to prevent accidental overwrites or conflicts with previous work
- After the script successfully creates the project directory, You MUST populate `{project_dir}/rough-idea.md` with the content of the `{rough_idea}` parameter
- You MUST notify the user when the structure has been created
- You MUST explain that this will ensure all project files remain in context throughout the process

### 2. Prompt the user for next steps

- You MUST provide an overview of the PDD process as described in "## Overview" above.
- You MUST explain that the process is iterative and the user can move between requirements clarification and research as needed
- You MUST wait for explicit user direction before proceeding to any subsequent step.

## Examples

### Example Input

```
Rough idea: I want to build a feature for our team's internal tool that allows users to create and manage templates for common documents we produce. Users should be able to create, edit, and share templates, as well as use them to generate new documents with custom fields.

Project name: template-feature
```

### Example Output

```
# Project Setup Complete

I've set up the PDD project directory for "template-feature". The following structure has been created under `.agents/planning/template-feature/`:

- rough-idea.md (your initial concept)
- idea-honing.md (for requirements clarification)
- research/
- design/
- implementation/
- implementation/tasks/
- progress.md (tracks completion of each PDD phase)

All project files will remain in context throughout the process, so you can resume work across multiple sessions without losing state.

---

# PDD Process Overview

The Prompt-Driven Development process consists of four phases:

1. **Requirements Clarification** - Refine your rough idea through guided questions
2. **Preliminary Research** - Investigate relevant technologies and approaches
3. **Technical Design** - Create a detailed design and implementation plan
4. **Implementation** - Execute the plan step by step

The process is iterative — you can move between requirements clarification and research as needed.

Which phase would you like to start with?
```

## Troubleshooting

### Project Already Exists
If `{scripts_dir}/setup_pdd_project_dir.sh` reports that the project directory already exists:
- You MUST inform the user that a PDD project with this name already exists
- You SHOULD suggest the user either choose a different project name or use the "continue" operation to resume work on the existing project
- You MUST NOT proceed with the setup SOP, because overwriting or mixing project directories could cause data loss and confusion

### Invalid Project Name
If `{scripts_dir}/setup_pdd_project_dir.sh` rejects the project name due to invalid characters (only alphanumeric characters, hyphens, and underscores are allowed):
- You MUST inform the user of the naming constraint: project names may only contain letters, digits, hyphens, and underscores
- You SHOULD suggest a sanitized version of the name (e.g., replace spaces with hyphens, strip special characters)
- You MUST ask the user to confirm the sanitized name or provide a different one before retrying
