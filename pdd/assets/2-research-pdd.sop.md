# Prompt-Driven Development

## Overview

This sop guides you through the process of transforming a rough idea into a detailed design document with an implementation plan and todo list. It follows the Prompt-Driven Development methodology to systematically refine your idea, conduct necessary research, create a comprehensive design, and develop an actionable implementation plan. The process is designed to be iterative, allowing movement between requirements clarification and research as needed.

## Parameters

- **project_name** (required): A short, descriptive name for the project. If not provided, will be generated from the rough idea
- **project_dir** (optional, default: ".agents/planning/{project_name}"): The base directory where all project files will be stored
- **rough_idea** (optional, default: "{project_dir}/rough-idea.md"): The initial concept or idea you want to develop into a detailed design

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
- You MUST ask for project_dir if it is not given and the generated default directory already exists and has contents from previous iteration

## Steps

### 1. Summarize Existing Codebase

Ask the user if they want to summarize the existing codebase. If they say yes, read `{codebase_summary_sop}` and follow its instructions to summarize the code base.

**Constraints:**
- If the user confirms, You MUST locate the existing codebase, and set `codebase_path` to the root path of the existing codebase
- If the user confirms, You MUST use default values for all other parameters of the codebase summary SOP
- If the user confirms, You MUST summarize the current state of the code

### 2. Research Relevant Information

Conduct research on relevant technologies, libraries, or existing code that could inform the design, while collaborating with the user for guidance.

**Constraints:**
- You MUST identify areas where research is needed based on the requirements listed at {project_dir}/idea-honing.md

- You MUST propose an initial research plan to the user, listing topics to investigate
- You MUST ask the user for input on the research plan, including:
  - Additional topics that should be researched
  - Specific resources (files, websites, internal tools) the user recommends
  - Areas where the user has existing knowledge to contribute
- You MUST incorporate user suggestions into the research plan
- You MUST document research findings in separate markdown files in the {project_dir}/research/ directory
- You SHOULD organize research by topic (e.g., {project_dir}/research/existing-code.md, {project_dir}/research/technologies.md)
- You MUST include mermaid diagrams when documenting system architectures, data flows, or component relationships in research
- You MUST load any relevant agent skills you have available
- You MUST include links to relevant references and sources when research is based on external materials (websites, documentation, articles, etc.)
- You MAY use tools like search_internal_code, read_internal_website, or fs_read to gather information
- You MUST ask the user whether other available search tools should also be used.
- You MUST periodically check with the user during the research process (these check-ins may involve brief dialogue to clarify feedback) to:
  - Share preliminary findings
  - Ask for feedback and additional guidance
  - Confirm if the research direction remains valuable
- You MUST summarize key findings that will inform the design
- You SHOULD cite sources and include relevant links in research documents
- You MUST ask the user if the research is sufficient before proceeding to the next step
- You MUST offer to return to requirements clarification if research uncovers new questions or considerations
- You MUST NOT automatically return to requirements clarification after research without explicit user direction because this could disrupt the user's intended workflow
- You MUST wait for the user to decide the next step after completing research

### 3. Iteration Checkpoint

Determine if further requirements clarification or research is needed before proceeding to design.

**Constraints:**
- You MUST summarize the current state of requirements and research to help the user make an informed decision
- You MUST explicitly ask the user if they want to:
  - Proceed to creating the detailed design
  - Return to requirements clarification based on research findings
  - Conduct additional research based on requirements
- You MUST support iterating between requirements clarification and research as many times as needed
- You MUST ensure that both the requirements and research are sufficiently complete before proceeding to design
- You MUST NOT proceed to the design step without explicit user confirmation because this could skip important refinement steps

### 4. Update project progress file

**Constraints:**
- You MUST update the **project progress file** `{project_dir}/progress.md`: mark as complete the step "Preliminary Research"
- You MUST suggest the user to continue the PDD process on a fresh agent session
- You MUST wait for explicit user direction before proceeding to any subsequent step

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

### Research Limitations
If you cannot access needed information:
- You SHOULD document what information is missing
- You SHOULD suggest alternative approaches based on available information
- You MAY ask the user to provide additional context or documentation
- You SHOULD continue with available information rather than blocking progress
