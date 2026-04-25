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

### 1. Create Detailed Design

Develop a comprehensive design document based on the requirements and research.

**Constraints:**
- You MUST create a detailed design document at {project_dir}/design/detailed-design.md
- The design MUST implement the requirements listed at {project_dir}/idea-honing.md
- The design MUST take into account all the ideas and insights documented at {project_dir}/research/
- You MUST write the design as a standalone document that can be understood without reading other project files
- You MUST include the following sections in the design document:
  - Overview
  - Detailed Requirements (consolidated from idea-honing.md)
  - Architecture Overview
  - Components and Interfaces
  - Data Models
  - Error Handling
  - Testing Strategy
  - Appendices (Technology Choices, Research Findings, Alternative Approaches)
- You MUST consolidate all requirements from the idea-honing.md file into the Detailed Requirements section
- You MUST include an appendix section that summarizes key research findings, including:
  - Major technology choices with pros and cons
  - Existing solutions analysis
  - Alternative approaches considered
  - Key constraints and limitations identified during research
- You SHOULD include diagrams or visual representations when appropriate using mermaid syntax
- You MUST generate mermaid diagrams for architectural overviews, data flow, and component relationships
- You MUST load any relevant agent skills you have available
- You MUST ensure the design addresses all requirements identified during the clarification process
- You SHOULD highlight design decisions and their rationales, referencing research findings where applicable
- You SHOULD link relevant sections of documents from {project_dir}/research/
- You MUST review the design with the user and iterate based on feedback
- You MUST explicitly ask the user if they are ready to proceed to implementation before moving to Step 7
- You MUST NOT proceed to the implementation plan step without explicit user confirmation because this could skip important design refinement
- You MUST offer to return to requirements clarification or research if gaps are identified during design

### 2. Develop Implementation Plan

Create a structured implementation plan with a series of steps for implementing the design.

**Constraints:**
- You MUST create an implementation plan at {project_dir}/implementation/plan.md
- You MUST include a checklist at the beginning of the plan.md file to track implementation progress
- You MUST use the following specific instructions when creating the implementation plan:
  ```
  Convert the design into a series of implementation steps that will build each component in a test-driven manner following agile best practices. Each step must result in a working, demoable increment of functionality. Prioritize best practices, incremental progress, and early testing, ensuring no big jumps in complexity at any stage. Make sure that each step builds on the previous steps, and ends with wiring things together. There should be no hanging or orphaned code that isn't integrated into a previous step.
  ```
- You MUST format the implementation plan as a numbered series of detailed steps
- Each step in the plan MUST be written as a clear implementation objective
- Each step MUST begin with "Step N:" where N is the sequential number
- You MUST ensure each step includes:
  - A clear objective
  - General implementation guidance
  - Test requirements for the functionality introduced in this step
  - How it integrates with previous work
  - **Demo** - explicit description of the working functionality that can be demonstrated after completing this step
- You MUST ensure each step results in working, demoable functionality that provides value
- You MUST sequence steps so that core end-to-end functionality is available as early as possible
- You MUST NOT include excessive implementation details that are already covered in the design document because this creates redundancy and potential inconsistencies
- You MUST assume that all context documents (requirements, design, research) will be available during implementation
- You MUST break down the implementation into a series of discrete, manageable steps
- You MUST ensure each step builds incrementally on previous steps
- You MUST structure each step so that tests are written before or alongside the implementation code
- You MUST include test requirements as part of each step that introduces or modifies functionality, not as separate testing-only steps
- You MUST NOT create steps that are solely dedicated to testing or "adding tests" for functionality implemented in previous steps because this violates test-driven development principles and allows untested code to accumulate
- You MUST ensure the plan covers all aspects of the design
- You SHOULD sequence steps to validate core functionality early
- You MUST ensure the checklist items correspond directly to the steps in the implementation plan

### 3. Summarize and Present Results

Provide a summary of all artifacts created and next steps.

**Constraints:**
- You MUST create a summary document at {project_dir}/summary.md
- You MUST update the **project progress file** `{project_dir}/progress.md`: mark as complete the step "Technical design"
- You MUST list all artifacts created during the process
- You MUST provide a brief overview of the design and implementation plan
- You SHOULD highlight any areas that may need further refinement
- You MUST present this summary to the user in the conversation
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
