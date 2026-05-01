# Prompt-Driven Development

## Overview

This SOP guides you through the process of transforming a rough idea into a detailed design document with an implementation plan and todo list. It follows the Prompt-Driven Development methodology to systematically refine your idea, conduct necessary research, create a comprehensive design, and develop an actionable implementation plan. The process is designed to be iterative, allowing movement between requirements clarification and research as needed.

## Parameters

- **rough_idea** (required): The initial concept or idea you want to develop into a detailed design
- **project_name** (optional): A short, descriptive name for the project. If not provided, will be generated from the rough idea

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
- You SHOULD save the acquired rough idea to a consistent location for use in subsequent steps
- You MUST NOT overwrite the existing project directory because this could destroy previous work and cause data loss
- You MUSE use `project_dir` = `.agents/planning/{project_name}` for the reminder of this SOP. This is the base directory where all project files will be stored.

## Steps

### 1. Create Project Structure

Set up a directory structure to organize all artifacts created during the process.

**Constraints:**
- You MUST run the command `pdd/scripts/setup_pdd_project_dir.sh {project_name}` from the project root to create and populate the project directory under `{project_dir}`
- If the script outputs a message indicating the project directory already exists (i.e., "already exists"), You MUST inform the user that a project with this name already exists, and stop the SOP immediately. This is to prevent accidental overwrites or conflicts with previous work
- After the script successfully creates the project directory, You MUST populate `{project_dir}/rough-idea.md` with the content of the `{rough_idea}` parameter
- You MUST notify the user when the structure has been created
- You MUST explain that this will ensure all project files remain in context throughout the process

### 2. Prompt the user for next steps

- You MUST provide an overview of the PDD process as explained on "## Overview" before.
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
# Research Phase Interaction

Based on your requirements, I've identified several areas that would benefit from research:

1. **Existing template solutions** - Understanding what's already available
2. **Storage and versioning approaches** - How to handle template versions and sharing
3. **Custom field validation patterns** - Best practices for dynamic field validation

I notice you have several additional MCP search tools available beyond the standard ones, including 'peccy web search' and other external search capabilities. Should I incorporate these additional search tools into the research process for broader coverage of template management solutions and industry best practices?

---

# Project Summary

I've completed the transformation of your rough idea into a detailed design with an implementation plan. Here's what was created:

## Directory Structure
- .agents/planning/template-feature/
  - rough-idea.md (your initial concept)
  - idea-honing.md (our Q&A requirements clarification)
  - research/
    - existing-templates.md
    - storage-options.md
    - external-solutions.md
  - design/
    - detailed-design.md
  - implementation/
    - plan.md (includes implementation checklist)
    - tasks/
  - summary.md (this document)

## Key Design Elements
- Template management system with CRUD operations
- Role-based access control for sharing
- Versioning system for templates
- Custom fields with validation
- Document generation engine

## Implementation Approach
The implementation plan breaks down the work into 12 incremental steps, starting with core data models and building up to the complete feature set.

## Next Steps
1. Review the detailed design document at .agents/planning/template-feature/design/detailed-design.md
2. Check the implementation plan and checklist at .agents/planning/template-feature/implementation/plan.md
3. Begin implementation following the checklist in the implementation plan

Would you like me to explain any specific part of the design or implementation plan in more detail?
```

## Troubleshooting

### Requirements Clarification Stalls
If the requirements clarification process seems to be going in circles or not making progress:
- You SHOULD suggest moving to a different aspect of the requirements
- You MAY provide examples or options to help the user make decisions
- You SHOULD summarize what has been established so far and identify specific gaps
- You MAY suggest conducting research to inform requirements decisions

### Research Limitations
If you cannot access needed information:
- You SHOULD document what information is missing
- You SHOULD suggest alternative approaches based on available information
- You MAY ask the user to provide additional context or documentation
- You SHOULD continue with available information rather than blocking progress

### Design Complexity
If the design becomes too complex or unwieldy:
- You SHOULD suggest breaking it down into smaller, more manageable components
- You SHOULD focus on core functionality first
- You MAY suggest a phased approach to implementation
- You SHOULD return to requirements clarification to prioritize features if needed
