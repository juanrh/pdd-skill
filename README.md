# PDD skill

This is a skill to emulate [Spec-Driven Development](https://www.youtube.com/watch?v=4qcWgPb-8Fk) as implemented on [Kiro](https://kiro.dev/docs/specs/), using the [Prompt-Driven Development](https://youtu.be/cf-WOKVn768?si=dNfaTMhOcJVYxsCk&t=2480) approach that was its predecessor.  
See more about the PDD process on the [skill](./pdd/SKILL.md) itself.

Use the PDD skill by mentioning "PDD" followed by an [operation](#usage) in your prompts. The skill guides you through each phase of the PDD process.

Watch a [demo](https://youtu.be/ykfeVzbcYnE) using the skill to develop a toy REST API.

## What is PDD?

Prompt-Driven Development (PDD) is a structured approach to AI-assisted coding that replaces unstructured "vibe coding" with a defined process: requirements clarification, research, technical design, and implementation. It serves as the predecessor to [Spec-Driven Development](https://kiro.dev/docs/specs/), as seen in Kiro.

## Installation

Copy the directory `pdd` to your coding agent skills directory (e.g. `.vibe/skills`).

## Usage

The available operations and their shorthands are:

- List available operations ("help")
- Continue PDD process ("continue")
- Setup new PDD project ("setup")
- Requirements Clarification ("requirements")
- Preliminary Research ("research")
- Technical Design ("design")
- Implementation ("implementation")
- Codebase Summary ("code-summary")

Just mention "PDD" and an operation your prompt.  

### Example prompts

- Setup a new project: "setup a new PDD project for idea.md using project_name = calc-api"
- Continue the PDD process on a new agent session: "PDD skill: continue"
- Get help: "PDD skill: help"

## Development

Install and use [`skills-ref` skills validator](https://agentskills.io/specification#validation):

```bash
## Install
uv tool install skills-ref
# Validate: this checks tokens and line limits recommended in the specification.
## Note this will fail for vendor specific frontmatter keys like Vibe's CLI `user-invocable:` 
agentskills validate pdd
```

### Design

The skill is basically an index that chooses an [Agent SOP](https://github.com/strands-agents/agent-sop) prompt that executes the corresponding phase of a PDD process.  
The PDD project folder acts as a persistent memory across agent sessions, using markdown files both to track the progress of the PDD process, and for the PDD artifacts (requirement doc, design doc, ...).  
The user is also encouraged to use a code summary agent SOP as a form of [memory bank](https://docs.cline.bot/features/memory-bank) to help the agent navigate complex codebases

## Attribution

- agent-sop-format.md, code-assist.sop.md, codebase-summary.sop.md,  code-task-generator.sop.md, pdd.sop.md: copied from https://github.com/strands-agents/agent-sop/tree/main/agent-sops under Apache License 2.0. Pieces of that content are used in several places of this project.
- FastAPI skill (pdd-test/.vibe/skills/fastapi) taken from https://github.com/fastapi/fastapi/tree/master/fastapi/.agents/skills/fastapi under MIT license.
- modern-python skill (pdd-test/.vibe/skills/modern-python) taken from https://officialskills.sh/trailofbits/skills/modern-python
