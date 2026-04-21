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

### 1. Requirements Clarification

Guide the user through a series of questions to refine the initial idea and develop a thorough specification.

**Constraints:**
- You MUST create an empty {project_dir}/idea-honing.md file if it doesn't already exist
- You MUST ask ONLY ONE question at a time and wait for the user's response before asking the next question
- You MUST NOT list multiple questions for the user to answer at once because this overwhelms users and leads to incomplete responses
- You MUST NOT pre-populate answers to questions without user input because this assumes user preferences without confirmation
- You MUST NOT write multiple questions and answers to the idea-honing.md file at once because this skips the interactive clarification process
- You MUST follow this exact process for each question:
  1. Formulate a single question
  2. Append the question to {project_dir}/idea-honing.md
  3. Present the question to the user in the conversation
  4. Wait for the user's complete response, which may require brief back-and-forth dialogue across multiple turns.
  5. Once you have their complete response, append the user's answer (or final decision) to {project_dir}/idea-honing.md
  6. Only then proceed to formulating the next question
- You MAY suggest possible answers when asking a question, but MUST wait for the user's actual response
- You MUST format the idea-honing.md document with clear question and answer sections
- You MUST include the final chosen answer in the answer section
- You MAY include alternative options that were considered before the final decision
- You MUST ensure you have the user's complete response before recording it and moving to the next question
- You MUST continue asking questions until sufficient detail is gathered
- You SHOULD ask about edge cases, user experience, technical constraints, and success criteria
- You SHOULD adapt follow-up questions based on previous answers
- You MUST load any relevant agent skills you have available
- You MAY suggest options when the user is unsure about a particular aspect
- You MAY recognize when the requirements clarification process appears to have reached a natural conclusion
- You MUST explicitly ask the user if they feel the requirements clarification is complete before moving to the next step
- You MUST offer the option to conduct research if questions arise that would benefit from additional information
- You MUST be prepared to return to requirements clarification after research if new questions emerge
- You MUST NOT proceed with any other steps until explicitly directed by the user because this could skip important clarification steps

### 2. Create Requirements List

Create a new section "# Requirements List" in `{project_dir}/idea-honing.md` that consolidates all requirements gathered during the clarification process. Each requirement should have a unique code (e.g., "[R01-Endpoints]") and its own subsection.

**Constraints:**
- You MUST create a "# Requirements List" section in the idea-honing.md file
- You MUST assign a unique code to each requirement using the format [RXX-Description] where XX is a sequential number
- You MUST organize each requirement in its own subsection under the Requirements List
- You MUST include all requirements gathered during the clarification process
- You MUST maintain the original context and details of each requirement
- You MUST ensure the requirements are clearly separated and easy to reference

### 3. Review Requirements Completeness

Review the current requirements and identify any typical requirements that might be missing for this type of project. Present any missing requirements to the user for consideration.

**Constraints:**
- You MUST review the gathered requirements against typical requirements for similar projects
- You MUST identify any potentially missing requirements
- You MUST present missing requirements as an itemized list to the user
- You MUST ask the user if they want to continue iterating on requirements
- If the user wants to continue, You MUST return to Step 1 (Requirements Clarification)
- If the user is satisfied, You MUST proceed to the next step
- You MUST NOT add requirements without explicit user approval
- You MUST document the user's decision in the idea-honing.md file

### 4. Update project progress file

**Constraints:**
- You MUST update the **project progress file** `{project_dir}/progress.md`: mark as complete the step "Requirements Clarification"

## Examples

### Example Input

```
Rough idea: I want to build a feature for our team's internal tool that allows users to create and manage templates for common documents we produce. Users should be able to create, edit, and share templates, as well as use them to generate new documents with custom fields.

Project name: template-feature
```

### Example `{project_dir}/idea-honing.md` 

```
# Requirements Clarification

This document will be used to refine the initial idea through Q&A.

## Question 1: API Endpoint Structure
**Question:** What specific endpoints should the beer API expose?

**Answer:** The API should expose 3 separate endpoints:
- `/order`
- `/drink`
- `/dispose`

**Additional Decision:** Use API version v1, so endpoints will be prefixed with `/v1`

...

--- 

# Requirements List

## [R01-Endpoints]

The API should expose 3 separate endpoints:

- `/v1/order` - Order a beer
  - Body format: JSON object with fields
    - "brand": string
    - "units": integer between 0 and 10
...
```

## Troubleshooting

### Requirements Clarification Stalls
If the requirements clarification process seems to be going in circles or not making progress:
- You SHOULD suggest moving to a different aspect of the requirements
- You MAY provide examples or options to help the user make decisions
- You SHOULD summarize what has been established so far and identify specific gaps
- You MAY suggest conducting research to inform requirements decisions
