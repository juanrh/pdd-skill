# PDD Preliminary Research phase SOP

## Overview

This SOP guides you through the preliminary research phase of Prompt-Driven Development. It covers summarizing the existing codebase (if applicable), researching relevant technologies and approaches to inform the design, and checkpointing with the user to determine whether the requirements and research are sufficient before proceeding to the detailed design phase. The process is designed to be iterative, allowing movement between requirements clarification and research as needed.

Run this SOP after the requirements clarification phase has completed and `{project_dir}/idea-honing.md` exists, or when the iteration checkpoint from a prior pass determines that more research is needed.

## Parameters

- **project_name** (required): A short, descriptive name for the project. If not provided, will be generated from the rough idea
- **project_dir** (optional, default: ".agents/planning/{project_name}"): The base directory where all project files will be stored

**Constraints for parameter acquisition:**
- You MUST ask for all required parameters upfront in a single prompt rather than one at a time
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
**Research planning constraints:**
- You MUST identify areas where research is needed based on the requirements listed at {project_dir}/idea-honing.md
- You MUST propose an initial research plan to the user, listing topics to investigate
- You MUST ask the user for input on the research plan, including:
  - Additional topics that should be researched
  - Specific resources (files, websites, internal tools) the user recommends
  - Areas where the user has existing knowledge to contribute
- You MUST incorporate user suggestions into the research plan
- You MUST ask the user whether other available search tools should also be used
- You MUST load any relevant agent skills you have available

**Research execution constraints:**
- You MUST document research findings in separate markdown files in the {project_dir}/research/ directory
- You SHOULD organize research by topic (e.g., {project_dir}/research/existing-code.md, {project_dir}/research/technologies.md)
- You MUST include mermaid diagrams when documenting system architectures, data flows, or component relationships in research
- You MUST include links to relevant references and sources when research is based on external materials (websites, documentation, articles, etc.)
- You SHOULD cite sources and include relevant links in research documents
- You MAY use tools like search_internal_code, read_internal_website, or fs_read to gather information

**User collaboration constraints:**
- You MUST periodically check with the user during the research process (these check-ins may involve brief dialogue to clarify feedback) to:
  - Share preliminary findings
  - Ask for feedback and additional guidance
  - Confirm if the research direction remains valuable
- You MUST summarize key findings that will inform the design
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

# Research Findings

I've completed the research phase. Here's a summary:

## Directory Structure
- .agents/planning/template-feature/
  - research/
    - existing-templates.md (analysis of existing template solutions in the codebase)
    - storage-options.md (comparison of storage and versioning approaches)
    - field-validation-patterns.md (best practices for dynamic field validation)

## Key Findings
- The existing codebase uses a `metadata` table that could be extended for templates
- JSONB fields in PostgreSQL are the recommended storage approach for dynamic fields
- Validation can be handled via JSON Schema, which the team already uses elsewhere

---

# Iteration Checkpoint

Here's where we stand:
- **Requirements**: Clarified and documented in `idea-honing.md`
- **Research**: Completed, with findings documented in the `research/` directory

Are you ready to proceed to the detailed design phase, or would you like to:
- Return to requirements clarification to refine any points based on the research findings?
- Conduct additional research on any specific topic?
```

```
# Progress File Update

Marked "Preliminary Research" as complete in .agents/planning/template-feature/progress.md.

To continue with the PDD process, start a fresh agent session and invoke the PDD skill again — it will pick up from the detailed design phase.
```

## Troubleshooting

### Research Limitations
If you cannot access needed information:
- You SHOULD document what information is missing
- You SHOULD suggest alternative approaches based on available information
- You MAY ask the user to provide additional context or documentation
- You SHOULD continue with available information rather than blocking progress
